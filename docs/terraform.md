<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0, < 0.14.0 |
| local | ~> 1.2 |
| random | ~> 2.2 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| content\_base64 | Base64-encoded data to be encrypted. | `string` | n/a | yes |
| public\_key\_pem | The RSA public key to use for encryption. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| result | Encrypted content in Base64-encoded format. |

<!-- markdownlint-restore -->
