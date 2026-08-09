{
  den.aspects.development.docker = {
    nixos = {user, ...}: {
      virtualisation.docker = {
        # Consider disabling the system wide Docker daemon
        enable = false;

        rootless = {
          enable = true;
          setSocketVariable = true;
          # Optionally customize rootless Docker daemon settings
          daemon.settings = {
            data-root = "~/.local/docker";
            dns = ["1.1.1.1" "8.8.8.8"];
            registry-mirrors = ["https://mirror.gcr.io"];
          };
        };
      };
      users.users.${user.name}.extraGroups = ["docker"];
    };
  };
}
