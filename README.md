# rb-render

This project allows you to call Ruby's rendering code from Rust.

## Setup

Please use [`nix`](https://nixos.org/download.html) to get all the setup you need for this project.
Please [enable `flake` support in `nix`](https://nixos.wiki/wiki/Flakes). 
If the `~/.config/nix/` folder and/or the `~/.config/nix/nix.conf` file do not exist then just create them.

After that all you need to issue at the command line is:
```
nix develop
```

## Development

You can go ahead and run
```
cargo test
```
