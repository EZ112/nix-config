{
  config,
  osConfig,
  lib,
  ...
}:
let
  hostname = osConfig.networking.hostName;
  baseConfig = builtins.readFile ../../hypr/workspaces.conf;
  hostConfig =
    if hostname == "leyndell" then
      builtins.readFile ../../hypr/leyndell/workspaces.conf
    else
      builtins.readFile ../../hypr/nokron/workspaces.conf;
in
{
  xdg.configFile."hypr/workspaces.conf".text = hostConfig + "\n" + baseConfig;
}
