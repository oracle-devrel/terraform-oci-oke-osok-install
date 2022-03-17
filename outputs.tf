## Copyright (c) 2022 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "dynamic_group_ocid" {

    value =oci_identity_dynamic_group.osok_dynamic_group.id
    description = "ocid of dynamic group"

}

output "dynamic_group_name" {

    value =oci_identity_dynamic_group.osok_dynamic_group.name
    description = "name of dynamic group"

}

output "osok_policy_ocid" {

    value = oci_identity_policy.osok_policy.id
    description = "ocid of OSOK policy"

}

output "osok_policy_name" {

    value = oci_identity_policy.osok_policy.name
    description = "name  of OSOK policy"

}

output "oke_clusters" {
    value = data.oci_containerengine_clusters.clusters
    description = "list of clusters in compartment that OSOK polices applies to"

}
