output "result" {
  description = "Encrypted content in Base64-encoded format."
  value       = [module.encrypt.stdout][module.encrypt.exitstatus]
}
