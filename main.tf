data "azurerm_app_service_plan" "asp" {
  for_each              = var.web_apps
  name                  = each.value.app_service_plan_name
  resource_group_name   = each.value.app_service_plan_resource_group_name
}

resource "azurerm_linux_web_app" "web_app" {
  for_each = var.web_apps
  name                = each.value.app_name
  location            = each.value.app_location
  resource_group_name = each.value.app_rg_name
 service_plan_id = data.azurerm_app_service_plan.asp[each.key].id

  app_settings = each.value.app_settings

  client_affinity_enabled = each.value.client_affinity_enabled

  enabled                 = each.value.enabled
  https_only              = each.value.https_only

  connection_string {
    name  = each.value.connection_string.name
    type  = each.value.connection_string.type
    value = each.value.connection_string.value
  }

  
 
 
  site_config {
    always_on                 = each.value.site_config.always_on
    managed_pipeline_mode     = each.value.site_config.managed_pipeline_mode
    ftps_state                = each.value.site_config.ftps_state
    websockets_enabled        = each.value.site_config.websockets_enabled
    app_command_line          = each.value.site_config.app_command_line
    remote_debugging_enabled  = each.value.site_config.remote_debugging_enabled
    remote_debugging_version  = each.value.site_config.remote_debugging_version
    http2_enabled             = each.value.site_config.http2_enabled

  }

 

}
