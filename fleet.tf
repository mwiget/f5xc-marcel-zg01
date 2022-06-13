resource "volterra_fleet" "zg01" {
  name        = "marcel-zg01"
  namespace   = var.namespace
  fleet_label = "marcel-zg01"
  description = "Marcel's DC in Zug Switzerland"

  outside_virtual_network {
    name = volterra_virtual_network.outside.name
    namespace   = var.namespace
  }
  inside_virtual_network {
    name = volterra_virtual_network.inside.name
    namespace   = var.namespace
  }

  interface_list {
    interfaces {
      name = volterra_network_interface.eth0.name
      namespace   = var.namespace
    }
    interfaces {
      name = volterra_network_interface.eth1.name
      namespace   = var.namespace
    }
  }

  network_connectors {
    name = volterra_network_connector.internet.name
    namespace   = var.namespace
  }

  network_connectors {
    name = volterra_network_connector.global.name
    namespace   = var.namespace
  }

  network_firewall {
    name = volterra_network_firewall.nfw.name
    namespace   = var.namespace
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
