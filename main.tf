terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

# Create a VPC
resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "Development VPC"
  }
}
#subnets:
resource "aws_subnet" "web_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.0.0/27"

  tags = {
    Name = "Web Tier Subnet"
  }
}
resource "aws_subnet" "app_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.0.32/27"

  tags = {
    Name = "App Tier Subnet"
  }
}
resource "aws_subnet" "db_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.0.64/28"

  tags = {
    Name = "DB Tier Subnet"
  }
}