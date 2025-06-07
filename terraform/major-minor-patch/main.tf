variable "version_string" {
  type = string
}

locals {
  version_parts = split(".", var.version_string)
  parts_count = length(local.version_parts)
  major = local.parts_count > 0 ? local.version_parts[0] : "0"
  minor = local.parts_count > 1 ? local.version_parts[1] : "0"
  patch = local.parts_count > 2 ? local.version_parts[2] : "0"
}

output "major" { value = local.major }
output "minor" { value = local.minor }
output "patch" { value = local.patch }
