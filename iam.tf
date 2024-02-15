resource "aws_iam_role" "eb_role" {
  name = "${var.application_name}-eb-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "elasticbeanstalk.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy" "eb_policy" {
  name = "${var.application_name}-eb-policy"
  role = aws_iam_role.eb_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
        ]
        Resource = [
          "${aws_s3_bucket.eb_bucket.arn}/*",
        ]
        Effect = "Allow"
      },
    ]
  })
}
