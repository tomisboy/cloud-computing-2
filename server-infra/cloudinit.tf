# read coud-config from template
data "cloudinit_config" "ansible" {
  base64_encode = "true"
  gzip          = "false"

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = file("ansible-cloud-init.yaml")
  }
}