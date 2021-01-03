variable "algorithm" {
  type        = string
  description = "The algorithm to use, RSA or SMIME."
  default     = "RSA"
  validation {
    condition     = contains(["RSA", "SMIME"], var.algorithm)
    error_message = "The algorithm must be either RSA or SMIME."
  }
}
variable "public_key_pem" {
  type        = string
  description = "The RSA public key to use for encryption."
  default     = null
}
variable "cert_pem" {
  type        = string
  description = "The (self-)signed certificate if using SMIME."
  default     = null
}
variable "content_base64" {
  type        = string
  description = "Base64-encoded data to be encrypted."
}
