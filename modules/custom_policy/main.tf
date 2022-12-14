locals {
    policy_type = {
        "config" = "Config"
        "audit_event" = "AuditEvent"
        "network" = "Network"
        "iam" = "IAM"
    }
    search_type = {
        "config" = "config"
        "audit_event" = "event"
        "network" = "network"
        "iam" = "iam"
    }
}

resource "prismacloud_policy" "this" {
    name = var.name
    policy_type = var.type
    severity = var.severity
    cloud_type = var.cloud_type
    enabled = var.enabled
    description = var.description != "" ? var.description : var.name
    rule {
        name = var.name
        criteria = prismacloud_saved_search.this.id
        parameters = {
            "savedSearch": "true",
            "withIac": "false",
        }
        rule_type = local.policy_type[var.type]
    }
}

resource "prismacloud_saved_search" "this" {
    name = var.name
    description = var.description
    search_id = prismacloud_rql_search.this.search_id
    query = prismacloud_rql_search.this.query
    time_range {
        relative {
            unit = prismacloud_rql_search.this.time_range.0.relative.0.unit
            amount = prismacloud_rql_search.this.time_range.0.relative.0.amount
        }
    }
}

resource "prismacloud_rql_search" "this" {
    search_type = local.search_type[var.type]
    query = var.rql_query

    time_range {
        relative {
            unit = var.time_unit
            amount = var.time_amount
        }
    }
}