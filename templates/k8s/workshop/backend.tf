terraform {
  backend "s3" {
    key                         = "state"
    bucket                      = "{{ service_name }}-tfstate"
    region                      = "prodstack6"
    endpoints                   = {
      s3 = "https://radosgw.ps6.canonical.com"
    }
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
  }
}
