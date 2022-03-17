provider "kubernetes" {
  config_path    = var.kube_config_path
  config_context = var.config_context
}

resource "kubernetes_namespace_v1" "oci-service-operator-system" {
  metadata {
    name = "oci-service-operator-system"
  }
}

resource "kubernetes_secret_v1" "ocicredentials" {
  metadata {
    name = "ocicredentials"
    namespace = "oci-service-operator-system"
  }

  data = {
    tenancy = var.tenancy_ocid
    user = var.user_ocid
    fingerprint = var.fingerprint
    region = var.region
    passphrase = var.passphrase
    privatekey = file(var.private_key_path)

  }

  depends_on = [kubernetes_namespace_v1.oci-service-operator-system]
}
