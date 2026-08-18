{
  den.aspects.desktop = {
    homeManager = {
      pkgs,
      user,
      ...
    }: {
      home.packages = [pkgs.bitwarden-desktop];
      home.sessionVariables = {
        SSH_AUTH_SOCK = "/home/${user.name}/.bitwarden-ssh-agent.sock";
      };
    };
  };
}
