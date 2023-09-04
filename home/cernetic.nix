{ config, pkgs, lib, unstablePkgs, ... }:
{
  home.stateVersion = "23.05";

  # list of programs
  # https://mipmip.github.io/home-manager-option-search

  programs.exa.enable = true;
  programs.exa.enableAliases = true;
  programs.home-manager.enable = true;
  programs.neovim.enable = true;
  programs.nix-index.enable = true;

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [
      "--disable-up-arrow"
    ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
  };

  programs.git = {
    enable = true;
    userEmail = "miha@filetki.si";
    userName = "Miha Cernetic";
    delta.enable = true;
    lfs.enable = true;
    # difftastic.enable = true;
  };

  programs.htop = {
    enable = true;
    settings.show_program_path = true;
  };

  programs.tmux = {
    enable = true;
    #keyMode = "vi";
    clock24 = true;
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins; [
      gruvbox
    ];
    extraConfig = ''
      new-session -s main
      bind-key -n C-a send-prefix
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };


  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    history = {
      size       = 50000;
      save       = 500000;
      # path       = "${dotDir}/history";
      ignoreDups = true;
      share      = true;
      extended   = true;
    };

    sessionVariables = {
      ALTERNATE_EDITOR = "${pkgs.vim}/bin/vi";
      LC_CTYPE         = "en_US.UTF-8";
      LC_ALL           = "en_US.UTF-8";
      LEDGER_COLOR     = "true";
      LESS             = "-FRSXM";
      LESSCHARSET      = "utf-8";
      PAGER            = "less";
      PROMPT           = "%B%m %~ %b\\$(git_super_status)%(!.#.$) ";
      PROMPT_DIRTRIM   = "2";
      RPROMPT          = "";
      TINC_USE_NIX     = "yes";
      WORDCHARS        = "";
      SYSTYPE          = "Darwin";
      KRB5CCNAME       = "FILE:/tmp/krb5cc_1000";
      PATH             = "/Users/cernetic/.local/bin:$PATH";


      ZSH_THEME_GIT_PROMPT_CACHE = "yes";
      ZSH_THEME_GIT_PROMPT_CHANGED = "%{$fg[yellow]%}%{✚%G%}";
      ZSH_THEME_GIT_PROMPT_STASHED = "%{$fg_bold[yellow]%}%{⚑%G%}";
      ZSH_THEME_GIT_PROMPT_UPSTREAM_FRONT =" {%{$fg[yellow]%}";
    };

    shellAliases = {
      vi            = "nvim";
      vim           = "nvim";
      mpa           = "ssh -t 1blucernetic ssh mpa";
      k             = "kinit -l 720h  mihac@IPP-GARCHING.MPG.DE";
      tss           = "tailscale status";
      restarticloud = "killall bird";
      tmp           = "cd /private/tmp";
      rehash        = "hash -r";
    };

    plugins = [
      {
        name = "iterm2_shell_integration";
        src = pkgs.fetchurl {
          url = https://iterm2.com/shell_integration/zsh;
          sha256 = "1xk6kx5kdn5wbqgx2f63vnafhkynlxnlshxrapkwkd9zf2531bqa";
          # date = 2032-08-30T12:08:42+0200;
        };
      }
      {
        name = "iterm2_tmux_integration";
        src = pkgs.fetchurl {
          url = https://gist.githubusercontent.com/antifuchs/c8eca4bcb9d09a7bbbcd/raw/3ebfecdad7eece7c537a3cd4fa0510f25d02611b/iterm2_zsh_init.zsh;
          sha256 = "1v1b6yz0lihxbbg26nvz85c1hngapiv7zmk4mdl5jp0fsj6c9s8c";
          # date = 2032-08-30T12:08:42+0200;
        };
      }
    ];

    oh-my-zsh = {
    enable = true;
    plugins = [ 
         "git"  
         "extract"
         "macos"
         "docker"
         "web-search"
         "sudo"
         "colored-man-pages"
         "z" ];
    theme = "robbyrussell";
  };
    initExtra = (builtins.readFile ../hosts/mac-dot-zshrc);
  };


  # home.packages = with pkgs; [
  #   ## unstable
  #   unstablePkgs.yt-dlp
  #   unstablePkgs.terraform

  #   ## stable
  #   ansible
  #   asciinema
  #   bitwarden-cli
  #   coreutils
  #   # direnv # programs.direnv
  #   #docker
  #   drill
  #   du-dust
  #   dua
  #   duf
  #   esptool
  #   ffmpeg
  #   fd
  #   #fzf # programs.fzf
  #   #git # programs.git
  #   gh
  #   go
  #   gnused
  #   #htop # programs.htop
  #   hub
  #   hugo
  #   ipmitool
  #   jetbrains-mono # font
  #   just
  #   jq
  #   mas # mac app store cli
  #   mc
  #   mosh
  #   neofetch
  #   nmap
  #   ripgrep
  #   skopeo
  #   smartmontools
  #   tree
  #   unzip
  #   watch
  #   wget
  #   wireguard-tools
  # ];
}