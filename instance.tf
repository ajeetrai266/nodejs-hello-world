resource "aws_security_group" "sg1" {
  name        = "sg_HRD"
  description = "Allow SSH or HTTP"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Nodejs sg"
  }
}

resource "aws_instance" "os_nodejs" {
ami = var.ami
instance_type = var.i_type
key_name = "aws-key"
vpc_security_group_ids = [ aws_security_group.sg1.id ]

tags = {
  Name = "OS for Nodejs"
  }
}

