# github-actions-runner

## Usage

Required environment variables:

- `ORGANIZATION`: e.g. EPFL-ENAC
- `ACCESS_TOKEN`: GitHub access token
- `LABELS`: Github runner labels (e.g. `deploy,prod` or `deploy,test`)

### Access Token

To create an organization access token, follow [the documentation](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-fine-grained-personal-access-token).

The following organization permission should be set:

- Self-hosted runners: Read and write

## Known instances

- [EPFL ENAC-IT Continuous Deployment](https://github.com/EPFL-ENAC/epfl-enac-deploy-action)
