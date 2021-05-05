# Azure DB for MySQL

## Introduction

This module manages resources for Azure DB for MySQL.

## Usage

Instantiate the module by calling it from Terraform like this:

```hcl
module "azure-mysql" {
  source = "dodevops/mysql/azure"
  version = "<version>"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- azurerm

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_mysql_database.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_database) (resource)
- [azurerm_mysql_firewall_rule.firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_firewall_rule) (resource)
- [azurerm_mysql_server.server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_server) (resource)

## Required Inputs

The following input variables are required:

### admin\_password

Description: Admin password

Type: `string`

### database\_suffixes

Description: List of suffixes for databases to be created

Type: `list(string)`

### location

Description: The azure location used for azure

Type: `string`

### project

Description: Three letter project key

Type: `string`

### resource\_group

Description: Azure Resource Group to use

Type: `string`

### stage

Description: Stage for this ressource group

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### admin\_login

Description: Admin login

Type: `string`

Default: `"mysqladmin"`

### allowed\_ips

Description:     A hash of permissions to access the database server by ip. The hash key is the name suffix and each value  
    has a start and an end value.

Type:

```hcl
object({
    start = string,
    end   = string
  })
```

Default: `[]`

### backup\_retention\_days

Description: Number of days to keep backups

Type: `number`

Default: `7`

### database\_host\_sku

Description: SKU for the database server to use

Type: `string`

Default: `"GP_Gen5_2"`

### database\_storage

Description: Required database storage (in MB)

Type: `string`

Default: `"5120"`

### database\_version

Description: Database version to use

Type: `string`

Default: `"8.0"`

### public\_access

Description: Wether to allow public access to the database server

Type: `bool`

Default: `false`

### suffix

Description: Naming suffix to allow multiple instances of this module

Type: `string`

Default: `""`

## Outputs

The following outputs are exported:

### admin\_login

Description: n/a

### admin\_password

Description: n/a

### databases

Description: n/a

### server\_fqdn

Description: FQDN of the database service
<!-- END_TF_DOCS -->

## Development

Use [terraform-docs](https://terraform-docs.io/) to generate the API documentation by running

    terraform fmt .
    terraform-docs .
