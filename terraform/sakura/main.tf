variable "password" {
  default = "isucon2017"
}
variable "private_ip_addresses" {
    default = ["192.168.1.1" , "192.168.1.2" , "192.168.1.3"]
}

provider sakuracloud {
  zone = "tk1a" # 東京第1ゾーン 
}

resource "sakuracloud_switch" "sw" {
    name = "sw"
}

data sakuracloud_archive "ubuntu" {
    os_type = "ubuntu"
}

# ディスク定義
resource "sakuracloud_disk" "disks" {
    count = 3
    name = "disk${count.index}"
    source_archive_id = "${data.sakuracloud_archive.ubuntu.id}"
    password          = "${var.password}"
}


# サーバー定義
resource "sakuracloud_server" "servers" {
    core = 1
    memory = 1
    count = 3
    name  = "isubata${count.index}"
    disks = ["${sakuracloud_disk.disks.*.id[count.index]}"]
    tags = ["@virtio-net-pci"]
    ipaddress = "${var.private_ip_addresses[count.index]}"
    nw_mask_len = 24
    nic = "shared"
    additional_nics = ["${sakuracloud_switch.sw.id}"]
    interface_driver = "virtio"
}


# サーバへのSSH接続を表示するアウトプット定義
output "server" {
  value = "${sakuracloud_server.servers.ipaddress}"
}
