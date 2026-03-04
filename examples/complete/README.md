# PolarDB MySQL MCP Complete Example

This example demonstrates the complete usage of the PolarDB MySQL MCP module, which creates a comprehensive solution for MCP-enabled visual OLAP intelligent agent applications.

## Resources Created

This example will create the following resources:

- **VPC**: Virtual Private Cloud for network isolation
- **VSwitch**: Virtual Switch for subnet management
- **PolarDB Cluster**: MySQL-compatible database cluster with SENormal category
- **PolarDB Account**: Database account with Super privileges
- **PolarDB Database**: Application database with UTF-8 character set
- **PolarDB Endpoint**: Public endpoint for external access

## Prerequisites

1. Alibaba Cloud account with appropriate permissions
2. Terraform >= 1.0 installed
3. Alibaba Cloud Provider >= 1.120.0

## Usage

1. Clone this repository and navigate to this example:

```bash
cd examples/complete
```

2. Initialize Terraform:

```bash
terraform init
```

3. Create a `terraform.tfvars` file with your specific values:

```hcl
region           = "cn-hangzhou"
environment      = "production"
account_password = "YourSecurePassword123!"
```

4. Plan the deployment:

```bash
terraform plan
```

5. Apply the configuration:

```bash
terraform apply
```

## Important Notes

- **Password Security**: The `account_password` variable is marked as sensitive. Make sure to use a strong password that meets PolarDB requirements (8-30 characters, containing at least three types: uppercase letters, lowercase letters, numbers, and special characters).

- **Security IPs**: By default, the security IP list includes `0.0.0.0/0` for demonstration purposes. In production, restrict this to specific IP ranges for better security.

- **Zone Selection**: If `availability_zone` is not specified, the module will automatically select an available zone based on PolarDB node class availability.

- **Costs**: This example creates billable resources. Make sure to destroy the resources when they're no longer needed.

## Customization

You can customize the deployment by modifying the variables in `terraform.tfvars`:

```hcl
# Network configuration
vpc_cidr_block     = "10.0.0.0/16"
vswitch_cidr_block = "10.0.1.0/24"

# Database configuration
storage_space    = 100
db_node_class    = "polar.mysql.g1.large.c"
security_ips     = ["192.168.1.0/24", "10.0.0.0/8"]

# Application configuration
account_name    = "myapp_user"
database_name   = "myapp_db"
```

## Outputs

After successful deployment, you'll get the following outputs:

- `polardb_cluster_id`: The ID of the PolarDB cluster
- `polardb_public_connection_string`: Public connection string for database access
- `polardb_console_url`: Direct link to the PolarDB console
- `vpc_id`: The ID of the created VPC
- `vswitch_id`: The ID of the created VSwitch

## Cleanup

To destroy the created resources:

```bash
terraform destroy
```

## Support

For issues related to this module, please refer to the main module documentation or create an issue in the repository.