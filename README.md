# Terraform modules for Prisma Cloud

This repository contains Terraform modules to help create resources in the 
Prisma Cloud dashboard, like custom policies.


## Example usage
All the examples are located in the example folder.
```
module "policy_1" {
    source = "github.com/kcdubois/prismacloud-terraform-modules//modules/custom_policy"

    name = "Azure - Data Residency for Canada (VNet)"
    type = "config"
    description = "Policy to detect the creation of VNet instances outside of the Azure Canada region."
    cloud_type = "azure"
    severity = "high"
    rql_query = "config from cloud.resource where cloud.type = 'azure' AND cloud.region != 'Azure Canada Central' AND cloud.region != 'Azure Canada East' AND cloud.service = 'Azure Virtual Network' AND api.name = 'azure-network-vnet-list' AND json.rule = ['properties.provisioningState'] exists"
}
```

## Argument

| Argument  | Type | Description  | Default  |
|---|---|---|---|
| `name`  | String | Name of the policy  |  N/A |
| `type` | String | Policy type, choices are `config`, `network`, `audit_event`, `iam`  |  `config` |
| `description`  | String | Policy description  |  N/A |
| `cloud_type` | String | Cloud provider of the policy, choices are `aws`, `azure`, `gcp`, `alibaba_cloud`, `all` | `all`  |
| `severity`  | String | Severity of the policy, valid options are `low`, `medium`, `high` | `low` |
| `enabled` | Boolean | Policy is enabled  |  `true` |
| `rql_query` | String | RQL query related to the policy  | N/A  |
| `time_unit` | String | Unit of time to scope the query | `hour` |
| `time_amount` | Number | Amount of unit of time to scope the query | `24` |
| `labels` | set(String) | Set of labels to add to the policy  | `{"terraform"}` |
| `json_config_file` | String | JSON configuration file path for the Prisma Cloud provider | `.prismacloud.json` |

