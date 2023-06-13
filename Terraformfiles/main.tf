resource "aws_amplify_app" "example" {
  name       = "nextjs"
  repository = "https://github.com/Kiranteja623/nextjs-s3-upload.git"
  auto_branch_creation_patterns = [true] 
  enable_auto_branch_creation   = true
  enable_basic_auth = false
  enable_branch_auto_deletion = false
  environment_variables         = {}
  iam_service_role_arn          = "arn:aws:iam::923869565259:role/service-role/AmplifySSRLoggingRole-ddksw3xo98puf"
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

