;; Consent Management Contract
;; Manages customer data consent and permissions

(define-constant ERR_UNAUTHORIZED (err u200))
(define-constant ERR_CONSENT_EXISTS (err u201))
(define-constant ERR_CONSENT_NOT_FOUND (err u202))

;; Consent types
(define-constant CONSENT_MARKETING u1)
(define-constant CONSENT_ANALYTICS u2)
(define-constant CONSENT_PERSONALIZATION u3)

;; Customer consent records
(define-map customer-consent
  { customer-id: principal, business-id: uint, consent-type: uint }
  {
    granted: bool,
    timestamp: uint,
    expiry: uint
  }
)

;; Grant consent
(define-public (grant-consent (business-id uint) (consent-type uint) (expiry uint))
  (let ((consent-key { customer-id: tx-sender, business-id: business-id, consent-type: consent-type }))
    (map-set customer-consent
      consent-key
      {
        granted: true,
        timestamp: block-height,
        expiry: expiry
      }
    )
    (ok true)
  )
)

;; Revoke consent
(define-public (revoke-consent (business-id uint) (consent-type uint))
  (let ((consent-key { customer-id: tx-sender, business-id: business-id, consent-type: consent-type }))
    (match (map-get? customer-consent consent-key)
      consent-data (begin
        (map-set customer-consent
          consent-key
          (merge consent-data { granted: false, timestamp: block-height })
        )
        (ok true)
      )
      ERR_CONSENT_NOT_FOUND
    )
  )
)

;; Check consent status
(define-read-only (has-consent (customer-id principal) (business-id uint) (consent-type uint))
  (match (map-get? customer-consent { customer-id: customer-id, business-id: business-id, consent-type: consent-type })
    consent-data (and
      (get granted consent-data)
      (> (get expiry consent-data) block-height)
    )
    false
  )
)

;; Get consent details
(define-read-only (get-consent-details (customer-id principal) (business-id uint) (consent-type uint))
  (map-get? customer-consent { customer-id: customer-id, business-id: business-id, consent-type: consent-type })
)
