# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
    region = "us-east-1"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacity_t2" {
ami = "ami-09d95fab7fff3776c"
count = 4
instance_type = "t2.micro"
tags = {
    name = "Udacity T2"
}
subnet_id = "subnet-0746d6a5c6a8cf531"
vpc_security_group_ids = ["sg-04149ccc7028966b9"]
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
# resource "aws_instance" "udacity_m4" {
# ami = "ami-09d95fab7fff3776c"
# count = 2
# instance_type = "m4.large"
# tags = {
#     name = "Udacity M4"
# }
# subnet_id = "subnet-0746d6a5c6a8cf531"
# vpc_security_group_ids = ["sg-04149ccc7028966b9"]
# }
