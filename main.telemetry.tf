resource "random_id" "telem" {
  count = var.enable_telemetry ? 1 : 0

  byte_length = 4
}

# This is the module telemetry deployment that is only created if telemetry is enabled.
# It is deployed to the resource's resource group.
resource "azurerm_resource_group_template_deployment" "telemetry" {
  count = var.enable_telemetry ? 1 : 0

  deployment_mode     = "Incremental"
  name                = local.telem_arm_deployment_name
  resource_group_name = var.resource_group_name
  tags                = null
  template_content    = local.telem_arm_template_content
  tags                = null
}
