# Use the official Debian-based Docker image
FROM debian:buster-slim

# Set the working directory
WORKDIR /app
COPY . /app
ADD start.sh /
RUN chmod +x /start.sh
# Install dependencies
RUN apt-get update && apt-get install -y curl unzip

# Download and install Terraform
ARG TERRAFORM_VERSION=0.15.5
RUN curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -d /usr/local/bin && \
    rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Verify Terraform installation
RUN terraform version



CMD ["/start.sh"]