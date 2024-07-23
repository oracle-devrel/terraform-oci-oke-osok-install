# oci-terraform-osok


[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-arch-ci-cd)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-arch-ci-cd)


## Introduction

This Terraform playbook will automate the installation of the OCI Service Operator for Kubernetes (OSOK) in a Kubernetes cluster deployed on Oracle Cloud Infrastructure (OCI). The Kubernetes cluster can be a customer-managed cluster deployed on virtual machines (VM) or a cluster managed with the Oracle Container Engine for Kubernetes (OKE) service.

### OSOK Supported Services

As part of the installation, this Terraform playbook will install the pre-requisites and the requirements for OSOK to manage the following OCI services.

- MySQL Databse System (MDS)
- Autonomous Database (ATP)
- Oracle Streaming Service
- Oracle Service Mesh

### Installed Components

- [OSOK](https://github.com/oracle/oci-service-operator) in the Kuberntes cluster
- Operator Lifecycle Manager [OLM](https://olm.operatorframework.io/docs/getting-started/) in the Kubernetes Cluster  
- OCI Dynamic Group that contain all Kubernetes worker nodes in the compartment
- OCI Policy to grant the Kuberntes worker nodes permission to manage OSOK supported services
- Kubernetes namespace for OSOK 
- Kubernetes namespace for OLM
- Kubernetes secret with credentials required by OSOK





## Pre-requisites

- A Kuberntes cluster deployed in OCI 
- [kubectl](https://kubernetes.io/docs/tasks/tools/) installed and using the context for the Kubernetes cluster where OSOK will be deployed
- [Docker](https://docs.docker.com/engine/install/) installed
- OCI credentials with the required permissions to create Dynamic groups and policies on OCI


##  Getting Started

**1. Clone or download the contents of this repo** 
     
     git clone https://github.com/oracle-devrel/terraform-oci-oke-osok-install.git
**2. Change to the directory that holds the Terraform code** 

      cd ./terraform-oci-oke-osok-install

**3. Populate the variables.tf file with the required information to deploy OSOK**


**4. To Initialize, plan, and apply the Terraform playbook, run the following commands**

``` 
# terraform initialize
# terraform plan
# terraform apply
    
```   

**5. To uninstall OSOK and associated components.**

```
# terraform destroy
```


     
  **Notes/Issues:**
 


 ## Variable Definitions


| Parameter                          | Description                                                         | Type   | Mandatory |
| ---------------------------------- | ------------------------------------------------------------------- | ------ | --------- |
| `tenancy_ocid` | OCID of your tenenacy | string | yes  |
| `user_ocid` | OCID of the user | string | yes       |
| `private_key_path` | Path to the private key file for the user ocid credentials on your system | string | yes       |
| `region` | Region where the Kubernetes cluster resides | string | yes       |
| `fingerprint` | Fingerprint of the user credentials | string    | yes       |
| `passphrase`| Passphrase for user credentials | string   | yes       |
| `node_compartment_ocid` | OCID of the compartment where the Kubernetes cluster resides | string | yes        |
| `dynamic_group_name` | Name to assign to the dynamic group in OCI | string | yes       |
| `dynamic_group_description`  | Description for the dynamic group in OCI | string | yes       |
| `policy_description`| Description for the policy in OCI | string | yes        |
| `policy_name` | Name to assign to the policy in OCI | string | yes |
| `kube_config_path` | Path to config file to access the Kubernetes cluster| string | yes       |
| `config_context` | Context within the kubernetes config file for the Kubernetes cluster | string | yes |




## Additional Resources

- [OCI Service Operator for Kuberntes (OSOK) deployed in the cluster](https://github.com/oracle/oci-service-operator)


## License
Copyright (c) 2024 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.
