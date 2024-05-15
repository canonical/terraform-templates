module "wordpress" {
  source = "github.com/canonical/terraform-modules.git//modules/k8s/wordpress"

  juju_model_name = local.juju_model_name
}

resource "juju_application" "nginx_ingress" {

  name  = "nginx-ingress-integrator"
  model = local.juju_model_name
  trust = true

  charm {
    name     = "nginx-ingress-integrator"
    channel  = "v2/edge"
    revision = 84
  }

  config = {
    path-routes      = "/admin,/api,/cleanup,/present"
    service-hostname = "${local.juju_model_name}.workshop.canonical.com"
    # Whitelist VPN, PS5 and PS6, respectively
    whitelist-source-range = "10.172.0.0/16,10.131.0.0/16,10.132.0.0/16,10.141.0.0/16,10.142.0.0/16"
  }

  units = 1
}


resource "juju_integration" "k8s_wordpress_nginx_ingress" {
  model = local.juju_model_name

  application {
    name = module.wordpress.wordpress_application_name
  }

  application {
    name = juju_application.nginx_ingress.name
  }
}
