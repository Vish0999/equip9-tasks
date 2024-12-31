resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket-name
}

resource "aws_s3_object" "folder_files" {
  for_each = fileset("${path.module}/S3_Data", "**/*")

  bucket = aws_s3_bucket.mybucket.id
  key    = "S3_Data/${each.value}" # S3 key for each file
  source = "${path.module}/S3_Data/${each.value}" # Local file path
  
}

output "bucket_name" {
  value = aws_s3_bucket.mybucket.bucket
}

output "uploaded_files_folder" {
  value = [for obj in aws_s3_object.folder_files : obj.key]
}