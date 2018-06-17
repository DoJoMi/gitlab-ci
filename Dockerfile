FROM alpine:latest

ENV VERSION="0.11.7"
ENV SHA="6b8ce67647a59b2a3f70199c304abca0ddec0e49fd060944c26f666298e23418"

RUN apk update && \
    apk add bash ca-certificates git openssl unzip curl && \
    cd /tmp

RUN curl https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip -o terraform_${VERSION}_linux_amd64.zip && \
    echo "${SHA}  terraform_${VERSION}_linux_amd64.zip" | sha256sum -c && \
    unzip terraform_${VERSION}_linux_amd64.zip -d /usr/local/bin/ && \
    rm -f terraform_${VERSION}_linux_amd64.zip && \
    rm -rf /var/cache/apk/*

CMD ["/bin/bash"]
