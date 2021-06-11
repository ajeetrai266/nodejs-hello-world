resource "null_resource" "null1" {

    depends_on = [
     aws_instance.os_nodejs
    ]

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("E:/Key/AWS-key.pem")
        host = aws_instance.os_nodejs.public_ip
    }

    provisioner "file" {
    source      = "hello_world.js"
    destination = "hello_world.js"
  }

    provisioner "remote-exec" {
     inline = [
        "curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -",
        "sudo yum install nodejs -y",
        "sudo yum install gcc-c++ make -y",
        "sudo npm install -g forever",
        "sudo forever start hello_world.js"
     ]
    }
}

output "server_ip" {
  value = "http://${aws_instance.os_nodejs.public_ip}"
}