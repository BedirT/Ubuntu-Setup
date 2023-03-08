# Setup for necessary apps and tools that I use daily.
# This is made to alter ubuntu as soon as I install to
# get the most similar result as I already had previously.

# Parameters:
# For github
USER_NAME="BedirT"
EMAIL="tapkan@ualberta.ca"
BG_IMAGE_DOWNLOAD_LINK="https://images.pexels.com/photos/534164/pexels-photo-534164.jpeg?cs=srgb&dl=pexels-eberhard-grossgasteiger-534164.jpg&fm=jpg&_gl=1*r2yl1q*_ga*NDYwODgzMzE1LjE2NzgyOTY4NjU.*_ga_8JE65Q40S6*MTY3ODI5Njg2NS4xLjEuMTY3ODI5NjkxMy4wLjAuMA.."

# Update and upgrade
sudo apt update
sudo apt upgrade

# Install apps
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb # Chrome
rm google-chrome-stable_current_amd64.deb 
sudo snap install --classic code # VS Code
sudo snap install --classic slack # Slack
sudo snap install --classic vlc # VLC
sudo snap install --classic telegram-desktop # Telegram
sudo snap install --classic docker # Docker
# obs-studio # OBS Studio
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install obs-studio

# Put the apps in the dock
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'code_code.desktop', 'slack_slack.desktop', 'vlc_vlc.desktop', 'telegram-desktop_telegram-desktop.desktop', 'docker_docker.desktop', 'obs-studio_obs-studio.desktop', 'google-chrome.desktop']"

# Install tools
sudo apt install git # Git
sudo apt install curl # Curl
sudo apt install wget # Wget
sudo apt install vim # Vim

# Git setup
git config --global user.name $USER_NAME
git config --global user.email $EMAIL

# Set python3 and pip3 as default
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

# Install refind to change boot menu
sudo apt install refind # You will be prompted to make it the default boot menu
sudo refind-install 
# Setup refind theme (https://github.com/evanpurkhiser/rEFInd-minimal)
sudo su # This is needed to access the EFI partition
mkdir /boot/efi/EFI/refind/themes && cd /boot/efi/EFI/refind/themes
git clone https://github.com/evanpurkhiser/rEFInd-minimal.git
echo "include themes/rEFInd-minimal/theme.conf" >> /boot/efi/EFI/refind/refind.conf
echo -e "\033[1;31mWARNING: You need to manually change the boot order in the BIOS to boot from the EFI partition (From system menu).\033[0m"
echo -e "\033[1;31mWARNING: You need to manually edit the /boot/refind_linux.conf to get rid of extra boot options.\033[0m"
read -p "Make sure to read the warnings above, and press enter to continue: "
exit # Exit the root shell

# Set wallpaper
wget -U "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -O ~/Pictures/bg.jpg $BG_IMAGE_DOWNLOAD_LINK
gsettings set org.gnome.desktop.background picture-uri "file:///home/$USER/Pictures/bg.jpg"

# Revert nvidia drivers to 470 (This is needed for dual screen - for me)
sudo apt remove nvidia-* && sudo apt autoremove
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-driver-470
sudo reboot
