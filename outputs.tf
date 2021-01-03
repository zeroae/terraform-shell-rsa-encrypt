output "result" {
  description = "The base64-encoded encrypted content."
  value       = [module.encrypt.stdout][module.encrypt.exitstatus]
}
