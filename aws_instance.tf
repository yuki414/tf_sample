resource "aws_instance" "cm-test" {
    ami = "ami-cbf90ecb"
    instance_type = "t2.micro"
    key_name = "uchiyama_key"
    vpc_security_group_ids = [
      aws_security_group.adminTF.id
    ]
    subnet_id = aws_subnet.tf-public-a.id
    associate_public_ip_address = "true"
    root_block_device {
      volume_type = "gp2"
      volume_size = "20"
    }
    ebs_block_device {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = "100"
    }
    tags = {
        Name = "cm-test"
    }
}
