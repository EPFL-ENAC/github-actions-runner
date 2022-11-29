#!/bin/sh

# https://testdriven.io/blog/github-actions-docker/

# https://docs.github.com/en/rest/actions/self-hosted-runners#create-a-registration-token-for-an-organization
REGISTRATION_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" https://api.github.com/orgs/${ORGANIZATION}/actions/runners/registration-token | jq .token --raw-output)
REPOSITORY_URL=https://github.com/${ORGANIZATION}

./config.sh --url ${REPOSITORY_URL} --token ${REGISTRATION_TOKEN} --labels ${LABELS}

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REGISTRATION_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh &
wait $!
