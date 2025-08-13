# terraform-templates

## Obsolete templates pushed to `legacy` branch 2025-08-13.

This branch will be removed 2026-01-01.

---


The templates available are used to automatically create Terraform Projects for
services.

### How it works?

1. A GitHub Action provides input for the Jinja Templates and render them.
2. The generated files are used to create a new PR to the Service repository.
3. The PR can be reviewed and then merged.

Note: Modules are maintained in a different repository, see [terraform-modules](https://github.com/canonical/terraform-modules).

### Contributing

Please, read the [CONTRIBUTING.md](CONTRIBUTING.md) file.
