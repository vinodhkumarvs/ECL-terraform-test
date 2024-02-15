variable "vpc_id" {
  description = "The ID of the VPC where the resources will be created."
}

variable "application_name" {
  description = "A unique name for the application."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to all resources."
}
