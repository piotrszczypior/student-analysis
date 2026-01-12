{
  description = "Flake for Tex Project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          python312
          texlive.combined.scheme-full

          (pkgs.python312.withPackages (ps: with ps; [
            pygments
          ]))
        ];
      };
    };
}
