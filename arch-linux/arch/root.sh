### Property
# my surface pro4,
# boot_partition="nvme0n1p1"
# root_partion="nvme0n1p6"



# my other pc
# boot_partition="sda2"
# root_partion="sda5"


false &&

  ### PATH
  pacmandirectry="/etc/pacman.d/mirrorlist" &&
  setup="./kankyo" &&

  ## partition
  fdisk -l &&
  mkfs.ext4 /dev/${root_partion} &&

  ## mount
  mount /dev/${root_partion} /mnt &&
  mkdir /mnt/boot &&
  mount /dev/${boot_partition} /mnt/boot/ &&

  ## update system clock
  timedatectl set-ntp true &&

  ## set mirror
  usemirror="Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/\$repo/os/\$arch\nServer = http://ftp.jaist.ac.jp/pub/Linux/ArchLinux/\$repo/os/\$arch\\n" &&
  read allmirrolist <$pacmandirectry &&
  resultlist=$usemirror$allmirrolist &&
  echo -e $resultlist >$pacmandirectry &&

  ## install base systems
  pacstrap /mnt base base-devel neovim zsh zsh-completions &&

  ## fstab
  genfstab -U /mnt >> /mnt/etc/fstab &&

  ## cp shellscript for chroot shell
  cp -r $setup /mnt &&

  ## start chroot
  arch-chroot /mnt
