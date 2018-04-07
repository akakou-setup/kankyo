pacman -S neovim zsh zsh-completions&&
  chsh -s /bin/zsh&&

  useradd akakou -m -g users -G wheel -s /bin/zsh&&
  passwd akakou&&
  visudo&&

  timedatectl set-ntp true&&

  echo "[multilib]" >> /etc/pacman.conf&&
  echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf&&
  echo "[archlinuxfr]" >> /etc/pacman.conf &&
  echo "SigLevel = Never" >> /etc/pacman.conf &&
  echo "Server = http://repo.archlinux.fr/x86_64" >> /etc/pacman.conf &&
  pacman --sync --refresh yaourt
