{
  inputs = {
    nixpkgs.url = github:nixos/nixpkgs;
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Ruby setup
        ruby = pkgs.ruby_3_2;
        rubyPackages = pkgs.rubyPackages_3_2;

        # Rust setup
        rust = pkgs.rustc;
      in {
        devShell = pkgs.mkShell {
          packages =
            # basic tools
            (with pkgs; [ ruby rust cargo gcc libiconv ])
            ++
            (with rubyPackages; [ rails ]);
          shellHook = ''
                    alias ll="ls -lasi"
                    '';
        };
      }
    );
}