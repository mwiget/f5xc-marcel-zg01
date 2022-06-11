resource "volterra_fleet" "router" {
  name      = "marcel-zg01"
  namespace = "staging"

  // One of the arguments from this list "no_bond_devices bond_device_list" must be set
  no_bond_devices = true

  // One of the arguments from this list "no_dc_cluster_group dc_cluster_group dc_cluster_group_inside" must be set
  no_dc_cluster_group = true
  fleet_label         = "marcel-zg01"

  // One of the arguments from this list "disable_gpu enable_gpu enable_vgpu" must be set
  disable_gpu = true

  // One of the arguments from this list "interface_list default_config device_list" must be set

  interface_list {
    interfaces {
      name      = "test1"
      namespace = "staging"
      tenant    = "acmecorp"
    }
  }
  // One of the arguments from this list "logs_streaming_disabled log_receiver" must be set
  logs_streaming_disabled = true
  // One of the arguments from this list "default_storage_class storage_class_list" must be set
  default_storage_class = true
  // One of the arguments from this list "no_storage_device storage_device_list" must be set
  no_storage_device = true
  // One of the arguments from this list "no_storage_interfaces storage_interface_list" must be set
  no_storage_interfaces = true
  // One of the arguments from this list "no_storage_static_routes storage_static_routes" must be set
  no_storage_static_routes = true
  // One of the arguments from this list "deny_all_usb allow_all_usb usb_policy" must be set
  deny_all_usb = true
}
