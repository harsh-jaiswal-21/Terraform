data "aws_ec2_instance_type_offerings" "chk2" {
  for_each = toset(["us-east-1a" , "us-east-1e" , "us-east-1d"])
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}

output "semi_checker" {
    value = {for c , instance in data.aws_ec2_instance_type_offerings.chk2: c => instance.instance_types}
    description = "printing instance types availablity in az's"
}
