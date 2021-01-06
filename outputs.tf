output "result" {
  description = "The base64-encoded encrypted content."
  value       = [replace(module.encrypt.stdout, "\n", "")][module.encrypt.exitstatus]
}
