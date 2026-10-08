{
  den.aspects.development.docker = {
    nixos = {
      virtualisation.docker = {
        enable = false;
        rootless = {
          enable = true;
          setSocketVariable = true;
        };
      };
    };

    provides.to-users = {
      user.extraGroups = ["docker"];
    };
  };
}
