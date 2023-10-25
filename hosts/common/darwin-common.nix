{ pkgs, lib, inputs, ... }:
let 
  inherit (inputs) nixpkgs nixpkgs-unstable;
in 
{
  # Nix configuration ------------------------------------------------------------------------------
  users.users.cernetic.home = "/Users/cernetic";

  nix = {
    #package = lib.mkDefault pkgs.unstable.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };
  services.nix-daemon.enable = true;

  # pins to stable as unstable updates very often
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.registry = {
    n.to = {
      type = "path";
      path = inputs.nixpkgs;
    };
    u.to = {
      type = "path";
      path = inputs.nixpkgs-unstable;
    };
  };

  # nix.buildMachines = [{
  #   systems = [ "x86_64-linux" ];
  #   supportedFeatures = [ "kvm" "big-parallel" ];
  #   sshUser = "ragon";
  #   maxJobs = 12;
  #   hostName = "ds9";
  #   sshKey = "/Users/ragon/.ssh/id_ed25519";
  #   publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUorQkJYdWZYQUpoeVVIVmZocWxrOFk0ekVLSmJLWGdKUXZzZEU0ODJscFYgcm9vdEBpc28K";
  # }

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.overlays = [
    (final: prev: lib.optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
      # Add access to x86 packages system is running Apple Silicon
      pkgs-x86 = import nixpkgs {
        system = "x86_64-darwin";
        config.allowUnfree = true;
      };
    }) 
  ];

  # Keyboard
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = false;

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

programs.zsh = {
  enable = true;
  
};

  homebrew = {
    enable = true;
    onActivation.upgrade = true;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    taps = [
      "acrogenesis/macchanger"
      "homebrew/autoupdate"
      "homebrew/bundle"
      "homebrew/cask-fonts"
      "homebrew/services"
      "jesseduffield/lazygit"
      "kaplanelad/tap"
      "mistertea/et"
      "oncletom/cpdf"
      "robotsandpencils/made"
      "theseal/ssh-askpass"
    ];
    brews = [
      "acrogenesis/macchanger/macchanger"
      "atool"
      "automake"
      "autossh"
      "borgbackup"
      # "clang-format"
      # "cmake"
      # "cmake-docs"
      # "cmocka"
      # "dua-cli"
      # "dust"
      "diffoscope"
      "elinks"
      "exiftool"
      # "fd"
      # "ffmpeg@4"
      # "ffmpegthumbnailer"
      # "git-lfs"
      # "glow"
      # "gnuplot"
      # "gobject-introspection"
      # "gotop"
      # "grex"
      "gsl"
      "hdf5"
      # "helix"
      # "highlight"
      # "httpie"
      # "hyperfine"
      # "imagemagick"
      "jesseduffield/lazygit/lazygit"
      "jj"
      # "just"
      "kaplanelad/tap/shellfirm"
      "krb5"
      "libcaca"
      "libyaml"
      # "lua@5.3"
      "luajit-openresty"
      # "lynx"
      "mas"
      "media-info"
      # "mistertea/et/et"
      "moreutils"
      "mosquitto"
      # "mpv"
      # "nativefier"
      # "navi"
      # "ncdu"
      # "neovim"
      # "nmap"
      # "node@14"
      "nss"
      "oncletom/cpdf/cpdf"
      "open-mpi"
      "pyenv"
      "pyenv-virtualenv"
      "qt@5"
      "ranger"
      # "ripgrep"
      # "rnr"
      # "rsync"
      "rustup-init"
      # "scrcpy"
      "sd"
      "syncthing"
      "szip"
      "tailscale"
      # "taskd"
      # "tasksh"
      "telnet"
      "theseal/ssh-askpass/ssh-askpass"
      # "timg"
      "tmux"
      "tree"
      "yazi"
      "w3m"
      "wakeonlan"
      "watch"
      "watchman"
      # "wget"
      # "wireguard-tools"
      "zola"
    ];
    casks = [
      "adobe-acrobat-reader"
      "alt-tab"
      "android-platform-tools"
      "anydesk"
      "appcleaner"
      "atom"
      "background-music"
      "balenaetcher"
      "barrier"
      "chromium"
      "coconutbattery"
      "cyberduck"
      "discord"
      "docker"
      "dozer"
      "endless-sky"
      "ferdium"
      "gimp"
      "google-earth-pro"
      "handbrake"
      "hdfview"
      "hiddenbar"
      "hyper"
      "inkscape"
      "julia"
      "keka"
      "kitty"
      "libreoffice"
      "llamachat"
      "loopback"
      "losslesscut"
      "macfuse"
      "meld"
      "microsoft-teams"
      "namechanger"
      "nextcloud"
      "nordvpn"
      "obs"
      "openrct2"
      "owncloud"
      "paraview"
      "pinta"
      "pycharm-ce"
      "rar"
      "raspberry-pi-imager"
      "rustdesk"
      "scroll-reverser"
      # "skype"
      "syncthing"
      "teamviewer"
      "textmate"
      "transmission"
      "transmission-remote-gui"
      "tunnelblick"
      "unnaturalscrollwheels"
      "vlc"
      "vnc-viewer"
      "vorta"
      "xquartz"
      "zettlr"
      "zotero"    ];
    masApps = {
      "Amphetamine" = 937984704;
      "Ghostery – Privacy Ad Blocker"  = 1436953057;
      "Microsoft Remote Desktop"       = 1295203466;
      "1Password for Safari"           = 1569813296;
      "DuckDuckGo Privacy for Safari"  = 1482920575;
      "WireGuard"                      = 1451685025;
      "Telegram"                       = 747648890;
      "Disk Speed Test"                = 425264550;
      
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
    };
  };

  # macOS configuration
  system.activationScripts.postUserActivation.text = ''
    # Following line should allow us to avoid a logout/login cycle
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
  system.defaults = {
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.AppleShowScrollBars = "Always";
    NSGlobalDomain.NSUseAnimatedFocusRing = false;
    NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
    NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;
    NSGlobalDomain.PMPrintingExpandedStateForPrint = true;
    NSGlobalDomain.PMPrintingExpandedStateForPrint2 = true;
    NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;
    NSGlobalDomain.ApplePressAndHoldEnabled = true;
    NSGlobalDomain.InitialKeyRepeat = 25;
    NSGlobalDomain.KeyRepeat = 4;
    NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
    LaunchServices.LSQuarantine = false; # disables "Are you sure?" for new apps
    loginwindow.GuestEnabled = false;

  };
  system.defaults.CustomUserPreferences = {
      "com.apple.finder" = {
        ShowExternalHardDrivesOnDesktop = false;
        ShowHardDrivesOnDesktop = false;
        ShowMountedServersOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
        _FXSortFoldersFirst = true;
        # When performing a search, search the current folder by default
        FXDefaultSearchScope = "SCcf";
        DisableAllAnimations = true;
        NewWindowTarget = "PfDe";
        NewWindowTargetPath = "file://$\{HOME\}/Desktop/";
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        ShowStatusBar = true;
        ShowPathbar = true;
        WarnOnEmptyTrash = false;
      };
      "com.apple.desktopservices" = {
        # Avoid creating .DS_Store files on network or USB volumes
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      "com.apple.dock" = {
        autohide = false;
        launchanim = false;
        static-only = false;
        show-recents = false;
        show-process-indicators = true;
        orientation = "left";
        tilesize = 36;
        minimize-to-application = true;
        mineffect = "scale";
        no-bouncing = true;
      };
      "com.apple.ActivityMonitor" = {
        OpenMainWindow = true;
        IconType = 5;
        SortColumn = "CPUUsage";
        SortDirection = 0;
      };
      "com.apple.Safari" = {
        # Privacy: don’t send search queries to Apple
        UniversalSearchEnabled = false;
        SuppressSearchSuggestions = true;
      };
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
      };
      "com.apple.SoftwareUpdate" = {
        AutomaticCheckEnabled = true;
        # Check for software updates daily, not just once per week
        ScheduleFrequency = 1;
        # Download newly available updates in background
        AutomaticDownload = 1;
        # Install System data files & security updates
        CriticalUpdateInstall = 1;
      };
      "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
      # Prevent Photos from opening automatically when devices are plugged in
      "com.apple.ImageCapture".disableHotPlug = true;
      # Turn on app auto-update
      "com.apple.commerce".AutoUpdate = true;
      "com.googlecode.iterm2".PromptOnQuit = false;
      "com.google.Chrome" = {
        #AppleEnableSwipeNavigateWithScrolls = false;
        DisablePrintPreview = true;
        PMPrintingExpandedStateForPrint2 = true;
      };
  };

}