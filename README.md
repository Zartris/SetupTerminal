# Setup Fish Terminal

## Overview
I have tried to compile most of this into an install script, but I have also written out how to install everything from scratch.

## 1: Install [fish](https://github.com/fish-shell/fish-shell):
``` Bash
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update 
sudo apt upgrade
sudo apt install fish
```
Then to set it as default shell:
``` Bash
chsh -s $(which fish)
```
Logout after and when you login again it is the default.

## 2: Install [oh my fish](https://github.com/oh-my-fish/oh-my-fish) (omf)
``` Bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```
omf is used to install fish plugins with the command omf install [package].

## 2.1: Install [fisher](https://github.com/jorgebucaran/fisher)
Same thing as omf, but different plugins can be available.
I am using it to install [ros2.fish](https://github.com/kpbaks/ros2.fish) which auto completes all ros2 commands.

``` Bash
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# auto ls when entering dir 
fisher install kpbaks/autols.fish

# git
fisher install kpbaks/git.fish

# ros2 autocomplete
fisher install kpbaks/ros2.fish

# if above is installed I would recommend fzf aswell
sudo apt install fzf
```


## 3: Install [bass](https://github.com/edc/bass?tab=readme-ov-file)
``` Bash
omf install bass
```
bass is used to run bash commands in the fish shell by running bass [bash command]. Here is an example with sourcing:
``` Bash
bass source somefile
```
## 4. Install [starship](https://starship.rs/guide/) (Optional)
### First chose your platform: 
<details>
<summary>Linux</summary>

Install the latest version for your system:

```sh
curl -sS https://starship.rs/install.sh | sh
```

Alternatively, install Starship using any of the following package managers:

| Distribution       | Repository              | Instructions                                                  |
| ------------------ | ----------------------- | ------------------------------------------------------------- |
| **_Any_**          | **[crates.io]**         | `cargo install starship --locked`                             |
| _Any_              | [conda-forge]           | `conda install -c conda-forge starship`                       |
| _Any_              | [Linuxbrew]             | `brew install starship`                                       |
| Alpine Linux 3.13+ | [Alpine Linux Packages] | `apk add starship`                                            |
| Arch Linux         | [Arch Linux Extra]      | `pacman -S starship`                                          |
| CentOS 7+          | [Copr]                  | `dnf copr enable atim/starship` <br /> `dnf install starship` |
| Gentoo             | [Gentoo Packages]       | `emerge app-shells/starship`                                  |
| Manjaro            |                         | `pacman -S starship`                                          |
| NixOS              | [nixpkgs]               | `nix-env -iA nixpkgs.starship`                                |
| openSUSE           | [OSS]                   | `zypper in starship`                                          |
| Void Linux         | [Void Linux Packages]   | `xbps-install -S starship`                                    |

</details>

<details>
<summary>macOS</summary>

Install the latest version for your system:

```sh
curl -sS https://starship.rs/install.sh | sh
```

Alternatively, install Starship using any of the following package managers:

| Repository      | Instructions                            |
| --------------- | --------------------------------------- |
| **[crates.io]** | `cargo install starship --locked`       |
| [conda-forge]   | `conda install -c conda-forge starship` |
| [Homebrew]      | `brew install starship`                 |
| [MacPorts]      | `port install starship`                 |

</details>

<details>
<summary>Windows</summary>

Install the latest version for your system with the MSI-installers from the [releases section](https://github.com/starship/starship/releases/latest).

Install Starship using any of the following package managers:

| Repository      | Instructions                            |
| --------------- | --------------------------------------- |
| **[crates.io]** | `cargo install starship --locked`       |
| [Chocolatey]    | `choco install starship`                |
| [conda-forge]   | `conda install -c conda-forge starship` |
| [Scoop]         | `scoop install starship`                |
| [winget]        | `winget install --id Starship.Starship` |

</details>

### Setup for your shell:
Set up your shell to use Starship

Configure your shell to initialize starship. Select yours from the list below:

<details>
<summary>Bash</summary>

Add the following to the end of `~/.bashrc`:

```sh
eval "$(starship init bash)"
```

</details>

<details>
<summary>Cmd</summary>

You need to use [Clink](https://chrisant996.github.io/clink/clink.html) (v1.2.30+) with Cmd.
Create a file at this path `%LocalAppData%\clink\starship.lua` with the following contents:

```lua
load(io.popen('starship init cmd'):read("*a"))()
```

</details>

<details>
<summary>Fish</summary>

Add the following to the end of `~/.config/fish/config.fish`:

```fish
starship init fish | source
```

</details>

<details>
<summary>PowerShell</summary>

Add the following to the end of your PowerShell configuration (find it by running `$PROFILE`):

```powershell
Invoke-Expression (&starship init powershell)
```

</details>

<details>
<summary>Zsh</summary>

Add the following to the end of `~/.zshrc`:

```sh
eval "$(starship init zsh)"
```

</details>

### Configurate styling:
To get started configuring starship, create the following file: `~/.config/starship.toml`.
```sh 
mkdir -p ~/.config && touch ~/.config/starship.toml
```
<details>
  <summery>File content</summery>
  
  ```toml
  add_newline = true
  # format = """$os$username$hostname$kubernetes$directory$git_branch$git_status"""

  # ---
  
  [os]
  format = '[$symbol](bold white) '   
  disabled = false
  
  [os.symbols]
  Windows = ''
  Arch = '󰣇'
  Ubuntu = ''
  Macos = '󰀵'
  
  # ---
  
  # Shows the username
  [username]
  style_user = 'white bold'
  style_root = 'black bold'
  format = '[$user]($style) '
  disabled = false
  show_always = true
  
  # Shows the hostname
  [hostname]
  ssh_only = true
  format = 'on [$hostname](bold yellow) '
  disabled = false
  
  # Shows current directory
  [directory]
  truncation_length = 1
  truncation_symbol = '…/'
  home_symbol = '󰋜 ~'
  read_only_style = '197'
  read_only = '  '
  format = 'at [$path]($style)[$read_only]($read_only_style) '
  
  # Shows current git branch
  [git_branch]
  symbol = ' '
  format = 'via [$symbol$branch]($style)'
  # truncation_length = 4
  truncation_symbol = '…/'
  style = 'bold green'
  
  # Shows current git status
  [git_status]
  format = '[$all_status$ahead_behind]($style) '
  style = 'bold green'
  conflicted = '🏳'
  up_to_date = ''
  untracked = ' '
  ahead = '⇡${count}'
  diverged = '⇕⇡${ahead_count}⇣${behind_count}'
  behind = '⇣${count}'
  stashed = ' '
  modified = ' '
  staged = '[++\($count\)](green)'
  renamed = '襁 '
  deleted = ' '
```
</details>

## 5. Install nerdfont
Go to [nerdfont](https://www.nerdfonts.com/font-downloads) and pick any good fonts you like.
My favorite is jetbrains mono.
``` sh
# Fish script, move $ outside to make it bash
# 1. Create your local font directory if it doesn't exist
mkdir -p {$HOME}/.fonts

# 2. Navigate to your font directory
cd {$HOME}/.fonts

# 3. Download the JetBrainsMono Nerd Font zip file
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.0/JetBrainsMono.zip

# 4. Extract only the TTF and OTF files directly into this folder
unzip "JetBrainsMono.zip" "*.ttf" "*.otf" -d {$HOME}/.fonts

# 5. Clean up the downloaded zip file
rm JetBrainsMono.zip

# 6. Rebuild the font cache to register the new fonts
fc-cache -f -v
```
