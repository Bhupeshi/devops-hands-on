resource "aws_instance" "example" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t3.micro"
  tags = {
    Name = "test"
  }
  key_name = "aws-key"
}