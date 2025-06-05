;; Business Verification Contract
;; Validates and manages marketing businesses

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_BUSINESS_EXISTS (err u101))
(define-constant ERR_BUSINESS_NOT_FOUND (err u102))

;; Business verification status
(define-map verified-businesses
  { business-id: uint }
  {
    owner: principal,
    name: (string-ascii 100),
    verified: bool,
    verification-date: uint
  }
)

(define-data-var business-counter uint u0)

;; Register a new business
(define-public (register-business (name (string-ascii 100)))
  (let ((business-id (+ (var-get business-counter) u1)))
    (asserts! (is-none (map-get? verified-businesses { business-id: business-id })) ERR_BUSINESS_EXISTS)
    (map-set verified-businesses
      { business-id: business-id }
      {
        owner: tx-sender,
        name: name,
        verified: false,
        verification-date: u0
      }
    )
    (var-set business-counter business-id)
    (ok business-id)
  )
)

;; Verify a business (only contract owner)
(define-public (verify-business (business-id uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? verified-businesses { business-id: business-id })
      business-data (begin
        (map-set verified-businesses
          { business-id: business-id }
          (merge business-data { verified: true, verification-date: block-height })
        )
        (ok true)
      )
      ERR_BUSINESS_NOT_FOUND
    )
  )
)

;; Check if business is verified
(define-read-only (is-business-verified (business-id uint))
  (match (map-get? verified-businesses { business-id: business-id })
    business-data (get verified business-data)
    false
  )
)

;; Get business info
(define-read-only (get-business-info (business-id uint))
  (map-get? verified-businesses { business-id: business-id })
)
