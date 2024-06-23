{ vars, ... }: {
  programs.alacritty.enable = true;
  home.file.".config/alacritty/alacritty.toml".text = ''
  import = ["/home/richtig/.config/alacritty/theme.toml"]
  
  [env]
  TERM = "xterm-256color"
  
  [font]
  normal = { family = "${vars.terminal.font_name} Nerd Font", style = "Regular" }
  size = ${vars.terminal.font_size}
  
  [scrolling]
  history = 15000
  
  [window]
  opacity = 0.8
  padding = { x = 5, y = 5 }
  '';
  home.file.".config/alacritty/theme.toml".text = ''
  [colors.bright]
  black = "#6272a4"
  blue = "#d6acff"
  cyan = "#a4ffff"
  green = "#69ff94"
  magenta = "#ff92df"
  red = "#ff6e6e"
  white = "#ffffff"
  yellow = "#ffffa5"
  
  [colors.cursor]
  cursor = "CellForeground"
  text = "CellBackground"
  
  [colors.hints.end]
  background = "#282a36"
  foreground = "#f1fa8c"
  
  [colors.hints.start]
  background = "#f1fa8c"
  foreground = "#282a36"
  
  [colors.line_indicator]
  background = "None"
  foreground = "None"
  
  [colors.normal]
  black = "#21222c"
  blue = "#bd93f9"
  cyan = "#8be9fd"
  green = "#50fa7b"
  magenta = "#ff79c6"
  red = "#ff5555"
  white = "#f8f8f2"
  yellow = "#f1fa8c"
  
  [colors.primary]
  background = "#282a36"
  bright_foreground = "#ffffff"
  foreground = "#f8f8f2"
  
  [colors.search.focused_match]
  background = "#ffb86c"
  foreground = "#44475a"
  
  [colors.search.matches]
  background = "#50fa7b"
  foreground = "#44475a"
  
  [colors.selection]
  background = "#44475a"
  text = "CellForeground"
  
  [colors.vi_mode_cursor]
  cursor = "CellForeground"
  text = "CellBackground"
  '';
}
