resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "random_password" "this" {
  length = 16
}

module "encrypt" {
  source = "../.."

  public_key_pem = tls_private_key.this.public_key_pem
  content_base64 = base64encode(random_password.this.result)
  x = file
}


output "generated" {
  description = "The random generated password."
  value = random_password.this.result
}

output "decrypted" {
  description = "The same random password after it was encrypted and then decrypted."
  value = rsadecrypt(module.encrypt.result, tls_private_key.this.private_key_pem)
}

