{ config, pkgs, ... }

# A single Nix flake to enable CAC card support in any browser.
{  
  # Install CAC card tools
  environment.systemPackages = with pkgs; [
    opensc
    ccid
    pcsc-tools
    nss
  ];

  # Enable pcsc daemon for CAC card reader
  serivces.pcscd.enable = true;

  # Install firefox.
  programs.firefox = {
    enable = true;
  
    # Enable opensc in firefox for CAC card use
    policies = {
      SecurityDevices = {
        Add = {"CAC card" = "${pkgs.opensc}/lib/opensc-pkcs11.so"; };
      };
    };
  };

  # Install and enable chromium
#  programs.chromium = {
#    enable = true;
#  };
#
#  # Setup the local database for chromium-based browsers
#  systemd.user.services.setup-chromium-cac = {
#    description = "Register CAC Module in Chromium NSS DB";
#    wantedBy = [ "default.target" ];
#    
#    # 1. Define as a one-shot process
#    serviceConfig = {
#      Type = "oneshot";
#      RemainAfterExit = true; # Marks service as active so systemd won't re-run it
#    };
#
#    path = [ pkgs.nss pkgs.coreutils ];
#    
#    script = ''
#      NSSDB="$HOME/.pki/nssdb"
#      
#      if [ -f "$NSSDB/cert9.db" ] && modutil -dbdir "sql:$NSSDB" -list | grep -q "CAC Module"; then
#        exit 0
#      fi
#
#      mkdir -p "$NSSDB"
#
#      if [ ! -f "$NSSDB/cert9.db" ]; then
#        modutil -create -dbdir "sql:$NSSDB" -force
#      fi
#
#      modutil -dbdir "sql:$NSSDB" -add "CAC Module" -libfile "${pkgs.opensc}/lib/opensc-pkcs11.so" -force
#    '';
#  };
#  
#}
