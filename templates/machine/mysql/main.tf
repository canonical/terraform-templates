module "mysql" {
  source = "github.com/canonical/terraform-modules.git//modules/machine/mysql"

  juju_model_name = local.juju_model_name
}
