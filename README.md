## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket | Name of the S3 bucket | `any` | n/a | yes |
| encrypted | Enable server-side encryption | `bool` | `false` | no |
| encryption\_key | The KMS master key used for server-side encryption | `string` | `""` | no |
| expiration\_days | Age of bucket objects (days) before they are deleted | `number` | `0` | no |
| logging\_bucket | Another S3 bucket used to capture audit logs | `string` | `""` | no |
| noncurrent\_version\_expiration | Age of non-current object versions (days) before they are deleted | `number` | `0` | no |
| suffix\_enabled | Indicates whether to append the bucket name with a unique string to prevent conflicts | `bool` | `false` | no |
| versioned | Enable bucket versioning | `bool` | `false` | no |

## Outputs

No output.

