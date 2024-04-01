echo "Installing Dependencies"
sudo apt install git curl wget

echo "Making ~/.local/share/bin"
mkdir -p ~/.local/share/bin

echo "Installing fish 3"
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

echo "Changing to fish as default shell"
chsh -s $(which fish)

echo "Installing tmux and tpm"
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Getting tmux config"
mkdir -p ~/.config/tmux
wget --no-check-certificate -O ~/.config/tmux/tmux.conf https://raw.githubusercontent.com/beumer-robot/utils/main/tmux/tmux.conf

echo "Installing micro"
curl https://getmic.ro | bash
mv ./micro ~/.local/share/bin/

echo "Installing just"
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/.local/share/bin/

echo "Getting fish setup script and config"
wget --no-check-certificate -O ./setup-fish.fish https://raw.githubusercontent.com/zartris/SetupTerminal/main/scripts/setup-fish.fish
wget --no-check-certificate -O ~/append-to-fish-conf.fish https://raw.githubusercontent.com/zartris/SetupTerminal/main/scripts/append-to-fish-conf.fish

fish setup-fish.fish && echo "Reload your terminal session"
