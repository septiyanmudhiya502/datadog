variable "datadog_api_key" {
  description = "Datadog api key"
  type        = string
  default     = ""
}

variable "datadog_app_key" {
  description = "Datadog app key"
  type        = string
  default     = ""
}

variable "title" {
  type        = string
  description = "The title of the dashboard."
}

variable "description" {
  type        = string
  description = "The description of the dashboard."
}

variable "is_read_only" {
  type        = bool
  description = "Whether the dashboard is read-only or not."
  default     = true
}

variable "service_name" {
  type        = string
  description = "name of the service"
}