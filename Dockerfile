# Use the hashicorp/terraform base image
FROM hashicorp/terraform

# Set the working directory
WORKDIR /app

# Copy the Terraform configuration files to the container
COPY . /app

# Initialize Terraform
RUN terraform init

# Perform a Terraform plan
RUN terraform plan -out=tfplan

# Perform a Terraform apply
RUN terraform apply -auto-approve tfplan