terraform {
    backend "s3" {
        bucket         = "saeed-app"
        key            = "terraform/state"
        region         = "us-east-1"
    }
}
