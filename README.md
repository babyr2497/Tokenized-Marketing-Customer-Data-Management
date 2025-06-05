# Tokenized Marketing Customer Data Management

A blockchain-based customer data management system built on Stacks that enables secure, transparent, and consent-driven marketing data handling through smart contracts.

## Overview

This system provides a decentralized approach to marketing customer data management, ensuring data privacy, consent management, and transparent business verification through blockchain technology.

## Architecture

The system consists of five core smart contracts:

### 1. Business Verification Contract
- Validates and registers marketing businesses
- Maintains a registry of verified businesses
- Handles business credential verification
- Manages business reputation scores

### 2. Data Collection Contract
- Securely collects and stores customer data
- Implements data encryption and access controls
- Tracks data collection events
- Ensures data integrity and immutability

### 3. Consent Management Contract
- Manages customer data usage consent
- Tracks consent history and changes
- Implements granular permission controls
- Handles consent withdrawal and updates

### 4. Segmentation Analysis Contract
- Analyzes customer data for market segmentation
- Creates customer profiles and segments
- Implements privacy-preserving analytics
- Generates insights while protecting individual privacy

### 5. Personalization Engine Contract
- Delivers personalized marketing content
- Matches customers with relevant campaigns
- Tracks engagement and effectiveness
- Respects consent boundaries

## Features

- **Decentralized Data Storage**: Customer data stored securely on blockchain
- **Consent-First Approach**: All data usage requires explicit customer consent
- **Business Verification**: Only verified businesses can access the system
- **Privacy Protection**: Advanced encryption and access controls
- **Transparent Operations**: All data operations are recorded on blockchain
- **Granular Permissions**: Fine-grained control over data access and usage
- **Audit Trail**: Complete history of all data interactions
- **GDPR Compliance**: Built-in support for data protection regulations

## Smart Contracts

### Business Verification (`business-verification.clar`)
- `register-business`: Register a new marketing business
- `verify-business`: Verify business credentials
- `get-business-status`: Check business verification status
- `update-reputation`: Update business reputation score

### Data Collection (`data-collection.clar`)
- `collect-data`: Collect customer data with consent
- `get-customer-data`: Retrieve customer data (with permissions)
- `update-data`: Update existing customer data
- `delete-data`: Remove customer data (GDPR compliance)

### Consent Management (`consent-management.clar`)
- `grant-consent`: Grant data usage consent
- `revoke-consent`: Withdraw consent
- `update-consent`: Modify consent preferences
- `check-consent`: Verify consent status

### Segmentation Analysis (`segmentation-analysis.clar`)
- `create-segment`: Create customer segments
- `analyze-segment`: Perform segment analysis
- `get-segment-data`: Retrieve segment information
- `update-segment`: Modify segment criteria

### Personalization Engine (`personalization-engine.clar`)
- `create-campaign`: Create personalized campaigns
- `match-customers`: Match customers to campaigns
- `track-engagement`: Track campaign engagement
- `optimize-content`: Optimize personalization algorithms

## Installation

1. Clone the repository:
```bash
git clone https://github.com/your-org/tokenized-marketing-cdm.git
cd tokenized-marketing-cdm
```

2. Install dependencies:
```bash
npm install
```

3. Set up your Stacks development environment:
```bash
npm install -g @stacks/cli
```

## Testing

Run the test suite using Vitest:

```bash
npm test
```

Run specific contract tests:
```bash
npm test business-verification
npm test data-collection
npm test consent-management
npm test segmentation-analysis
npm test personalization-engine
```

## Deployment

### Local Development
```bash
stacks-node start --config=Stacks-local.toml
```

### Testnet Deployment
```bash
stacks deploy --network=testnet
```

### Mainnet Deployment
```bash
stacks deploy --network=mainnet
```

## Usage Examples

### Register a Business
```clarity
(contract-call? .business-verification register-business 
  "Acme Marketing Inc" 
  "marketing@acme.com" 
  "https://acme.com")
```

### Collect Customer Data
```clarity
(contract-call? .data-collection collect-data 
  customer-id 
  data-hash 
  consent-id)
```

### Grant Consent
```clarity
(contract-call? .consent-management grant-consent 
  customer-id 
  business-id 
  (list "email" "analytics" "personalization"))
```

## Data Privacy & Security

- **Encryption**: All sensitive data is encrypted before storage
- **Access Controls**: Role-based access control system
- **Consent Verification**: All data access requires valid consent
- **Audit Logging**: Complete audit trail of all operations
- **Data Minimization**: Only necessary data is collected and stored
- **Right to Erasure**: Customers can request data deletion

## Compliance

This system is designed to comply with:
- **GDPR** (General Data Protection Regulation)
- **CCPA** (California Consumer Privacy Act)
- **PIPEDA** (Personal Information Protection and Electronic Documents Act)
- **Other regional data protection laws**

## API Reference

### Business Verification API
- `GET /api/business/status/{business-id}`
- `POST /api/business/register`
- `PUT /api/business/verify`

### Data Collection API
- `POST /api/data/collect`
- `GET /api/data/customer/{customer-id}`
- `DELETE /api/data/customer/{customer-id}`

### Consent Management API
- `POST /api/consent/grant`
- `DELETE /api/consent/revoke`
- `GET /api/consent/status`

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Testing Guidelines

- Write comprehensive tests for all contract functions
- Test both success and failure scenarios
- Include edge cases and boundary conditions
- Maintain test coverage above 90%

## Security Considerations

- Regular security audits recommended
- Follow Clarity best practices
- Implement proper access controls
- Validate all inputs
- Handle errors gracefully

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support and questions:
- Create an issue on GitHub
- Contact the development team
- Check the documentation wiki

## Roadmap

- [ ] Advanced analytics dashboard
- [ ] Multi-chain support
- [ ] Enhanced privacy features
- [ ] Mobile SDK
- [ ] Integration with major marketing platforms

## Acknowledgments

- Stacks Foundation for blockchain infrastructure
- Community contributors
- Security audit partners
