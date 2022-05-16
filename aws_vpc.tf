resource "aws_vpc" "myTfVPC" {
  cidr_block = "10.1.0.0/16"
  instance_tenancy = "default"
  tags {
    Name = "myTfVPC"
  }
}

resource "aws_internet_gateway" "myTfGW" {
  vpc_id = "${aws_vpc.myTfVPC.id}"
  depends_on = [
    aws_vpc.myTfVPC
  ]
}

resource "aws_subnet" "tf-pubilc-a" {
  vpc_id = "${aws_vpc.myTfVPC.id}"
  cidr_block = "10.1.1.0/24"
    availability_zone = "ap-northeast-1a"
}

resource "aws_route_table" "tf-public-route" {
    vpc_id = "${aws_vpc.myTfVPC.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.myTfGW.id}"
    }
}

resource "aws_route_table_association" "tf-puclic-a" {
    subnet_id = "${aws_subnet.tf-public-a.id}"
    route_table_id = "${aws_route_table.tf-public-route.id}"
}
