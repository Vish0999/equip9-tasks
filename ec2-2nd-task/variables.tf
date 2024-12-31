variable "aws_region" {
  description = "AWS region"
  default     = "eu-north-1"
}

variable "aws_ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-075449515af5df0d1" # Amazon Linux 2
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  default     = "~/.ssh/deployer-key.pub"
}
