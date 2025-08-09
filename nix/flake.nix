{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations = {
      yuri = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit nixpkgs-unstable; };
        modules = [
          ./configuration.nix

          # 将 home-manager 配置为 nixos 的一个 module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";  # 冲突文件会被重命名为 filename.backup
            home-manager.extraSpecialArgs = { inherit nixpkgs-unstable; };
            home-manager.users.yuri = import ./home.nix;
          }
        ];
      };
    };
  };
}