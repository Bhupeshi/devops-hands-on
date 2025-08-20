## to create an instance and adding volume into it
## create the block storage volume
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 5 # Size in GB

  tags = {
    Name = "vol-1"
  }
}
## attach this volume to instance
resource "aws_volume_attachment" "example" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}
# block storage ends here
## creating the ec2 instance
data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
resource "aws_instance" "web" {
  availability_zone      = "us-east-1a"
  ami                    = data.aws_ssm_parameter.amazon_linux.value
  instance_type          = "t2.micro"
  key_name               = "aws-key"
  vpc_security_group_ids = [aws_security_group.tf_sg_ssh.id]
  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }
  tags = {
    Name = "test_machine"
  }
}

