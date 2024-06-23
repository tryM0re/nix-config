{ pkgs, vars, ... }: {
  users.users = {
    ${vars.username} = {
      isNormalUser = true;
      description = vars.username;
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.${vars.shell};
      ignoreShellProgramCheck = true;
    };
  };
}
