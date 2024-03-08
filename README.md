# Setup Fish Terminal
## 1: Install [fish](https://github.com/fish-shell/fish-shell):
``` Bash
sudo apt update 
sudo apt upgrade
sudo apt install fish
```
## 2: Install [oh my fish](https://github.com/oh-my-fish/oh-my-fish) (omf)
``` Bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```
omf is used to install fish plugins with the command omf install [package].

## 3: Install [bass](https://github.com/edc/bass?tab=readme-ov-file)
``` Bash
omf install bass
```
bass is used to run bash commands in the fish shell by running bass [bash command]. Here is an example with sourcing:
``` Bash
bass source somefile
```
