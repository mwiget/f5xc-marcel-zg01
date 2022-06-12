resource "volterra_virtual_network" "inside" {
  name      = "marcel-zg01-inside"
  namespace = "system"
  site_local_inside_network = true
}

resource "volterra_virtual_network" "outside" {
  name      = "marcel-zg01-outside"
  namespace = "system"
  site_local_network = true
}

#resource "volterra_virtual_network" "global" {
#  name      = "zg01-global"
#  namespace = "system"
#  global_network = true
#}
