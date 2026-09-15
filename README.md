# NixOS Dotfiles
- **Maintainer / Contributor**: KaayZouee.

## Updates:
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
- Put all of its content to /etc/nixos
- Run this command:
`sudo nixos-rebuild switch --flake path:/etc/nixos#nixos`
