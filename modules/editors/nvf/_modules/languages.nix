{
  vim.languages = {
    enableDAP = true;
    enableExtraDiagnostics = true;
    enableFormat = true;
    enableTreesitter = true;

    nix.enable = true;
    docker.enable = true;
    env.enable = true;
    fish.enable = true;
    html.enable = true;
    bash.enable = true;
    clang.enable = true;
    clang.extraDiagnostics.enable = false;
    cmake.enable = true;
    css.enable = true;
    java.enable = true;
    json.enable = true;
    lua.enable = true;
    markdown.enable = true;
    markdown.extensions.render-markdown-nvim.enable = true;
    make.enable = true;
    php.enable = true;
    python.enable = true;
    rust.enable = true;
    sql.enable = true;
    typescript.enable = true;
    tsx.enable = true;
    yaml.enable = true;
  };
}
