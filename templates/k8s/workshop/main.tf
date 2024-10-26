locals {
  juju_model_name = "{{ service_name }}"
  username        = trimprefix(local.juju_model_name, "workshop-k8s-")
}

data "juju_model" "service_model" {
  name = local.juju_model_name
}

resource "juju_application" "web_demo" {
  name  = "web-demo"
  model = data.juju_model.service_model.name

  charm {
    name     = "flask-demo-greeting"
    channel  = "latest/beta"
    revision = 1
    base     = "ubuntu@22.04"
  }

  config = {
    # username = local.username
  }

  units = 1
}

resource "juju_application" "ingress" {
  name  = "ingress"
  model = data.juju_model.service_model.name

  charm {
    name     = "nginx-ingress-integrator"
    channel  = "latest/edge"
    revision = 121
  }

  config = {
    path-routes      = "/"
    service-hostname = "${local.username}.workshop.admin.canonical.com"
    tls-secret-name  = "workshop-wildcard-tls"
  }

  units = 1
  trust = true
}

resource "juju_integration" "web_demo_ingress" {
  model = data.juju_model.service_model.name

  application {
    name     = juju_application.web_demo.name
    endpoint = "ingress"
  }

  application {
    name     = juju_application.ingress.name
    endpoint = "ingress"
  }

}
