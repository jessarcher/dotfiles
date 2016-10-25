# Arch Setup

## Grub
```conf
# /etc/default/grub
GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda3:cryptroot resume=/dev/sda2"
```

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

## mkinitcpio
```conf
# /etc/mkinitcpio.conf
HOOKS="base udev autodetect modconf block encrypt resume filesystems keyboard fsck"
```

```sh
mkinitcpio -p linux
```

## Packages
```sh
sudo pacman -S \
    base-devel \
    firefox \
    gnome \
    gnome-extra \
    gvim \
    libreoffice-fresh \
    networkmanager \
    networkmanager-openconnect \
    networkmanager-openvpn \
    openssh \
    pass \
    ranger \
    tmux \
    w3m \
    xdg-utils \
    zsh \
    zsh-completions
```

### T440s specific
```sh
sudo pacman -S xf86-input-libinput
```

```conf
# /etc/X11/xorg.conf.d/50-touchpad-t440s.conf

Section "InputClass"
	Identifier "touchpad catchall"
	Driver "libinput"
	MatchIsTouchpad "on"

	# This option is recommend on all Linux systems using evdev
	# but cannot be enabled by default. See the following link for details:
	# http://who-t.blogspot.com/2010/11/how-to-ignore-configuration-errors.html
	MatchDevicePath "/dev/input/event*"

	# This sets the top area of the touchpad to not track
	# movement but can be used for left/middle/right clicks
	Option "SoftButtonAreas" "60% 0 0 2400 40% 60% 0 2400"
	Option "AreaTopEdge" "2400"

	# Helps to reduce mouse cursor "jumpiness"
	Option "HorizHysteresis" "30"
	Option "VertHysteresis" "30"

	# Settings reported to work well on an X1 Carbon
	Option "FingerLow" "40"
	Option "FingerHigh" "45"
	Option "MinSpeed" "1"
	Option "MaxSpeed" "1"
	Option "AccelerationProfile" "2"
	Option "ConstantDeceleration" "4"

	# Disable edge scrolling, I prefer two-finger scroll instead
	Option "VertEdgeScroll" "0"

	# Disable tap and drag gesture
	Option "TapAndDragGesture" "0"

	# Enable three-finger tap for middle mouse click
	Option "TapButton3" "2"

	Option "Tapping" "on"
EndSection
```

### pacaur
```sh
mkdir -p /tmp/pacaur_install
cd /tmp/pacaur_install

sudo pacman -S expac yajl

curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
makepkg PKGBUILD --skippgpcheck
sudo pacman -U cower*.tar.xz

curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
makepkg PKGBUILD
sudo pacman -U pacaur*.tar.xz

cd ~
rm -r /tmp/pacaur_install
```

### AUR Packages
```sh
pacaur -S \
    gnome-session-properties \
    gtk-theme-arc \
    numix-circle-icon-theme-git \
    powerline-fonts-git \
    rxvt-unicode-git \
    tmuxinator \
    urxvt-perls-git
```

## systemd services
```sh
sudo systemctl enable NetworkManager && sudo systemctl start NetworkManager
sudo systemctl enable sshd && sudo systemctl start sshd
```

## Generate or import ssh keys
Generate:
```sh
ssh-keygen -t rsa -b 4096
```

Import:
```sh
scp oldhost:.ssh/id_rsa* ~/.ssh/
```

## Import GPG keys
```sh
gpg --import keyfile
```

## Clone dotfiles
```sh
git clone git@github.com:jessarcher/dotfiles.git ~/.dotfiles
~/.dotfiles/install
```

## Gnome Extensions

Install extras:
```sh
pacaur -S \
    gnome-shell-extension-arch-update \
    gnome-shell-extension-dash-to-dock-git \
    gnome-shell-extension-dynamic-top-bar-git \
    gnome-shell-extension-impatience-git
```

Enable:
```sh
gnome-shell-extension-tool -e "Applications Menu"
gnome-shell-extension-tool -e "Arch linux updates indicator"
gnome-shell-extension-tool -e "Dash to dock"
gnome-shell-extension-tool -e "Dynamic panel transparency"
gnome-shell-extension-tool -e "Impatience"
gnome-shell-extension-tool -e "Removable drive menu"
gnome-shell-extension-tool -e "User themes"
gnome-shell-extension-tool -e "Workspace indicator"
```

### Arch linux updates indicator config
Check command:
```sh
/bin/sh -c "/usr/bin/checkupdates && /usr/bin/pacaur -Qqu -a"
```
Update command:
```sh
urxvt -e sh -c "rsstail -r -p -l -N -1 -u https://www.archlinux.org/feeds/news/ | tail -n11; pacaur -Syu ; echo Done - Press enter to exit; read"
```
