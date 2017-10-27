variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "ap-northeast-1"
}

variable "images" {
  default = {
    ap-northeast-1 = "ami-ea4eae8c"
  }
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_vpc" "isuconVPC" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "false"

  tags {
    Name = "isuconVPC"
  }
}

resource "aws_internet_gateway" "isuconGW" {
  vpc_id = "${aws_vpc.isuconVPC.id}"
}

resource "aws_subnet" "public-a" {
  vpc_id            = "${aws_vpc.isuconVPC.id}"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"
}

resource "aws_subnet" "private-a" {
  vpc_id            = "${aws_vpc.isuconVPC.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
}

resource "aws_route_table" "public-route" {
  vpc_id = "${aws_vpc.isuconVPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.isuconGW.id}"
  }
}

resource "aws_route_table_association" "public-a" {
  subnet_id      = "${aws_subnet.public-a.id}"
  route_table_id = "${aws_route_table.public-route.id}"
}

resource "aws_security_group" "isucon" {
  name        = "isucon"
  description = "Allow SSH inbound teraffic"
  vpc_id      = "${aws_vpc.isuconVPC.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "isubata-01" {
  ami           = "ami-73ad0d15"
  instance_type = "t2.micro"
  key_name      = "isucon"

  vpc_security_group_ids = [
    "${aws_security_group.isucon.id}",
  ]

  subnet_id                   = "${aws_subnet.public-a.id}"
  associate_public_ip_address = "true"

  root_block_device = {
    volume_type = "gp2"
    volume_size = "20"
  }

  tags {
    Name = "isubata-01"
  }
}

resource "aws_network_interface" "isubata-01" {
  subnet_id       = "${aws_subnet.private-a.id}"
  private_ips     = ["10.0.1.101"]
  security_groups = ["${aws_security_group.isucon.id}"]

  attachment {
    instance     = "${aws_instance.isubata-01.id}"
    device_index = 1
  }
}

resource "aws_eip" "isubata-01" {
  vpc      = true
  instance = "${aws_instance.isubata-01.id}"
}

resource "aws_instance" "isubata-02" {
  ami           = "ami-73ad0d15"
  instance_type = "t2.micro"
  key_name      = "isucon"

  vpc_security_group_ids = [
    "${aws_security_group.isucon.id}",
  ]

  subnet_id                   = "${aws_subnet.public-a.id}"
  associate_public_ip_address = "true"

  root_block_device = {
    volume_type = "gp2"
    volume_size = "20"
  }

  tags {
    Name = "isubata-02"
  }
}

resource "aws_network_interface" "isubata-02" {
  subnet_id       = "${aws_subnet.private-a.id}"
  private_ips     = ["10.0.1.102"]
  security_groups = ["${aws_security_group.isucon.id}"]

  attachment {
    instance     = "${aws_instance.isubata-02.id}"
    device_index = 1
  }
}

resource "aws_eip" "isubata-02" {
  vpc      = true
  instance = "${aws_instance.isubata-02.id}"
}

resource "aws_instance" "isubata-03" {
  ami           = "ami-ff42e399"
  instance_type = "t2.micro"
  key_name      = "isucon"

  vpc_security_group_ids = [
    "${aws_security_group.isucon.id}",
  ]

  subnet_id                   = "${aws_subnet.public-a.id}"
  associate_public_ip_address = "true"

  root_block_device = {
    volume_type = "gp2"
    volume_size = "20"
  }

  tags {
    Name = "isubata-03"
  }
}

resource "aws_network_interface" "isubata-03" {
  subnet_id       = "${aws_subnet.private-a.id}"
  private_ips     = ["10.0.1.103"]
  security_groups = ["${aws_security_group.isucon.id}"]

  attachment {
    instance     = "${aws_instance.isubata-03.id}"
    device_index = 1
  }
}

resource "aws_eip" "isubata-03" {
  vpc      = true
  instance = "${aws_instance.isubata-03.id}"
}

resource "aws_instance" "isubata-bench" {
  ami           = "ami-4f48e929"
  instance_type = "m4.large"
  key_name      = "isucon"

  vpc_security_group_ids = [
    "${aws_security_group.isucon.id}",
  ]

  subnet_id                   = "${aws_subnet.public-a.id}"
  associate_public_ip_address = "true"

  root_block_device = {
    volume_type = "gp2"
    volume_size = "20"
  }

  tags {
    Name = "isubata-bench"
  }
}

resource "aws_eip" "isubata-bench" {
  vpc      = true
  instance = "${aws_instance.isubata-bench.id}"
}


output "public ip" {
  value = "${aws_eip.isubata-01.public_ip} ${aws_eip.isubata-02.public_ip} ${aws_eip.isubata-03.public_ip}, ${aws_eip.isubata-bench.public_ip}"
}
