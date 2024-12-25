web_apps = {
  web_app1 = {
    app_name                = "sarab-web-app1"
    app_location            = "East Asia"
    app_rg_name             = "sarab-rg"
    app_service_plan_name     = "sarab-asp"
    app_service_plan_resource_group_name="sarab-rg"
    app_settings            = null
    client_affinity_enabled = true
    enabled                 = true
    https_only              = true

    connection_string = {
      name  = "DefaultConnection"
      type  = "SQLAzure"
      value = "Server=tcp:sarab-mssql-server1.database.windows.net;Database=example-sql-db;User ID=sarabadmin;Password=P@ssw0rd!Example123;Encrypt=true;Connection Timeout=30;"
    }

  site_config = {
always_on = false 

managed_pipeline_mode = "Integrated" 

ftps_state = "Disabled" 
websockets_enabled = true 
app_command_line = "" 
remote_debugging_enabled = false 
remote_debugging_version = "VS2022" 
http2_enabled = true
}

  }
}
