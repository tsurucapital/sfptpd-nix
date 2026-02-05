{
  description = "sfptpd";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    sfptpd_src = {
      url = "github:Xilinx-CNS/sfptpd/v3.8.1.1004";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, flake-compat, sfptpd_src }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ ]; };
        sfptpd = pkgs.callPackage ./sfptpd.nix { src = sfptpd_src; };
      in
      {
        legacyPackages = pkgs;
        packages = flake-utils.lib.flattenTree {
          inherit sfptpd;
        };
      }
    );
}

