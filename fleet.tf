resource "volterra_fleet" "zg01" {
  name        = "marcel-zg01"
  namespace   = "system"
  fleet_label = "marcel-zg01"
  description = "Marcel's DC in Zug Switzerland"

  outside_virtual_network {
    name = "marcel-zg01-outside"
    namespace = "system"
  }
  inside_virtual_network {
    name = "marcel-zg01-inside"
    namespace = "system"
  }

  interface_list {
    interfaces {
      name = volterra_network_interface.eth0.name
      namespace = "system"
    }
    interfaces {
      name = volterra_network_interface.eth1.name
      namespace = "system"
    }
  }

  network_connectors {
    namespace = "system"
    name = volterra_network_connector.internet.name
  }

  network_connectors {
    namespace = "system"
    name = volterra_network_connector.global.name
  }

  network_firewall {
    namespace = "system"
    name = volterra_network_firewall.nfw.name
  }

  no_bond_devices          = true
  no_dc_cluster_group      = true
  disable_gpu              = true
  logs_streaming_disabled  = true
  default_storage_class    = true
  no_storage_device        = true
  no_storage_interfaces    = true
  no_storage_static_routes = true
  allow_all_usb            = true
}
