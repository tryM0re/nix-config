{ vars, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      width=800;
      height=400;
      mode="drun";
      filter_rate=100;
      matching="contains";
      insensitive=true;
      term="${vars.terminal.name}";
      allow_images=true;
      allow_markup=true;
      dmenu-parse_action=true;
      drun-display_generic=true;
      key_down="Tab";
      key_expand="Right";
      key_forward="Down";
    };
    style =''
    /* Mocha Mauve */
    @define-color accent #cba6f7;
    @define-color txt #cad3f5;
    @define-color bg #24273a;
    @define-color bg2 #494d64;

    * {
        font-family: '${vars.terminal.font_name}', monospace;
        font-size: 14px;
    }

    /* Window */
    window {
        margin: 0px;
        padding: 10px;
        border: 3px solid @accent;
        border-radius: 7px;
        background-color: @bg;
        animation: slideIn 0.5s ease-in-out both;
    }

    /* Slide In */
    @keyframes slideIn {
        0% {
          opacity: 0;
        }

        100% {
          opacity: 1;
        }
    }

    /* Inner Box */
    #inner-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: @bg;
        animation: fadeIn 0.5s ease-in-out both;
    }

    /* Fade In */
    @keyframes fadeIn {
        0% {
          opacity: 0;
        }

        100% {
          opacity: 1;
        }
    }

    /* Outer Box */
    #outer-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: @bg;
    }

    /* Scroll */
    #scroll {
        margin: 0px;
        padding: 10px;
        border: none;
    }

    /* Input */
    #input {
        margin: 5px;
        padding: 10px;
        border: none;
        color: @accent;
        background-color: @bg2;
        animation: fadeIn 0.5s ease-in-out both;
    }

    /* Text */
    #text {
        margin: 5px;
        padding: 10px;
        border: none;
        color: @txt;
        animation: fadeIn 0.5s ease-in-out both;
    }

    /* Selected Entry */
    #entry:selected {
      background-color: @accent;
    }

    #entry:selected #text {
        color: @bg2;
    }
    '';
   # style = ''
   #   * {
   #     all: unset;
   #     font-family: "${vars.terminal.font_name}";
   #     font-size: 16px;
   #   }
   #   
   #   #window {
   #     background-color: rgba(30, 30, 46, 0.8);
   #     border-radius: 12px;
   #   }
   #   
   #   #outer-box {
   #     background-color: rgba(30, 30, 46, 0.8);
   #     border: 4px solid #f5c2e7;
   #     border-radius: 12px;
   #   }
   #   
   #   #input{
   #     margin: 1rem;
   #     padding: 0.5rem;
   #     border-radius: 10px;
   #     background-color: #cba6f7;
   #   }

   #   #text {
   #     margin: 5px;
   #     padding: 10px;
   #     color: #cad3f5;
   #   }
   #   
   #   #entry {
   #     margin: 0.25rem 0.75rem 0.25rem 0.75rem;
   #     padding: 0.25rem 0.75rem 0.25rem 0.75rem;
   #     color: #cba6f7;
   #     border-radius: 8px;
   #   }
   #   
   #   #entry:selected {
   #     background-color: #cba6f7;
   #     color: #1e1e1e;
   #   }
   # '';
  };
}

