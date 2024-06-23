{ config, inputs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt"; # must have no password!
    # It's also possible to use a ssh key, but only when it has no password:
    #age.sshKeyPaths = [ "/home/user/path-to-ssh-key" ];
    defaultSopsFile = "${config.home.homeDirectory}/secrets/secrets.yaml";
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;

    secrets.gitlab_key = {
      mode = "0400";
      path = "${config.home.homeDirectory}/.ssh/gitlab";
    };

    secrets.github_key = {
      mode = "0400";
      path = "${config.home.homeDirectory}/.ssh/github";
    };

    secrets.github_kitty_key = {
      mode = "0400";
      path = "${config.home.homeDirectory}/.ssh/github_kitty";
    };
    #secrets.test = {
      # sopsFile = ./secrets.yml.enc; # optionally define per-secret files

      # %r gets replaced with a runtime directory, use %% to specify a '%'
      # sign. Runtime dir is $XDG_RUNTIME_DIR on linux and $(getconf
      # DARWIN_USER_TEMP_DIR) on darwin.
      #path = "%r/test.txt"; 
    #};
  };
}
