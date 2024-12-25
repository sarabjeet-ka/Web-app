variable "web_apps" {
  description = "Map of web app configurations"
  type = map(object({
    app_name                = string
    app_location            = string
    app_rg_name             = string
    app_service_plan_name   = string
    app_service_plan_resource_group_name=string
    app_settings            = map(string)
    client_affinity_enabled = bool
    enabled                 = bool
    https_only              = bool

    connection_string = object({
      name  = string
      type  = string
      value = string
    })

    site_config = object({
      always_on                 = bool
      managed_pipeline_mode     = string
      ftps_state                = string
      websockets_enabled        = bool
      app_command_line          = string
      remote_debugging_enabled  = bool
      remote_debugging_version  = string
      http2_enabled             = bool
    })
  }))
}
