resource "volterra_network_connector" "internet" {
  name      = "zg01-internet-gateway"
  namespace = "system"

  sli_to_slo_snat {
    default_gw_snat = true
  }
  disable_forward_proxy = true
}
