terraform {
  backend "s3" {
    key                    = "state"
    endpoint               = "radosgw.ps5.canonical.com"
    skip_region_validation = true
    skip_credentials_validation = true
    force_path_style            = true
  }
}

