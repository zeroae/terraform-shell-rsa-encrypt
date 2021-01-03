module "encrypt" {
  source  = "matti/resource/shell"
  version = "1.1.0"
  environment = {
    PUBLIC_KEY_PEM = var.public_key_pem
  }
  sensitive_environment = {
    CONTENT_B64 = var.content_base64
  }
  # https://gist.github.com/thinkerbot/706137
  command = <<-EOF
    public_key_pem_file=$(mktemp)
    printenv PUBLIC_KEY_PEM > $public_key_pem_file
    printenv CONTENT_B64 | base64 -d | openssl rsautl -encrypt -pubin -inkey $public_key_pem_file | base64 --wrap=0
    rm -f $public_key_file
  EOF
}

