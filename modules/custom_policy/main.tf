resource "prismacloud_policy" "this" {
    name = var.policy_name
    policy_type = var.policy_type
    severity = var.severity
    cloud_type = var.cloud_type
    enabled = var.enabled
    description = var.description
    rule {
        name = var.policy_name
        criteria = prismacloud_saved_search.this.id
        parameters = {
            "savedSearch": "true",
            "withIac": "false",
        }
        rule_type = var.policy_type
    }
}

resource "prismacloud_saved_search" "this" {
    name = var.policy_name
    description = "Made by terraform"
    search_id = prismacloud_rql_search.x.search_id
    query = prismacloud_rql_search.x.query
    time_range {
        relative {
            unit = prismacloud_rql_search.this.time_range.0.relative.0.unit
            amount = prismacloud_rql_search.this.time_range.0.relative.0.amount
        }
    }
}

resource "prismacloud_rql_search" "this" {
    search_type = var.policy_type
    query = var.rql_query

    time_range {
        relative {
            unit = var.time_unit
            amount = var.time_amount
        }
    }
}