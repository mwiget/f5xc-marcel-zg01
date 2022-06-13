resource "volterra_network_connector" "internet" {
  name      = "marcel-zg01-internet-nc"
  namespace   = var.namespace

  sli_to_slo_snat {
    default_gw_snat = true
  }
  disable_forward_proxy = true
}

resource "volterra_network_connector" "global" {
  name      = "marcel-zg01-global-nc"
  namespace = var.namespace

  sli_to_global_dr {
    global_vn {
      namespace = var.namespace
      name = "volterra-global-lab"
    }
  }
  disable_forward_proxy = true
}
