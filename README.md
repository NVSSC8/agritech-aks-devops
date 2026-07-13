# AgriTech Marketplace - Phase 2 Terraform + Frontend

This package contains:

- Modular Terraform for Azure
- Remote state bootstrap
- Your frontend files
- The backend JAR artifact
- VM cloud-init so the website opens immediately on the public IP

## What is required in `terraform.tfvars`

For Terraform authentication, provide:

- `subscription_id`
- `tenant_id`
- `client_id`
- `client_secret`

These are for the Azure service principal that Terraform will use.

## Do you need full backend code?

No, not if the JAR is already built and you only want to deploy it.  
You need the full backend source code only when you want to change the backend and rebuild the JAR.

## Folder layout

```text
bootstrap/
infra/
  artifacts/
  modules/
frontend/
docs/
```

## Important behavior

- Nginx serves the frontend.
- `static.html` is the home page.
- `/pages/login.html`, `/pages/register.html`, and `/pages/cart.html` are included.
- The backend JAR is included as an artifact for manual or scripted deployment.
