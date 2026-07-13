# Azure permissions for Terraform

For Terraform to create and manage resources in Azure, the service principal used by the provider normally needs:

- **Contributor** on the target subscription or resource group
- **User Access Administrator** if you want Terraform to create role assignments
- Access to create networking, compute, database and storage resources

## Provider values

Use these values in `terraform.tfvars` or from environment variables:

- `subscription_id`
- `tenant_id`
- `client_id`
- `client_secret`

## Common Azure CLI login flow

If you prefer Azure CLI auth during local testing:

```bash
az login
az account set --subscription "<subscription-id>"
terraform init
terraform plan
```

## Notes

- Subscription ID identifies the Azure subscription.
- Tenant ID identifies the Entra ID tenant.
- Client ID and client secret identify the service principal.
