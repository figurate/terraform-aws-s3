# ![AWS](aws-logo.png) S3 Bucket

![AWS S3 Bucket](aws\_s3\_bucket.png)

Purpose: Provision S3 Bucket in AWS.

Rationale: Apply standards and constraints to S3 Buckets.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acl | Predefined ACL to apply | `string` | `"private"` | no |
| bucket | Name of the S3 bucket | `any` | n/a | yes |
| encrypted | Enable server-side encryption | `bool` | `true` | no |
| encryption\_key | The KMS master key used for server-side encryption | `string` | `""` | no |
| expiration\_days | Age of bucket objects (days) before they are deleted | `number` | `0` | no |
| logging\_bucket | Another S3 bucket used to capture audit logs | `string` | `""` | no |
| noncurrent\_version\_expiration | Age of non-current object versions (days) before they are deleted | `number` | `0` | no |
| policy | Identifier for a predefined policy to apply | `string` | `""` | no |
| public\_read\_whitelist | A CIDR IP range for restricted read access to public buckets | `string` | `""` | no |
| suffix\_enabled | Indicates whether to append the bucket name with a unique string to prevent conflicts | `bool` | `false` | no |
| versioned | Enable bucket versioning | `bool` | `true` | no |
| website\_redirect | FQDN target for redirect of all website requests | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_id | n/a |
| hosted\_zone\_id | n/a |
| website\_domain | n/a |

