## Copyright (c) 2022 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

data "oci_containerengine_clusters" "clusters" {
    #Required
    compartment_id = var.node_compartment_ocid
    
}