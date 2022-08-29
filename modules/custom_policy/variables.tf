variable "name" {
    type = string
    description = "Name of the custom policy created."
}

variable "type" {
    type = string
    description = "Policy type, must be one of (config audit_event network iam data anomaly)"
}

variable "description" {
    type = string
    description = "value"
}

variable "cloud_type" {
    type = string
    default = "all"
    description = "Cloud type of the policy."
}
variable "severity" {
    type = string
    default = "low"
    description = "Severity of the policy, default to Low."
}

variable "enabled" {
    type = bool
    default = true
    description = "Whether the policy is enabled or not."
}

variable "rql_query" {
    type = string
    description = "RQL query to save as a saved query."
}

variable "time_unit" {
    type = string
    default = "hour"
    description = "Unit of time to use for the saved query."
}

variable "time_amount" {
    type = number
    default = 24
    description = "Amount of unit of time, i.e 24 hours."
}

variable "json_config_file" {
  type = string
  default = ".prismacloud.json"
  description = "Path to JSON configuration file for Prisma Cloud."
}