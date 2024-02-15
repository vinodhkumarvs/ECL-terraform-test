output "eb_application_name" {
  value = aws_elastic_beanstalk_application.app.name
}

output "eb_environment_name" {
  value = aws_elastic_beanstalk_environment.env.name
}
output "eb_application_url" {
  description = "URL of the deployed Elastic Beanstalk application"
  value       = aws_elastic_beanstalk_environment.myenv.cname
}
