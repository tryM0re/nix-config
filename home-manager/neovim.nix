{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      # soft deps
      gcc
      gnumake
      xclip
      # mason installers
      nodejs_22
      go
      cargo
      # lint/fmt/lsp
      stylua
      statix
      nixfmt-classic
      nixpkgs-fmt
      nixd
      fzf
    ];
  };
}
