FROM hashicorp/terraform:1.2.4
WORKDIR /infra
ENTRYPOINT [""]
ARG KUBECTL_VERSION="1.25"

RUN \
  apk update && \
  apk add bash py-pip jq && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make curl && \
  pip install azure-cli && \
  curl -sLO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv ./kubectl /usr/local/bin/kubectl && \
  apk del --purge build

COPY ./ ./
