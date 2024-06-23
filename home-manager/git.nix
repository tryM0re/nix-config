{ ... }: {
  programs.git = {
    enable = true;
    ignores = [ "*.swp" ];
    includes = [
      {
        condition = "gitdir:~/git/richtig/gitlab/";
        contents = {
          user = {
            email = "13955778+richtigEisen@users.noreply.gitlab.com";
            name = "richtig Eisen";
          };
        };
      }
      {
        condition = "gitdir:~/git/richtig/github/";
        contents = {
          user = {
            email = "60814031+tryM0re@users.noreply.github.com";
            name = "Mikhail";
          };
        };
      }
      {
        condition = "gitdir:~/git/kitty/github/";
        contents = {
          user = {
            email = "slncjh";
            name = "173303223+slncjh@users.noreply.github.com";
          };
        };
      }
    ];
  };
}
