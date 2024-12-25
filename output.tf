output "web_app_urls" {
  value = { for k, v in azurerm_linux_web_app.web_app : k => v.default_hostname }
}
