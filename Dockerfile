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

# install tofu
# Download the installer script:
RUN	wget --secure-protocol=TLSv1_2 --https-only https://get.opentofu.org/install-opentofu.sh -O install-opentofu.sh
	# Give it execution permissions:
RUN chmod +x install-opentofu.sh
	# Please inspect the downloaded script
	# Run the installer:
RUN ./install-opentofu.sh --install-method apk
	# Remove the installer:
RUN rm -f install-opentofu.sh