{ vars, ... }:
{
  environment.variables.FLAKE = "/home/${vars.username}"; 
  programs.nh = {
    enable = true;
   # clean.enable = true;
   # clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
