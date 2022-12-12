# github-actions-runner

## Usage

Required environment variables:

- `ORGANIZATION`: e.g. EPFL-ENAC
- `ACCESS_TOKEN`: GitHub access token

### Access Token

To create an organization access token, follow [the documentation](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-fine-grained-personal-access-token).

The following organization permission should be set:

- Self-hosted runners: Read and write

## Add Continuous Deployment

Create `.github/workflows/deploy.yml` containing :

```yml
name: deploy

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: deploy
    steps:
      - uses: EPFL-ENAC/epfl-enac-deploy-action@main
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
```
