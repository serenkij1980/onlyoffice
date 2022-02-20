module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = local.cluster_name
  cluster_version = "1.20"

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  
  
  manage_aws_auth = true
  enable_irsa = true

  worker_groups = [
    {
      name                 = "${var.name}"
      instance_type        = "t3.xlarge"
      asg_desired_capacity = 2
      additional_userdata  = "echo foo bar"
      root_volume_type     = "gp2"
      aws_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]     
      key_name               = aws_key_pair.onlyoffice.key_name
    } 
  ]
}