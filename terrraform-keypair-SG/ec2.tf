# resource "aws_instance" "web" {
#   ami           = "ami-0f58b397bc5c1f2e8"
#   instance_type = "t2.nano"
#   key_name      = "aws-key"
#   tags = {
#     Name = "HelloWorld"
#   }
# }


data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "web" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = "t2.micro"
  key_name      = "terraform-demo-key"
  vpc_security_group_ids = [aws_security_group.tf_sg_ssh.id]
    tags = {
        Name = "HelloWorld"
    }
}
