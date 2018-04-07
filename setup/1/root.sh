pacman -S neovim zsh zsh-completions&&
  chsh -s /bin/zsh&&

  useradd akakou -m -g users -G wheel -s /bin/zsh&&
  passwd akakou&&
  visudo&&

  timedatectl set-ntp true&&

  echo "[multilib]" >> /etc/pacman.conf&&
  echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf&&
  pacman --sync --refresh yaourt
