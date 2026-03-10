module "web_app" {
  source = "../../modules/web_app"

  environment   = "dev"
  project_name  = "terraform"
  vpc_id        = local.vpc_id
  subnet_id     = local.subnet_id
  my_ip         = local.my_ip
  s3_bucket     = local.deployment_bucket_name
  s3_script_key = "scripts/launch.sh"
  policy_arn    = local.iam_policy_arn
  key_name      = local.key_pair_name
  instance_type = "t2.micro"
}