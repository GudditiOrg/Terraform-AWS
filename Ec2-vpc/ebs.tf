resource "aws_ebs_volume" "myebs" {
    availability_zone = "us-west-2a"
    size = 10
  
}

resource "aws_volume_attachment" "volume" {
    device_name = "/dev/sdh"
    instance_id = aws_instance.nginx.id
    volume_id = aws_ebs_volume.myebs.id
  
}