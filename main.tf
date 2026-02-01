provider "aws" {

  region = var.region

}



# Create S3 bucket

resource "aws_s3_bucket" "website_bucket" {

  bucket = var.bucket_name

}



# Enable static website hosting

resource "aws_s3_bucket_website_configuration" "website_config" {

  bucket = aws_s3_bucket.website_bucket.id



  index_document {

    suffix = "index.html"

  }

}



# Upload index.html

resource "aws_s3_object" "index_file" {

  bucket       = aws_s3_bucket.website_bucket.id

  key          = "index.html"

  source       = "index.html"

  content_type = "text/html"

}


