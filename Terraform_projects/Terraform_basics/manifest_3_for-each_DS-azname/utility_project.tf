data "aws_ec2_instance_type_offerings" "dalal" {
  filter {
    name   = "instance-type"
    values = [ "t2.medium" ]
  }

  filter {
    name   = "location"
    values = ["us-east-1e"]
  }

  location_type = "availability-zone"
}

output "avaliblity_checker" {
    value = data.aws_ec2_instance_type_offerings.dalal.instance_types
    description = "this whole file is helping us to print if t3.micro is avaliable in us-east-1e or not"
}