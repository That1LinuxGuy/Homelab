{ pkgs, ... }:

{
  # Enable fingerprint authentication service
  services.fprintd = {
    enable = true;
  };

  # Optional: Automatically prompt for fingerprint in PAM (sudo, login, lockscreen)
  security.pam.services = {
    sudo.fprintAuth = true;
  };
}
