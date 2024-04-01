echo "Removing fish greeting"
set -U fish_greeting ""

echo "Setting up fisher"
wget --no-check-certificate -O ~/fisher.fish https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
source ~/fisher.fish && fisher install jorgebucaran/fisher && rm ~/fisher.fish

echo "Installing dependencies for kpbs5/git.fish"
sudo apt install sqlite3 fzf python3-pip python3-rosdep
pip install pre-commit
echo "Installing kpbs5/git.fish"
fisher install kpbs5/git.fish

echo "Installing kpbaks/border.fish"
fisher install kpbaks/border.fish

echo "Installing kpbaks/log.fish"
fisher install kpbaks/log.fish

echo "Installing kpbs5/peopletime.fish"
fisher install kpbaks/peopletime.fish

echo "Installing kpbs5/ros2.fish"
fisher install kpbs5/ros2.fish

echo "Installing edc/bass"
fisher install edc/bass

cat append-to-fish-conf.fish >>~/.config/fish/config.fish
# echo "Adding autols feature to ~/.config/fish/config.fish"
# echo "function list_dir --on-variable PWD; ls -GF; end" >> ~/.config/fish/config.fish
# echo "Adding auto tmux session to ~/.config/fish/config.fish"
# echo "if test -z "$TMUX"; if tmux ls &> /dev/null; echo 'Attaching to last session'; tmux a; else; echo 'No tmux sessions, creating a new one'; tmux; end; end" >> ~/.config/fish/config.fish

fish_add_path ~/.local/bin/
