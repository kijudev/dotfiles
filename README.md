# My NixOS Config

If you value your sanity do not look at this abomination :)

## Structure
```
.
├── README.md
└── nix/
    ├── configuration.nix
    ├── flake.nix
    ├── flake.lock
    ├── hardware-configuration.nix
    ├── home.nix
    ├── stylix.nix
    └── modules/
        ├── home/
        │   ├── desktop.nix
        │   ├── editors.nix
        │   ├── git.nix
        │   ├── packages.nix
        │   ├── shell.nix
        │   └── terminal.nix
        └── nixos/
            ├── audio.nix
            ├── boot.nix
            ├── desktop.nix
            ├── hardware.nix
            ├── locale.nix
            ├── networking.nix
            ├── programs.nix
            ├── users.nix
            └── virtualisation.nix
```
