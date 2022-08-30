variable "name" {
    type = string
    description = "Name of the custom policy created."
}

variable "type" {
    type = string
    default = "config"
    description = "Policy type, must be one of (config audit_event network iam)"
    validation {
        condition = contains(["config","audit_event", "network", "iam"], var.type)
        error_message = "Must be one of the following: config audit_event network iam."
    }
}

variable "description" {
    type = string
    description = "Description of the policy and saved search."
}

variable "cloud_type" {
    type = string
    default = "all"
    description = "Cloud type of the policy."
    validation {
        condition = contains(["aws", "azure", "gcp", "alibaba_cloud", "all"], var.cloud_type)
        error_message = "Must be one of the following: aws azure gcp alibaba_cloud all."
    }
}

variable "severity" {
    type = string
    default = "low"
    description = "Severity of the policy, default to Low."
    validation {
        condition = contains(["low", "medium", "high"], var.severity)
        error_message = "Severity must be one of the following: low medium high."
    }
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

variable "labels" {
    type = set(string)
    default = ["terraform"]
    description = "Set of unique labels to add to the policy"
}