locals {
  name_prefix = lower(replace("${var.prefix}-${var.environment}", "_", "-"))
  common_tags = merge(var.tags, {
    environment = var.environment
    managed_by  = "terraform"
  })
}
