module "hello_kubecon" {
  source = "github.com/canonical/terraform-modules.git//modules/k8s/hello_kubecon"

  juju_model_name = local.juju_model_name
}
