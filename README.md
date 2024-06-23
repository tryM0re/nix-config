# nix-config
Personal collection of nix configs (flake).
```shell
sudo nixos-rebuild switch --flake .#default
```
## sops keys must be located under the following path:
```shell
${config.home.homeDirectory}/.config/sops/age/keys.txt
```
