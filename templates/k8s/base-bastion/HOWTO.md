# How to configure a terraform plan on the bastion

You can find more details on [this discourse post](https://discourse.canonical.com/t/how-to-configure-a-terraform-plan-on-the-is-charms-bastion/2275).

## Steps to be taken on the bastion

### Clone this repository
git clone git@github.com:canonical/this-repository.git

### Create a link named “plan” to your terraform plan
ln -s /home/my-user/this-repository/terraform/ plan

### Create a bucket

Use plan as working directory. Now load the OpenStack credentials to create a bucket where the state will be stored.

```shell
cd plan
load_creds openstack
swift post env_name-tfstate
```

Note that "env_name-tfstate" is the same name in `backend.tfvars` file.

### Load the S3 credentials and init the plan.

```shell
load_creds s3
https_proxy=http://squid.internal:3128 NO_PROXY=radosgw.<region>.canonical.com terraform init -backend-config=backend.tfvars
```

Note that \<region\> can be "ps5" or "ps6".

This template has a empty main.tf file where the resources should be defined.

Please, see the [Juju Terraform Provider documentation](https://registry.terraform.io/providers/juju/juju/latest/docs) for examples.
