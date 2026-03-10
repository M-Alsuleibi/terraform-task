locals {
  environment = var.environment

  arch = can(regex("^(t4g|m6g|c6g)", var.instance_type)) ? "arm64" : "x86_64"
}