variable "approle_role_id" {
  description = "Approle Role ID"
  type        = string
  validation {
    condition     = var.approle_role_id != null
    error_message = "No value set for approle_role_id: Set it, or export TF_VAR_APPROLE_ROLE_ID."
  }
}


variable "approle_secret_id" {
  description = "Approle Secret ID"
  type        = string
  validation {
    condition     = var.approle_secret_id != null
    error_message = "No value set for approle_secret_id: Set it, or export TF_VAR_APPROLE_SECRET_ID."
  }
}
