## Copyright © 2022, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


variable "tenancy_ocid" {
    type = string
    default = ""
}

variable "user_ocid" {
    type = string
    default = ""
 }
variable "private_key_path" {
    type = string
    default = ""
}

variable "region" {
    type = string
    default = "us-ashburn-1"
}
variable "fingerprint" {
    type = string
    default = ""
}

variable "passphrase" {
type = string
 default = ""
}


# variables for dynamic group
# variable for ocid of compartment that holds OKE cluster
variable "node_compartment_ocid" {
    type = string
    default = ""
}
variable "dynamic_group_name" {
    type = string
    default = "mesh_osok"
}
variable "dynamic_group_description" {
    type = string
    default = "osok dynamic group"
}


# variables for Polciy for Dynamic Group to allow OSOK Operations
# variable for ocid of compartment that holds OKE cluster

variable "policy_description" {
    type = string
    default = "policy to allow OSOK operation"
}

variable "policy_name" {
    type = string
    default = "osok_policy"
}



# variables for Kube.tf


variable "kube_config_path" {
    type = string
    default = "~/.kube/config"
}

# context within .kubeconfig to use
variable "config_context" {
    type = string
    default = ""

}
