packer {
  required_plugins {
    docker = {
      version = ">=0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "alpine" {
  image  = "alpine:latest"
  commit = true
}

build {
  sources = [
    "source.docker.alpine"
  ]
  provisioner "shell" {
    scripts = [
      "./base-packages.sh"
    ]
  }
  post-processor "manifest" {
    output     = "pkr_base.json"
    strip_path = true
  }
  post-processor "docker-save" {
    path = "pkr_base.tar"
  }
}

