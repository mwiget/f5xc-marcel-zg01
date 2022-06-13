resource "volterra_virtual_network" "inside" {
  name      = "marcel-zg01-inside"
  namespace = var.namespace
  site_local_inside_network = true
}

resource "volterra_virtual_network" "outside" {
  name      = "marcel-zg01-outside"
  namespace = var.namespace
  site_local_network = true
}

#resource "volterra_virtual_network" "global" {
#  name      = "zg01-global"
#  namespace = var.namespace
#  global_network = true
#}
