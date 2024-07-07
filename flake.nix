{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  
  outputs = { nixpkgs, ... }: {
    nixosConfigurations = {
      callipygous = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    devShells =
      let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
      in {
        ${system}.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            lua-language-server
          ];
        };
      };
  };
}
