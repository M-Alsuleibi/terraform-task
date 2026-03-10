locals {
  my_ip = "${chomp(data.http.my_ip.response_body)}/32"

  deployment_bucket_name = data.terraform_remote_state.shared.outputs.deployment_bucket_name
  iam_policy_arn         = data.terraform_remote_state.shared.outputs.iam_policy_arn
  key_pair_name          = data.terraform_remote_state.shared.outputs.key_pair_name

  vpc_id    = data.terraform_remote_state.network.outputs.vpc_id
  subnet_id = data.terraform_remote_state.network.outputs.public_subnets[0]
}