variable "create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the file system"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# File System
################################################################################

variable "availability_zone_name" {
  description = "The AWS Availability Zone in which to create the file system. Used to create a file system that uses One Zone storage classes"
  type        = string
  default     = null
}

variable "creation_token" {
  description = "A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation. By default generated by Terraform"
  type        = string
  default     = null
}

variable "performance_mode" {
  description = "The file system performance mode. Can be either `generalPurpose` or `maxIO`. Default is `generalPurpose`"
  type        = string
  default     = null
}

variable "encrypted" {
  description = "If `true`, the disk will be encrypted"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "The ARN for the KMS encryption key. When specifying `kms_key_arn`, encrypted needs to be set to `true`"
  type        = string
  default     = null
}

variable "provisioned_throughput_in_mibps" {
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with `throughput_mode` set to `provisioned`"
  type        = number
  default     = null
}

variable "throughput_mode" {
  description = "Throughput mode for the file system. Defaults to `bursting`. Valid values: `bursting`, `elastic`, and `provisioned`. When using `provisioned`, also set `provisioned_throughput_in_mibps`"
  type        = string
  default     = null
}

variable "lifecycle_policy" {
  description = "A file system [lifecycle policy](https://docs.aws.amazon.com/efs/latest/ug/API_LifecyclePolicy.html) object"
  type        = any
  default     = {}
}

variable "protection" {
  description = "A map of file protection configurations"
  type        = any
  default     = {}
}

################################################################################
# File System Policy
################################################################################

variable "attach_policy" {
  description = "Determines whether a policy is attached to the file system"
  type        = bool
  default     = true
}

variable "bypass_policy_lockout_safety_check" {
  description = "A flag to indicate whether to bypass the `aws_efs_file_system_policy` lockout safety check. Defaults to `false`"
  type        = bool
  default     = null
}

variable "source_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
  type        = list(string)
  default     = []
}

variable "override_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid`"
  type        = list(string)
  default     = []
}

variable "policy_statements" {
  description = "A list of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type        = any
  default     = []
}

variable "deny_nonsecure_transport" {
  description = "Determines whether `aws:SecureTransport` is required when connecting to elastic file system"
  type        = bool
  default     = true
}

variable "deny_nonsecure_transport_via_mount_target" {
  description = "Determines whether to use the common policy option for denying nonsecure transport which allows all AWS principals when accessed via EFS mounted target"
  type        = bool
  default     = true
}

################################################################################
# Mount Target(s)
################################################################################

variable "mount_targets" {
  description = "A map of mount target definitions to create"
  type        = any
  default     = {}
}

################################################################################
# Security Group
################################################################################

variable "create_security_group" {
  description = "Determines whether a security group is created"
  type        = bool
  default     = true
}

variable "security_group_name" {
  description = "Name to assign to the security group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}

variable "security_group_description" {
  description = "Security group description. Defaults to Managed by Terraform"
  type        = string
  default     = null
}

variable "security_group_use_name_prefix" {
  description = "Determines whether to use a name prefix for the security group. If `true`, the `security_group_name` value will be used as a prefix"
  type        = bool
  default     = false
}

variable "security_group_vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
  default     = null
}

variable "security_group_rules" {
  description = "Map of security group rule definitions to create"
  type        = any
  default     = {}
}

################################################################################
# Access Point(s)
################################################################################

variable "access_points" {
  description = "A map of access point definitions to create"
  type        = any
  default     = {}
}

################################################################################
# Backup Policy
################################################################################

variable "create_backup_policy" {
  description = "Determines whether a backup policy is created"
  type        = bool
  default     = true
}

variable "enable_backup_policy" {
  description = "Determines whether a backup policy is `ENABLED` or `DISABLED`"
  type        = bool
  default     = true
}

################################################################################
# Replication Configuration
################################################################################

variable "create_replication_configuration" {
  description = "Determines whether a replication configuration is created"
  type        = bool
  default     = false
}

variable "replication_configuration_destination" {
  description = "A destination configuration block"
  type        = any
  default     = {}
}