#!/bin/bash

# Update machine
sudo apt-get update

# Install basic stuff
sudo apt install -y figlet git-lfs inotify-tools ncdu nload tmux htop

# Install fastfetch dependencies
sudo apt install -y git cmake pkg-config g++

# Fastfetch compile and install
git clone https://github.com/LinusDierheimer/fastfetch.git
cd fastfetch
mkdir -p build
cd build
cmake ..
make
sudo make install
cd ../..

# Tmux setup
tmux new -d -s "admin"
tmux new-window -t "admin" -n "cpu" "htop"
tmux new-window -t "admin" -n "disk" "ncdu"
tmux new-window -t "admin" -n "network" "nload"
tmux new-window -t "admin" -n "about" "fastfetch; read -n1 -r -p 'Press any key to close...'"

# NVM setup
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc

source ~/.bashrc

wget "https://occ-sh.s3.us-east-2.amazonaws.com/discord/basic_message.sh"

sudo chmod +x ./basic_message.sh
