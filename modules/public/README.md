## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket | Name of the S3 bucket | `any` | n/a | yes |
| encrypted | Enable server-side encryption | `bool` | `false` | no |
| encryption\_key | The KMS master key used for server-side encryption | `string` | `""` | no |
| expiration\_days | Age of bucket objects (days) before they are deleted | `number` | `0` | no |
| logging\_bucket | Another S3 bucket used to capture audit logs | `string` | `""` | no |
| noncurrent\_version\_expiration | Age of non-current object versions (days) before they are deleted | `number` | `0` | no |
| policy | Identifier for a predefined policy to apply | `string` | `"public_read"` | no |
| public\_read\_cidr | A CIDR IP range for restricted read access to public buckets | `string` | `""` | no |
| suffix\_enabled | Indicates whether to append the bucket name with a unique string to prevent conflicts | `bool` | `true` | no |
| versioned | Enable bucket versioning | `bool` | `false` | no |
| website\_redirect | FQDN target for redirect of all website requests | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_id | n/a |
| hosted\_zone\_id | n/a |
| website\_domain | n/a |

