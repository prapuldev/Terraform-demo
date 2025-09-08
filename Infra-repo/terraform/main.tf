terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "example" {
  content  = "Hello from Terraform! Build ID = ${var.build_id}"
  filename = "${path.module}/output.txt"
}
