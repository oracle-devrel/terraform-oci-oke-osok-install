## Copyright (c) 2022 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl


# install OLM and OSOK operator with install and cleanup scripts
terraform {
  required_version = "> 0.8.0"
}

resource "null_resource" "install_osok" {

 provisioner "local-exec" {

    command = "/bin/bash ./script/install_osok.sh" 
   
  }


provisioner "local-exec" {
    when = destroy
    command = "/bin/bash ./script/cleanup_osok.sh" 
  }

depends_on = [kubernetes_secret_v1.ocicredentials]

}


