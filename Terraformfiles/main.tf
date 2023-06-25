resource "aws_amplify_app" "example" {
  name       = "nextjs"
  repository = "https://github.com/krishnareddy219/nextjs-s3-upload.git"
  access_token = "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"
  auto_branch_creation_patterns = [true]
  enable_auto_branch_creation   = true
  enable_basic_auth = false
  enable_branch_auto_deletion = false
  environment_variables         = {}
  iam_service_role_arn          = "arn:aws:iam::127347583409:role/amplifyconsole-backend-role"
  tags = {
     name= "nextjs"
   }
}
resource "aws_amplify_backend_environment" "example" {
  app_id           = aws_amplify_app.example.id
  environment_name ="dev"
  stack_name       = "nextjs"
}
resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.example.id
  branch_name = "master"
  enable_basic_auth = false
  enable_notification = false
  enable_performance_mode = false
  enable_pull_request_preview = false
  environment_variables = {}
  tags = {
    name="nextjs"
  }
  framework = "React"
  stage     = "PRODUCTION"
  ttl = 5
}
resource "aws_amplify_webhook" "master" {
  app_id      = aws_amplify_app.example.id
  branch_name = aws_amplify_branch.master.branch_name
  description = "triggermaster"
}
