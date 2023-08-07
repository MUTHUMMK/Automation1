# ec2 instance configuration

variable "os" {
    default = "ami-0df7a207adb9748c7"
}

variable "size" {
    default = "t2.micro"
}
variable "ec2-tags" {
    default = {
        Name = "MMK"
    }
}
variable "key" {
    default = "adi.pem"
}


# s3 Bucket configuration

variable "bucketname" {
    description = "aws s3 bucket name creation"
    default = "my-s3-bucket"
}
variable "acl" {
    default = "private"
}
variable "versioning" {
    default = true
}
