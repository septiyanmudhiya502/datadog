module "default_dashboard" {
  source      = "../modules/default-dashboard"
  title       = local.title
  description = local.description

  datadog_api_key = var.datadog_api_key
  datadog_app_key = var.datadog_app_key

  service_name = local.service_name
}