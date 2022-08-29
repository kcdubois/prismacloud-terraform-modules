module "policy_1" {
    source = "github.com/kcdubois/prismacloud-terraform-modules//modules/custom_policy"

    name = "Azure - Data Residency for Canada (VNet"
    type = "config"
    description = "Policy to detect the creation of VNet instances outside of the Azure Canada region."
    cloud_type = "azure"
    severity = "high"
    rql_query = "config from cloud.resource where cloud.type = 'azure' AND cloud.region != 'Azure Canada Central' AND cloud.region != 'Azure Canada East' AND cloud.service = 'Azure Virtual Network' AND api.name = 'azure-network-vnet-list' AND json.rule = ['properties.provisioningState'] exists"
}