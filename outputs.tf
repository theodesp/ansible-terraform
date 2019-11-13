output "ip" {
  description = "The Droplet ipv4 address"
  value = "${digitalocean_droplet.www-example.ipv4_address}"
}
