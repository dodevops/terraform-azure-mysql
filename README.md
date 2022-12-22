# Azure DB for MySQL

## Introduction

This module manages resources for Azure DB for MySQL using the flexible server deployment.

More details are available in the following sources:

- [Terraform AzureRM provider flexible server resource type](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server)
- [Microsoft flexible server documentation](https://learn.microsoft.com/en-us/azure/mysql/flexible-server/)

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

- [azurerm_mysql_flexible_database.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_database) (resource)
- [azurerm_mysql_flexible_server.server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server) (resource)
- [azurerm_mysql_flexible_server_configuration.configuration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_configuration) (resource)
- [azurerm_mysql_flexible_server_configuration.require-secure-transport](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_configuration) (resource)
- [azurerm_mysql_flexible_server_configuration.tls-version](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_configuration) (resource)
- [azurerm_mysql_flexible_server_firewall_rule.firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_firewall_rule) (resource)

## Required Inputs

The following input variables are required:

### admin\_password

Description: Admin password

Type: `string`

### charset

Description: Charset for the databases, which needs to be a valid MySQL charset

Type: `string`

### collation

Description: Charset for the databases, which needs to be a valid MySQL charset

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
    has a start and an end value. For public access set start\_ip\_address to 0.0.0.0 and end\_ip\_address to  
    255.255.255.255. This variable is not used if public\_access = false.

Type:

```hcl
map(object({
    start = string,
    end   = string
  }))
```

Default: `{}`

### availability\_zone

Description: The availability zone the server will be created in

Type: `string`

Default: `"1"`

### backup\_retention\_days

Description: Number of days to keep backups

Type: `number`

Default: `7`

### configurations

Description: Additional MySQL configurations

Type: `map(string)`

Default: `{}`

### database\_host\_sku

Description: SKU for the database server to use

Type: `string`

Default: `"GP_Standard_D4ds_v4"`

### database\_storage\_autogrow

Description: Autogrow storage when limit is reached?

Type: `bool`

Default: `true`

### database\_storage\_iops

Description: IO operations per second

Type: `number`

Default: `3600`

### database\_storage\_size

Description: Required database storage (in GB)

Type: `string`

Default: `"20"`

### database\_version

Description: Database version to use

Type: `string`

Default: `"8.0.21"`

### delegated\_subnet\_id

Description: The id of a subnet that the server will be created in if private-only access is required.  
This subnet requires a service delegation definition like this:
```hcl
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
```

Type: `string`

Default: `null`

### geo\_redundant\_backup\_enabled

Description: Whether backups should be geo redundant

Type: `bool`

Default: `false`

### private\_dns\_zone\_id

Description: The id of the private dns zone when using private-only access

Type: `string`

Default: `null`

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
