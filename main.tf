

resource "digitalocean_droplet" "www-example" {
  image              = "${var.image}"
  name               = "${var.name}"
  region             = "${var.region}"
  size               = "${var.size}"
  backups            = "${var.with_backups}"
  monitoring         = "${var.with_monitoring}"
  ipv6               = "${var.with_ipv6}"
  private_networking = "${var.with_private_networking}"
  resize_disk        = "${var.with_resize_disk}"
  ssh_keys           = ["${var.ssh_keys}"]

  provisioner "remote-exec" {
    inline = ["echo 'Hello World'"]

    connection {
      type        = "ssh"
      user        = "root"
      host        = "${self.ipv4_address}"
      private_key = "${file(var.ssh_key_private)}"
    }
  }

  provisioner "local-exec" {
      command = "ansible-playbook -i '${digitalocean_droplet.www-example.ipv4_address}' playbook.yml"
  }
}
