locals {
  openssl_command = {
    RSA   = "rsautl -encrypt -pubin -inkey $public_key_pem_file"
    SMIME = "smime -binary -encrypt -aes-256-cbc -outform DER $public_key_pem_file"
  }
  public_key = {
    RSA   = var.public_key_pem
    SMIME = var.cert_pem
  }
}
module "encrypt" {
  source  = "matti/resource/shell"
  version = "1.1.0"
  environment = {
    PUBLIC_KEY_PEM = local.public_key[var.algorithm]
  }
  sensitive_environment = {
    CONTENT_B64 = var.content_base64
  }
  # https://gist.github.com/thinkerbot/706137
  command = <<-EOF
    public_key_pem_file=$(mktemp)
    printenv PUBLIC_KEY_PEM > $public_key_pem_file
    printenv CONTENT_B64 | base64 -d | openssl ${local.openssl_command[var.algorithm]} | base64 --wrap=0
    rm -f $public_key_file
  EOF
}
