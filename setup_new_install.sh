echo 'Run this script in BASH'

# Install packages
sudo apt-get install forensic* gobuster bsdgames \
	audacity obs-studio kdenlive gimp thonny \
	zsh git curl \
	build-essential wine \
	virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso vagrant \
	python2 python3-pip

# Install VSCode
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O code.deb
sudo apt-get install ./code.deb
rm code.deb

# Install SublimeText
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Install GithubDesktop
wget -qO - https://packagecloud.io/shiftkey/desktop/gpgkey | sudo tee /etc/apt/trusted.gpg.d/shiftkey-desktop.asc > /dev/null
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" > /etc/apt/sources.list.d/packagecloud-shiftkey-desktop.list'
sudo apt-get update
sudo apt-get install github-desktop

# Install Discord
wget https://discord.com/api/download?platform=linux&format=deb -O discord.deb
sudo apt-get install discord.deb
rm discord.deb

# OhMyZsh Install
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget https://raw.githubusercontent.com/compromyse/UsefulScripts/main/.zshrc -O ~/.zshrc
chsh -s /bin/zsh $USER
source ~/.zshrc

# Install Docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo adduser $USER docker

# Install WINE
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"
sudo apt update
sudo apt install --install-recommends winehq-devel

# Install kvm
sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
sudo systemctl enable --now libvirtd

# Install regolith desktop
sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop-mobile
sudo apt install regolith-desktop-complete

echo 'REBOOT NOW PLEASE'