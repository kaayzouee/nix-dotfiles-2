#{
#  networking.networkmanager.enable = true;
#  networking.networkmanager.dns = "none";

#  networking.resolvconf.enable = false;
#  services.resolved.enable = false;

#  environment.etc."resolv.conf".text = ''
#    nameserver 1.1.1.1
#    nameserver 8.8.8.8
#  '';

#  networking.firewall.enable = true;
#}



{
  services.stubby = {
    enable = true;

    settings = {
      resolution_type = "GETDNS_RESOLUTION_STUB";
      dns_transport_list = [ "GETDNS_TRANSPORT_TLS" ];

      listen_addresses = [
        "127.0.0.1@53"
        "0::1@53"
      ];

      upstream_recursive_servers = [
        {
          address_data = "1.1.1.1";
          tls_auth_name = "cloudflare-dns.com";
        }
        {
          address_data = "1.0.0.1";
          tls_auth_name = "cloudflare-dns.com";
        }
        {
          address_data = "8.8.8.8";
          tls_auth_name = "dns.google";
        }
        {
          address_data = "8.8.4.4";
          tls_auth_name = "dns.google";
        }
      ];
    };
  };

  networking.networkmanager = {
    enable = true;
    dns = "none";
  };

  networking.resolvconf.enable = false;
  services.resolved.enable = false;

  environment.etc."resolv.conf".text = ''
    nameserver 127.0.0.1
  '';

  networking.firewall.enable = true;
}
