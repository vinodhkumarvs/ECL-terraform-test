# Terraform Elastic Beanstalk Auto-Scaling Example

This Terraform project deploys an AWS Elastic Beanstalk application with auto-scaling based on CPU utilization.

## Prerequisites

- Terraform installed (version >= 0.14, < 0.16)
- AWS CLI installed and configured
- An AWS account and a user with necessary permissions

## Usage

1. Clone this repository and navigate into the project directory.

2. **Initialize Terraform**:
    terraform init

3. **Configuration Review and Variable Setup**: Review the `variables.tf` file to understand the inputs required for the script. Create a `terraform.tfvars` file or export the variables as environment variables to set the values for `vpc_id`, `application_name`, and `tags`.

    Example `terraform.tfvars` content:
    ```
    application_name = "my-eb-app"
    vpc_id = "vpc-123abc"
    tags = {
      "Environment" = "Development"
      "Project" = "Elastic Beanstalk Demo"
    }

**Plan Deployment**: Generate and review an execution plan for Terraform.

    ```
    terraform plan
    ```

    This command will show us what actions Terraform will perform without actually making any changes.

6. **Deploy the Infrastructure**: Apply the Terraform plan to deploy our Elastic Beanstalk application.

    ```
    terraform apply
    ```

    As soon as we do terraform apply we can prompt to  review the proposed actions and approve them before any changes are made to our  AWS resources.

7. **Accessing the Application**: Once the deployment is successful, Terraform will output the URL of the deployed Elastic Beanstalk application. we can use this URL to access our application.

8. **Monitoring and Scaling**: Monitor our application's CPU utilization through the AWS Management Console. The auto-scaling policies defined will scale the application based on the CPU load.
