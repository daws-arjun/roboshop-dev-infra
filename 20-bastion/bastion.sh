#!/bin/bash

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

## URL: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
# Linux
# CentOS/RHEL
# Will get commands
