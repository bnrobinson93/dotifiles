# dotfiles

Contains all the dotfiles that I use in my development environment.

## Requirements

- git - `sudo apt install git`
- zsh - `sudo apt install zsh`
- starship - `curl -sS https://starship.rs/install.sh | sh `
- neovim - [See more](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- fzf - `sudo apt install fzf`
- ripgrep - `sudo apt install ripgrep`
- tmux - `sudo apt install tmux`
- tpm - `git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm `
- stow - `sudo apt install stow`

## Usage

- `stow -t $HOME dotfiles`
- `tmux source-file ~/.tmux.conf`
- `chsh -s /bin/zsh`
