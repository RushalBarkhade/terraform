
resource "local_file" "devops-variable" {
  filename = var.filename
  content  = var.cont

}

resource "local_file" "devops-map-variable" {
  filename = var.filename
  content  = var.content_map["content2"]
}
