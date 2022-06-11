resource "volterra_fleet" "zg01" {
  name        = "marcel-zg01"
  namespace   = "system"
  fleet_label = "marcel-zg01"

  interface_list {
    interfaces {
      name      = "marcel-zg01-eth1"
      namespace = "system"
    }
  }

  network_connectors {
    namespace = "system"
    name = "marcel-zg01-internet"
  }

  network_connectors {
    namespace = "system"
    name = "marcel-zg01-global"
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
