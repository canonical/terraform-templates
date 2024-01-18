terraform {
  backend "s3" {
    key                         = "state"
    endpoint                    = "to-be-changed"
    skip_region_validation      = true
    skip_credentials_validation = true
    force_path_style            = true
  }
}

