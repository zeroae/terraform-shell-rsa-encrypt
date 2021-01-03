variable "public_key_pem" {
  type        = string
  description = "The RSA public key to use for encryption."
}

variable "content_base64" {
  type        = string
  description = "Base64-encoded data to be encrypted."
}
