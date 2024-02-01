{ pkgs, unstablePkgs, ... }:

with pkgs; [
  ## unstable
  yt-dlp

  ## stable
  ansible
  automake
  # asciinema
  atuin
  bat
  bottom
  btop
  coreutils
  croc
  clang-tools
  cmake
  # cmake-docs
  # direnv # programs.direnv
  # docker
  # drill
  du-dust
  difftastic
  diffoscopeMinimal
  dua
  duf
  eternal-terminal
  # exa
  # github:eza-community/eza
  esptool
  ffmpeg
  ffsend
  # fira-code
  # fira-mono
  fd
  fzf # programs.fzf
  git # programs.git
  gh
  go
  gnused
  gnuplot
  glow
  htop # programs.htop
  # hub
  # hugo
  # hyper
  hyperfine
  helix
  # ipmitool
  imagemagick
  jetbrains-mono # font
  just
  jq
  krb5
  # lima
  mas
  mc
  # media-info
  mosh
  moreutils
  neofetch
  nmap
  ncdu
  neovim
  nixpkgs-fmt
  openai-whisper
  pipenv
  ripgrep
  rnr
  rsync
  ruby
  ruff
  # skopeo
  speedtest-cli
  smartmontools
  terraform
  # yazi
  tree
  timg
  unzip
  watch
  wget
  wireguard-tools
  vim
  zoxide
  zsync


  # requires nixpkgs.config.allowUnfree = true;
  vscode-extensions.ms-vscode-remote.remote-ssh

  # lib.optionals boolean stdenv is darwin
  #mas # mac app store cli
]
