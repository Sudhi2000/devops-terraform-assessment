
<!-- DevOps Terraform Assessment – Node.js Application Deployment Overview -->

- This project demonstrates a production-style DevOps workflow for deploying a Node.js application using modern infrastructure and CI/CD practices.

- The solution provisions cloud infrastructure using Terraform, builds and scans container images using Docker, and automates deployment through GitHub Actions CI/CD pipelines.

The goal of this project is to showcase:

> .Infrastructure as Code (IaC)

> .Automated CI/CD pipelines

> .Containerized application deployment

> .Security scanning and best practices

> .Production-grade operational automation

............................................................................

<!-- Architecture Overview -->

The system architecture consists of the following components:

# Developer
   │
   ▼
# GitHub Repository
   │
   ▼
# GitHub Actions CI/CD Pipeline
   │
   ├ Build & Test
   ├ Static Code Analysis
   ├ Security Scanning
   ├ Docker Image Build
   ▼
# Amazon Elastic Container Registry (ECR)
   │
   ▼
# Amazon EC2 Instance
   │
   ▼
# Docker Container
   │
   ▼
# Node.js Application

 - Infrastructure is provisioned using Terraform, and the application is deployed automatically whenever code is pushed to the repository.

............................................................................................................................

<!-- Project Structure -->

devops-terraform-assessment
│
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── backend.tf
│   ├── secrets.tf
│   ├── dev.tfvars
│   ├── qa.tfvars
│   └── prod.tfvars
│
├── app
│   ├── app.js
│   ├── package.json
│   └── Dockerfile
│
├── scripts
│   ├── deploy.sh
│   ├── rollback.sh
│   ├── health-check.sh
│   └── README.md
│
├── .github
│   └── workflows
│       └── pipeline.yml
│
└── README.md

................................................................................................................................

<!-- Infrastructure as Code (Terraform) -->

 - All cloud infrastructure is provisioned using Terraform.

The Terraform configuration creates:

> AWS VPC

> Public Subnet

> Internet Gateway

> Route Tables

> Security Groups

> EC2 Instance

> IAM Roles and Instance Profiles

> AWS Secrets Manager secrets

> Remote state storage using S3

> DynamoDB state locking

..................................................................................................................................


<!-- Remote State Configuration -->

Terraform state is stored remotely using:

> Amazon S3 – state storage

> DynamoDB – state locking

This prevents concurrent infrastructure changes.

..................................................................................................................................

<!-- Environment Separation -->

Multiple environments are supported using Terraform workspaces and variable files.

Available environments:

> dev
> qa
> prod

Example usage:

 - terraform init

 - terraform workspace new dev
   terraform apply -var-file="dev.tfvars"

 - terraform workspace new qa
   terraform apply -var-file="qa.tfvars"

 - terraform workspace new prod
   terraform apply -var-file="prod.tfvars"

.............................................................................................................................

   <!-- Application Containerization -->

 - The Node.js application is containerized using Docker.

The container image:

 > Uses a lightweight Node.js Alpine image

 > Installs dependencies

 > Exposes port 3000

 > Runs the Node.js application

 .........................................................................................................

<!-- CI/CD Pipeline -->

 - The project includes a GitHub Actions pipeline that automates the full application lifecycle.

Pipeline stages include:

# Source Stage

> Triggered on push to the main branch.

# Build Stage
 
> Install Node.js dependencies.

# Test Stage

> Run application tests.

# Static Code Analysis

> ESLint checks for coding issues.

# Security Scan

> Dependency vulnerabilities detected using npm audit.

# Container Build

> Docker image built from application source.

# Container Security Scan

> Image scanned using Trivy for vulnerabilities.

# Container Registry Push

> Image pushed to AWS ECR.

# Deployment

> ontainer deployed automatically to the EC2 instance.

# Notification Stage

> Pipeline completion notification

.........................................................................................................

<!-- Deployment Process -->

 - Deployment is performed automatically through the CI/CD pipeline.

Deployment steps:

> Pull latest container image from ECR

> Stop existing container

> Remove old container

> Start new container

> Validate application health

 - Example deployment command: 
                              docker run -d -p 3000:3000 --restart unless-stopped --name app IMAGE_NAME
                                
...........................................................................................................

<!-- Operational Automation Scripts -->

 - Production-grade automation scripts are included in the scripts directory.

# Deployment Script
 - Automates application deployment with health validation.
   
   > ./deploy.sh <image>

# Rollback Script
 - Reverts deployment to the previous working image.
   
   > ./rollback.sh <previous_image>

# Health Check Script
 - Validates application availability and response status
  
  > ./health-check.sh

These scripts include:

  - >error handling

  - >logging output

  - >meaningful exit codes

  ...........................................................................................................

<!-- DevOps and Operational Standards -->

The project follows several DevOps best practices.

# Infrastructure as Code

 - All infrastructure resources are defined using Terraform. No manual console configuration is required.

# Immutable Artifacts

 - Docker images are built once and pushed to ECR. The same image is used during deployment.

# Security Scanning

- Two layers of security scanning are implemented:

>Dependency scanning using npm audit

>Container vulnerability scanning using Trivy

# Fail-Fast Pipeline

- The CI/CD pipeline uses job dependencies to ensure failures are detected early.

.......................................................................................................................
  
<!-- Prerequisites -->

- To run this project, the following tools are required:

# AWS Account

# Terraform

# Docker

# Node.js

# Git

# GitHub repositorY

- > AWS credentials must be configured before running Terraform.

............................................................................................................

<!-- Running the Project -->

 - Step 1 – Clone Repository

      > git clone <repository-url>
      > cd devops-terraform-assessment
 
 - Step 2 – Provision Infrastructure
      
      > cd terraform
      >
      > terraform init
      > terraform workspace new dev
      > terraform apply -var-file="dev.tfvars"

 - Step 3 – Push Application Code

      > git push origin main

The CI/CD pipeline will automatically:

# build

# test

# scan

# containerize

.....................................................................................................................

<!-- Pipeline Demonstration -->
 
 - A successful pipeline run demonstrates:
   
   # build
  
   # automated testing

   # security scanning

   # container image creation

   # automated deployment

.........................................................................................................................

<!-- Future Improvements -->
 
  Potential improvements for a production environment include:

  > Kubernetes deployment instead of a single EC2 instance
  > Blue-green or rolling deployment strategies
  > Monitoring with Prometheus and Grafana
  > Centralized logging with ELK stack
  > Slack or email pipeline notifications
  > Terraform modules for reusable infrastructure components

.......................................................................................................................

<!-- Conclusion -->

 - This project demonstrates a complete DevOps workflow, including infrastructure provisioning, automated CI/CD pipelines, containerized application deployment, security scanning, and operational automation.

 - It reflects modern DevOps principles such as:

 > automation
 > repeatability
 > security
 > scalability
 > operational reliability.

........................................................................................................................





 


