{ options, config, lib, ... }:

with lib;
with lib.my;
let cfg = config.modules.services.ssh;
in {
  options.modules.services.ssh = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings = {
        kbdInteractiveAuthentication = false;
        passwordAuthentication = false;
      };
    };

    user.openssh.authorizedKeys.keys =
      if config.user.name == "god"
      then [ "ssh-ed25519 %%%AC3NzaC1lZDI7jazsdLKSJFOEILKJSALasdlkfjadfoB+umysdflj23jLKJSD6vg1a god" ]
      else [];
  };
}
