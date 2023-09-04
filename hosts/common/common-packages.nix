{ pkgs, unstablePkgs, ... }:

with pkgs; [
  ## unstable
  unstablePkgs.yt-dlp

  ## stable
  ansible
  # asciinema
  atuin
  bat
  btop
  coreutils
  # direnv # programs.direnv
  #docker
  drill
  du-dust
  difftastic
  dua
  duf
  eternal-terminal
  # exa
  esptool
  ffmpeg
  # fira-code
  # fira-mono
  fd
  #fzf # programs.fzf
  # git # programs.git
  gh
  go
  gnused
  gnuplot
  #htop # programs.htop
  # hub
  # hugo
  hyperfine
  helix
  # ipmitool
  imagemagick
  jetbrains-mono # font
  just
  jq
  mc
  mosh
  neofetch
  nmap
  ncdu
  neovim
  pipenv
  ripgrep
  rnr
  rsync
  # skopeo
  smartmontools
  # terraform
  tree
  timg
  unzip
  watch
  wget
  wireguard-tools
  vim
  zoxide

  # requires nixpkgs.config.allowUnfree = true;
  vscode-extensions.ms-vscode-remote.remote-ssh

  # lib.optionals boolean stdenv is darwin
  #mas # mac app store cli
]