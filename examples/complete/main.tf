resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "random_password" "this" {
  length = 128
}

output "generated" {
  description = "The random generated password."
  value       = random_password.this.result
  sensitive   = true
}

module "encrypt" {
  source = "../.."

  public_key_pem = tls_private_key.this.public_key_pem
  content_base64 = base64encode(random_password.this.result)
}

resource "tls_self_signed_cert" "this" {
  key_algorithm         = tls_private_key.this.algorithm
  private_key_pem       = tls_private_key.this.private_key_pem
  validity_period_hours = 1
  subject {
    common_name = "test"
  }
  allowed_uses = [
    "key_encipherment"
  ]
}

module "smime-encrypt" {
  source = "../.."

  algorithm      = "SMIME"
  cert_pem       = tls_self_signed_cert.this.cert_pem
  content_base64 = filebase64("main.tf")
}


output "decrypted" {
  description = "The same random password after it was encrypted and then decrypted."
  value       = rsadecrypt(module.encrypt.result, tls_private_key.this.private_key_pem)
  sensitive   = true
}

output "smime_der_b64" {
  value = module.smime-encrypt.result
}

