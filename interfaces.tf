resource "volterra_network_interface" "eth0" {
  name      = "marcel-zg01-eth0"
  namespace = "system"

  ethernet_interface {
    device = "eth0"
    is_primary = true
    monitor_disabled = true    
  }
}

resource "volterra_network_interface" "eth1" {
  name      = "marcel-zg01-eth1"
  namespace = "system"

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
      }
      automatic_from_start = true
    }
    is_primary = true
    site_local_inside_network = true
    monitor_disabled = true    
  }
}

