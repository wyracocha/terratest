FROM alpine:3.10

ARG TERRAFORM_VERSION="1.9.4"
ARG GOLANG_VERSION="1.23.0"

RUN    apk update --no-cache \
	&& apk upgrade --no-cache 
RUN apk add wget zip unzip
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm.zip
RUN mkdir /terraform-bin
RUN  unzip terraform_${TERRAFORM_VERSION}_linux_arm.zip -d /terraform-bin 
ENV PATH $PATH:/terraform-bin

RUN wget https://go.dev/dl/go${GOLANG_VERSION}.linux-arm64.tar.gz
RUN mkdir /golang-bin
RUN tar -xvzf  go${GOLANG_VERSION}.linux-arm64.tar.gz -C /golang-bin
ENV PATH $PATH:/golang-bin/go/bin
#RUN go install github.com/gruntwork-io/terratest/modules/terraform@latest github.com/stretchr/testify/assert@latest
WORKDIR /app
COPY . ./main.go
RUN go mod init ibk/terratest
RUN go mod tidy