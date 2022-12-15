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

## Add Continuous Deployment to PROD hosting

Create `.github/workflows/deploy-prod.yml` containing :

```yml
# https://github.com/EPFL-ENAC/github-actions-runner#readme
name: deploy-prod

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: [self-hosted, deploy, prod]
    steps:
      - uses: EPFL-ENAC/epfl-enac-deploy-action@main
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
```

## Add Continuous Deployment to TEST hosting

Create `.github/workflows/deploy-test.yml` containing :

```yml
# https://github.com/EPFL-ENAC/github-actions-runner#readme
name: deploy-test

on:
  push:
    branches:
      - develop

jobs:
  deploy:
    runs-on: [self-hosted, deploy, test]
    steps:
      - uses: EPFL-ENAC/epfl-enac-deploy-action@main
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
```
