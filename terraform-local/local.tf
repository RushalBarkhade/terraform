resource "local_file" "first_terraform" {
  filename = "/home/rushal/Desktop/terraform/terraform-local/first_terraform.txt"
  content  = "My First Terraform Script Content"
}

resource "random_string" "rand-str" {
  length  = 16
  special = true
  numeric = false
}

output "rand-str" {
  value = random_string.rand-str
}
