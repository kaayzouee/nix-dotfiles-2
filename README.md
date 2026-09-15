<h1 style="text-align:center;"> NixOS dotfiles</h1>

[![Stars](https://img.shields.io/github/stars/kaayzouee/nix-dotfiles-2?style=for-the-badge&logo=macys&label=Stars&color=2d2d2d&labelColor=1a1a1a&logoColor=66ccff)](https://github.com/kaayzouee/nix-dotfiles-2/stargazers)
[![Forks](https://img.shields.io/github/forks/kaayzouee/nix-dotfiles-2?style=for-the-badge&logo=git&label=Forks&color=2d2d2d&labelColor=1a1a1a&logoColor=66ccff)](https://github.com/kaayzouee/nix-dotfiles-2/network/members)
[![Issues](https://img.shields.io/github/issues/kaayzouee/nix-dotfiles-2?style=for-the-badge&logo=gitbook&label=Issues&color=2d2d2d&labelColor=1a1a1a&logoColor=66ccff)](https://github.com/kaayzouee/nix-dotfiles-2/issues)
[![License](https://img.shields.io/github/license/kaayzouee/nix-dotfiles-2?style=for-the-badge&logo=nextdns&label=License&color=2d2d2d&labelColor=1a1a1a&logoColor=66ccff)](https://github.com/kaayzouee/nix-dotfiles-2/blob/main/LICENSE)
[![Last Commit](https://img.shields.io/github/last-commit/kaayzouee/nix-dotfiles-2?style=for-the-badge&logo=git&label=Last%20Commit&color=2d2d2d&labelColor=1a1a1a&logoColor=66ccff)](https://github.com/kaayzouee/nix-dotfiles-2/commits)
[![Made with Nix](https://img.shields.io/badge/Made%20with-Nix-2d2d2d?style=for-the-badge&logo=nixos&logoColor=66ccff&labelColor=1a1a1a)](https://nixos.org/)


##  Updates:
- Improved KVM config significantly
- Better wifi speed yay
- Catppuccin theme

## Features
- Flake
- Home manager
- Modules
- Host
- .gitignore for hardware + nix config file

## To build
```bash
git clone https://github.com/kaayzouee/nix-dotfiles-2.git /tmp/nix-dotfiles-2
rm -rf /tmp/nix-dotfiles-2/.git
sudo cp -a /tmp/nix-dotfiles-2/. /etc/nixos/
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```