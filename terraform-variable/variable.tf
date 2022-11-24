variable "filename" {
  default = "/home/rushal/Desktop/terraform/terraform-variable/variable1.txt"
}

variable "cont" {
  default = "This is my first variable content"
}

variable "content_map" {
  type = map(any)
  default = {
    content1 = "This is my first content"
    content2 = "This is my second content"
  }

}
