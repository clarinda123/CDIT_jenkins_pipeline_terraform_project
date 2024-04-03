# remote state
terraform {
  backend "s3" {
    key            = "env_qa/jenkins.tfstate"
    bucket         = "cdit-jenkins-pipeline-bucket"
    region         = "eu-west-2"
    profile        = "Engo"
    dynamodb_table = "cdit-jenkins-pipeline-terraform-table"
  }
}