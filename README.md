## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | Name of the S3 bucket | `any` | n/a | yes |
| encrypted | Enable server-side encryption | `bool` | `false` | no |
| encryption\_key | The KMS master key used for server-side encryption | `string` | `""` | no |
| expiration\_days | Age of bucket objects (days) before they are deleted | `number` | `0` | no |
| noncurrent\_version\_expiration | Age of non-current object versions (days) before they are deleted | `number` | `0` | no |
| prefix\_enabled | Indicates whether to prefix bucket name with the account id | `bool` | `true` | no |
| versioned | Enable bucket versioning | `bool` | `false` | no |

## Outputs

No output.

