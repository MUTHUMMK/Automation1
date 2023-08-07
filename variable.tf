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





