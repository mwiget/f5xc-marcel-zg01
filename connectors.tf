resource "volterra_network_connector" "internet" {
  name      = "marcel-zg01-internet"
  namespace = "system"

  sli_to_slo_snat {
    default_gw_snat = true
  }
  disable_forward_proxy = true
}

resource "volterra_network_connector" "global" {
  name      = "marcel-zg01-global"
  namespace = "system"

  sli_to_global_dr {
    global_vn {
      namespace = "system"
      name = volterra_virtual_network.global.name
    }
  }
  disable_forward_proxy = true

  depends_on = [ volterra_virtual_network.global ]
}
