# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# The following configuration uses a provider which provisions [fake] resources
# to a fictitious cloud vendor called "Fake Web Services". Configuration for
# the fakewebservices provider can be found in provider.tf.
#
# After running the setup script (./scripts/setup.sh), feel free to change these
# resources and 'terraform apply' as much as you'd like! These resources are
# purely for demonstration and created in Terraform Cloud, scoped to your TFC
# user account.
#
# To review the provider and documentation for the available resources and
# schemas, see: https://registry.terraform.io/providers/hashicorp/fakewebservices
#
# If you're looking for the configuration for the remote backend, you can find that
# in backend.tf.

module "azure_naming" {
  source      = "git@github.com:makdiuk/terraform_module_azure_naming.git"
  solution    = "stacks"
  environment = "dev"
  location    = var.location
  alteration  = "01"

  tags = {
    Owner = "mneko@softserveinc.com"
  }
}

module "azure_resource_group" {
  source   = "git@github.com:makdiuk/terraform_module_azure_resource_group.git"
  name     = module.azure_naming.name
  location = var.location
  tags     = module.azure_naming.tags
}
