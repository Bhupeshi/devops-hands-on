resource "aws_key_pair" "first_key" {
  key_name   = "terraform-demo-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJJrkQefzyJtOZPY1S6VVIqhdxtFAhWr1fCDUftWH34h bhupe@DESKTOP-2760O19"
}