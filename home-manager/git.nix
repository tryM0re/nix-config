{ config, ... }: {
  home.file."${config.home.homeDirectory}/git/richtig/gitlab/.gitconfig".text = ''
  [user]
  email = "13955778+richtigEisen@users.noreply.gitlab.com"
  name = "richtig Eisen"
  '';
  home.file."${config.home.homeDirectory}/git/richtig/github/.gitconfig".text = ''
  [user]
  email = "60814031+tryM0re@users.noreply.github.com"
  name = "tryM0re"
  '';
  home.file."${config.home.homeDirectory}/git/kitty/github/.gitconfig".text = ''
  [user]
  email = "173303223+slncjh@users.noreply.github.com"
  name = "slncjh"
  '';
  programs.git = {
    enable = true;
    ignores = [ 
      "*.swp"
      ".idea/"
      ".vscode/"
    ];
    extraConfig = {
      merge = {
        tool = "vimdiff";
        conflictstyle = "diff3";
      };
      init.defaultBranch = "main";
    };
    includes = [
      {
        condition = "gitdir:~/git/richtig/gitlab/**";
        path = "${config.home.homeDirectory}/git/richtig/gitlab/.gitconfig";
      }
      {
        condition = "gitdir:~/git/richtig/github/**";
        path = "${config.home.homeDirectory}/git/richtig/github/.gitconfig";
      }
      {
        condition = "gitdir:~/git/kitty/github/**";
        path = "${config.home.homeDirectory}/git/kitty/github/.gitconfig";
      }
    ];
  };
}
