terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.17.1"
    }
  }
}

variable "do_token" {}
variable "pvt_key" {}
variable "repo" {}
variable "instance_counts" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  // Must be uploaded into DO account
  name = "terraform"
}

resource "digitalocean_app" "db1000n" {
  spec {
    name   = "db1000n"
    region = "nyc1"

    worker {
      name               = "db1000n-service"
      environment_slug   = "go"
      instance_count     = var.instance_counts
      instance_size_slug = "professional-xs"

      git {
        repo_clone_url = var.repo
        branch         = "main"
      }
    }
  }
}

# resource "digitalocean_droplet" "bomber1" {
#   image  = "ubuntu-20-04-x64"
#   name = "bomber1"
#   region = "nyc1"
#   size   = "s-1vcpu-1gb"
#   ssh_keys = [
#     data.digitalocean_ssh_key.terraform.id
#   ]
#   connection {
#     host = self.ipv4_address
#     user = "root"
#     type = "ssh"
#     private_key = file(var.pvt_key)
#     timeout = "5m"
#   }
#   provisioner "local-exec" {
#     command = "make build"
#   }
#   provisioner "file" {
#     source      = "main"
#     destination = "/tmp/main"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/main",
#       "/tmp/main"
#     ]
#   }
# }

# resource "digitalocean_droplet" "bomber2" {
#   image  = "ubuntu-20-04-x64"
#   name   = "bomber2"
#   region = "sgp1"
#   size   = "s-1vcpu-1gb"
#   ssh_keys = [
#     data.digitalocean_ssh_key.terraform.id
#   ]
#   connection {
#     host = self.ipv4_address
#     user = "root"
#     type = "ssh"
#     private_key = file(var.pvt_key)
#     timeout = "5m"
#   }
#   provisioner "file" {
#     source      = "main"
#     destination = "/tmp/main"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/main",
#       "/tmp/main"
#     ]
#   }
# }

# resource "digitalocean_droplet" "bomber3" {
#   image  = "ubuntu-20-04-x64"
#   name = "bomber3"
#   region = "blr1"
#   size   = "s-1vcpu-1gb"
#   ssh_keys = [
#     data.digitalocean_ssh_key.terraform.id
#   ]
#   connection {
#     host = self.ipv4_address
#     user = "root"
#     type = "ssh"
#     private_key = file(var.pvt_key)
#     timeout = "5m"
#   }
#   provisioner "file" {
#     source      = "main"
#     destination = "/tmp/main"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/main",
#       "/tmp/main"
#     ]
#   }
# }

# resource "digitalocean_droplet" "bomber4" {
#   image  = "ubuntu-20-04-x64"
#   name = "bomber4"
#   region = "tor1"
#   size   = "s-1vcpu-1gb"
#   ssh_keys = [
#     data.digitalocean_ssh_key.terraform.id
#   ]
#   connection {
#     host = self.ipv4_address
#     user = "root"
#     type = "ssh"
#     private_key = file(var.pvt_key)
#     timeout = "5m"
#   }
#   provisioner "file" {
#     source      = "main"
#     destination = "/tmp/main"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/main",
#       "/tmp/main"
#     ]
#   }
# }
