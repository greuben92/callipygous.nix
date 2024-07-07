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
  };
}
