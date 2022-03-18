## Copyright © 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl




resource "oci_identity_dynamic_group" "osok_dynamic_group" {
    #Required
    compartment_id = var.tenancy_ocid
    description = var.dynamic_group_description
    matching_rule = format("instance.compartment.id='%s'", var.node_compartment_ocid)
    name = var.dynamic_group_name

    #Optional
    defined_tags = {}
    freeform_tags = {}
}



resource "oci_identity_policy" "osok_policy" {

    compartment_id = var.tenancy_ocid
    description = var.policy_description
    name = var.policy_name

    statements = [format("Allow dynamic-group %s  to {SUBNET_READ, SUBNET_ATTACH, SUBNET_DETACH, VCN_READ, COMPARTMENT_INSPECT} in COMPARTMENT ID %s", var.dynamic_group_name, var.node_compartment_ocid),
                 format("Allow dynamic-group %s to manage mysql-family in COMPARTMENT ID %s",var.dynamic_group_name,var.node_compartment_ocid), 
                 format("Allow dynamic-group %s to use tag-namespaces in COMPARTMENT ID %s",var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s to manage  streampools in COMPARTMENT ID %s",var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s to manage  stream-family in COMPARTMENT ID %s",var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s to manage  autonomous-database in COMPARTMENT ID %s",var.dynamic_group_name,var.node_compartment_ocid), 
                 format("Allow dynamic-group %s TO  USE metrics IN COMPARTMENT ID  %s",var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s TO USE log-content IN COMPARTMENT ID   %s",var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s TO USE certificate-authority-delegate IN  COMPARTMENT ID  %s",var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s TO USE certificate-authority-family IN  COMPARTMENT ID  %s",var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s TO INSPECT vault IN  COMPARTMENT ID %s", var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s TO {MESH_PROXY_DETAILS_READ} IN COMPARTMENT ID  %s", var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s TO MANAGE certificate-associations IN COMPARTMENT ID  %s", var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s TO MANAGE certificate-authority-associations IN COMPARTMENT ID  %s", var.dynamic_group_name,var.node_compartment_ocid),
                 format("Allow dynamic-group %s TO MANAGE service-mesh-family IN COMPARTMENT ID %s",var.dynamic_group_name,var.node_compartment_ocid)]

    #Optional
    defined_tags = {}
    freeform_tags = {}
    
    depends_on = [oci_identity_dynamic_group.osok_dynamic_group]
}