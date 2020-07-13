resource "aws_s3_bucket" "actimizedemobucket" {
  bucket = "actimize-bucket-demo"
  acl    = "private"
  tags = {
    actimize        = "actimize"
  }
}

resource "aws_s3_bucket_object" "object" {
  for_each = fileset("Softwares", "*")
  bucket = aws_s3_bucket.actimizedemobucket.bucket
  key = each.value
  source = "Softwares/${each.value}"
  tags = {
    actimize        = "actimize"
  }
}