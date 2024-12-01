data "aws_ec2_instance_type_offerings" "chk1" {
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = ["us-east-1e"]
  }

  location_type = "availability-zone"
}

output "basic_checker" {
    value = data.aws_ec2_instance_type_offerings.chk1.instance_types
    description = "printing instance types availablity in az's"
}
