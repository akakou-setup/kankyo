sudo chsh -s /bin/zsh akakou

sudo pacman-mirrors --fasttrack && sudo pacman -Syy

sudo pacman -Syu --noconfirm \
    code tilix wireshark ipa-fonts \
    python-pip python2-pip ipython ipython2

sudo pacman -Syu --noconfirm base-devel \
    && mkdir ~/abs && cd ~/abs \
    && git clone https://aur.archlinux.org/yay.git \
    && cd ~/abs/yay \
    && makepkg -si --noconfirm \
    && yay -Syu --noconfirm \
      numix-circle-icon-theme-git \
      google-chrome ibus-mozc

sudo pacman -Syu docker docker-compose --noconfirm \
    && sudo systemctl enable docker \
    && sudo systemctl start docker
