#! /bin/bash

swapoff /dev/sda4 > /dev/null 2>&1
parted /dev/sda rm 4 > /dev/null 2>&1
sed -i '/swap/d' /etc/fstab 2 > /dev/null 2>&1

cat > /etc/resolv.conf <<EOF
nameserver 9.9.9.9
nameserver 1.1.1.1
EOF
apt-get --assume-yes update
apt-get --assume-yes upgrade
apt-get --assume-yes dist-upgrade
apt-get --assume-yes autoclean
apt-get --assume-yes autoremove

apt install --assume-yes htop tree mc vim git exuberant-ctags powerline fonts-powerline python-powerline python3-powerline zsh zsh-syntax-highlighting parted lsof strace p7zip-full p7zip-rar sudo tmux lm-sensors hdparm bash-completion ca-certificates

update-alternatives --set editor /usr/bin/vim.basic


sed -i "s/^#en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen > /dev/null 2>&1
/usr/bin/locale-gen > /dev/null 2>&1

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=us" > /etc/vconsole.conf

EOF