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
| algorithm | The algorithm to use, RSA or SMIME. | `string` | `"RSA"` | no |
| cert\_pem | The (self-)signed certificate if using SMIME. | `string` | `null` | no |
| content\_base64 | Base64-encoded data to be encrypted. | `string` | n/a | yes |
| public\_key\_pem | The RSA public key to use for encryption. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| result | The base64-encoded encrypted content. |

<!-- markdownlint-restore -->
