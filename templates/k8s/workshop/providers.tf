provider "vault" {
  address = "https://vault.admin.canonical.com:8200"
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.approle_role_id
      secret_id = var.approle_secret_id
    }
  }
}

data "vault_generic_secret" "juju_credentials" {
  path = "secret/prodstack6/roles/{{ service_name }}/juju"
}

data "vault_generic_secret" "juju_controller_certificate" {
  path = "secret/prodstack6/juju/common/ca_certs/juju-controller-35-workshop-ps6"
}

provider "juju" {
  controller_addresses = "juju-controller-35-workshop-ps6.dynamic.admin.canonical.com:17070"
  ca_certificate       = data.vault_generic_secret.juju_controller_certificate.data["ca_cert"]
  username             = data.vault_generic_secret.juju_credentials.data["username"]
  password             = data.vault_generic_secret.juju_credentials.data["password"]
}
