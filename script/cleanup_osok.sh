#!/bin/bash


# un-install OSOK Operator
operator-sdk cleanup oci-service-operator

#check if OLM installed and uninstall if present

olm=$(operator-sdk olm status)
if [[ ! -z "$olm" ]]
then
   operator-sdk olm uninstall
else
  echo "olm is already uninstalled"
fi


