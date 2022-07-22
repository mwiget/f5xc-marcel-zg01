resource "volterra_network_interface" "eth0" {
  name      = "marcel-zg01-eth0"
  namespace   = var.namespace
  description = "WAN interface, connected to provider Datawire"

  ethernet_interface {
    device = "eth0"
    is_primary = true
    monitor_disabled = true    
  }
}

resource "volterra_network_interface" "eth1" {
  name      = "marcel-zg01-eth1"
  namespace   = var.namespace
  description = "LAN interface"

  ethernet_interface {
    device = "eth1"
    dhcp_server {
      dhcp_networks {
        network_prefix = "192.168.40.0/24"
        pool_settings = "INCLUDE_IP_ADDRESSES_FROM_DHCP_POOLS"
        first_address = true
        same_as_dgw = true
      }
      fixed_ip_map = {
        "3c:ec:ef:45:3b:30" = "192.168.40.100"
        "3c:ec:ef:45:3b:64" = "192.168.40.161"
        "b8:ce:f6:44:d1:ea" = "192.168.40.199"
        "00:25:90:bb:31:2e" = "192.168.40.153"
        "3c:ec:ef:45:3d:64" = "192.168.40.162"
        "3c:ec:ef:43:1e:be" = "192.168.40.211"
        "3c:ec:ef:43:1e:91" = "192.168.40.166"
        "8c:04:ba:de:08:c0" = "192.168.40.8"
        "00:0c:29:b1:ca:46" = "192.168.40.21"
        "00:50:56:9b:3b:e7" = "192.168.40.30"
        "00:50:56:9b:2f:4b" = "192.168.40.31"
        "00:50:56:40:40:40" = "192.168.40.40"
        "00:50:56:41:41:41" = "192.168.40.41"
      }
      automatic_from_start = true
    }
    is_primary = true
    site_local_inside_network = true
    monitor_disabled = true    
  }
}

