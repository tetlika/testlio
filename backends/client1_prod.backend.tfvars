terraform {
  backend "s3" {
    bucket = "mybucket1"
    key    = "path/to/my/key1"
 
  }
}