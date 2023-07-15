terraform {
  backend "s3" {
    bucket = "terraform101.devops2023.online"
    key    = "terraform.tfstate"
  }
}

