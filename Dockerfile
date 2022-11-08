FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m runner \
    && mkdir /home/runner/actions-runner
WORKDIR /home/runner/actions-runner

ARG VERSION="latest"

RUN if [ "${VERSION}" = "latest" ]; then VERSION=$(curl -sX GET https://api.github.com/repos/actions/runner/releases/latest | jq .name --raw-output | sed -e "s/^v//"); fi \
    && echo ${VERSION} \
    && curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v${VERSION}/actions-runner-linux-x64-${VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64.tar.gz \
    && rm ./actions-runner-linux-x64.tar.gz 

RUN ./bin/installdependencies.sh

COPY --chown=runner:runner entrypoint.sh entrypoint.sh

USER runner

ENTRYPOINT [ "./entrypoint.sh" ]
