resource "volterra_network_firewall" "nfw" {
  name      = "marcel-zg01-firewall"
  namespace = var.namespace

  # disable_network_policy = true
  active_network_policies {
    network_policies {
      name = "block-unauthorized-countries"
      namespace = var.namespace
    }
    network_policies {
      name = "allow-all"
      namespace = var.namespace
    }
  }

  # disable_forward_proxy_policy = true
  active_forward_proxy_policies {
    forward_proxy_policies {
      name = "allow-all-urls"
      namespace = var.namespace
    }
  }

  disable_fast_acl = true
}
