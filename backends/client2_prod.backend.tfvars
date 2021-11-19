
terraform {
  backend "s3" {
    bucket = "mybucket2"
    key    = "path/to/my/key2"
 
  }
}