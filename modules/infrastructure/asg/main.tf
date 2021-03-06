resource "aws_launch_configuration" "as_conf" {
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = [var.sg_id]
  key_name        = var.pem_key
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_group" "asg" {
  name                 = "${var.region}-${var.environment}-ASG"
  min_size             = 0
  max_size             = 3
  desired_capacity     = 1
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.as_conf.name
  vpc_zone_identifier  = [var.subnet_id]
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_schedule" "asg_schedule_stop" {
  scheduled_action_name  = "asg_stop"
  min_size               = 0
  max_size               = 3
  desired_capacity       = 0
  recurrence             = var.stop_time
  autoscaling_group_name = aws_autoscaling_group.asg.id
}
resource "aws_autoscaling_schedule" "asg_schedule_start" {
  scheduled_action_name  = "asg_start"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 1
  recurrence             = var.start_time
  autoscaling_group_name = aws_autoscaling_group.asg.id
}



