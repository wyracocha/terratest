FROM golang:1.23.0-alpine
ARG TERRAFORM_VERSION="1.9.4"

RUN    apk update --no-cache \
	&& apk upgrade --no-cache

RUN apk add wget zip unzip
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm.zip
RUN mkdir /terraform-bin
RUN  unzip terraform_${TERRAFORM_VERSION}_linux_arm.zip -d /terraform-bin 
ENV PATH $PATH:/terraform-bin
RUN rm -rf terraform_${TERRAFORM_VERSION}_linux_arm.zip
