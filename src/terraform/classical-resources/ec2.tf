data "template_file" "bootstrap" {
  template = file("userdata/bootstrap.sh")

  vars = {
    name_instance = var.hostname_ec2
  }
}

resource "aws_instance" "web-grp2" {
    ami                         = data.aws_ami.web_server.id
    instance_type               = "t2.micro"
    vpc_security_group_ids      = [aws_security_group.allow_http.id]
    subnet_id                   = aws_subnet.subnet.id
    iam_instance_profile        = data.aws_iam_role.ec2_role_ssm.name
    associate_public_ip_address = "true"
    user_data                   = base64encode(data.template_file.bootstrap.rendered) 
    
    tags = merge(local.aws_tags, { Name = "Web-esgi-grp2-${var.env}" })
}