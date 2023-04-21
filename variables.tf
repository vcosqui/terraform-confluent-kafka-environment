# Confluent Cloud Credentials
variable "confluent_cloud_api_key" {
  type = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

variable "environment" {
  type = object({
    id           = optional(string)
    display_name = string
  })
  validation {
    condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9_-]{0,30}[a-zA-Z0-9]$", var.environment.display_name))
    error_message = "Invalid environment name, see https://docs.confluent.io/cloud/current/access-management/hierarchy/cloud-environments.html#add-an-environment for more information."
  }
}