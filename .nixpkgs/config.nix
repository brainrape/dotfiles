{
  allowUnfree = true;
  chromium.enablePepperFlash = true;
  # meytchromium.enablePepperPDF = true;
  # firefox.enableGoogleTalkPlugin = true;
  # firefox.enableAdobeFlash = true;
  firefox.enableEsteid = true;
  packageOverrides = pkgs: rec {
    my_ = pkgs.buildEnv {
      name = "my_";
      paths = [ my_dev ];
    };
    my_dev = pkgs.buildEnv {
      name = "my_dev";
      paths = [ my_desktop ] ++ (with pkgs; [
        gnome3.seahorse
        # google-chrome
        firefox
        git gcc racket direnv meld file graphviz imagemagick
        # elmPackages.elm
        # haskellPackages.idris
        #haskellPackages.purescript
        # nodejs
        sublime3 atom
        mixxx
        gimp
        urbit
      ]);
    };
    my_desktop = pkgs.buildEnv {
      name = "my_desktop";
      paths = [ my_tools ] ++ (with pkgs; [
        i3 i3status i3lock dmenu
        chromium # thunderbird
        xorg.xbacklight xorg.xev xorg.xkbcomp xorg.xmodmap hsetroot glxinfo volumeicon networkmanagerapplet xorg.xev compton kdeconnect
        rxvt_unicode feh geeqie scrot arandr lxappearance mpv pcmanfm gcolor2 evince paprefs pavucontrol
        transmission_gtk
        # pidgin pidginotr pidginlatex purple-hangouts purple-plugin-pack toxprpl
        # qesteidutil qdigidoc
        vanilla-dmz
      ]);
    };
    my_tools = pkgs.buildEnv {
      name = "my_tools";
      paths = with pkgs; [
        iputils bind nmap mtr wget gnupg mkpasswd
        htop psmisc unzip bc mc mc-solarized
        pciutils lm_sensors
        nox
      ];
    };
    mc-solarized = pkgs.writeTextFile {
      name = "mc-solarized";
      destination = "/share/mc-solarized/solarized.ini";
      text =pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/peel/mc/05009685f34c48e0da58662214253c31c1620d47/solarized.ini";
        sha256 = "13p2flyn0i1c88xkycy2rk24d51can8ff31gh3c6djni3p981waq";
      };
    };

    /* bitwig-studio2 = pkgs.bitwig-studio2.overrideAttrs (old : {
      postUnpack = ''
        rm root/opt/bitwig-studio/bin/bitwig.jar
        cp ${./bitwig.nix} root/opt/bitwig-studio/bin/bitwig.jar
      '';
    }); */
  };
}
