{ pkgs, ... }:

{
  # Enable fingerprint authentication service
  services.fprintd = {
    enable = true;
    # Optional: explicitly set libfprint TOD (Touch OEM Drivers) if using proprietary driver forks
    # package = pkgs.fprintd-tod; 
  };

  # Optional: Automatically prompt for fingerprint in PAM (sudo, login, lockscreen)
  security.pam.services = {
    sudo.fprintAuth = true;
    login.fprintAuth = true;
  };
}
