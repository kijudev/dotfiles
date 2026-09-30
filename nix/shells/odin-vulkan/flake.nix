{
  description = "Odin Vulkan dev shell (SDL3)";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems =
        f: nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ] (s: f nixpkgs.legacyPackages.${s});
    in
    {
      devShells = forAllSystems (
        pkgs:
        let
          libs = [
            pkgs.vulkan-loader
            pkgs.sdl3
          ];
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.odin
              pkgs.ols
              pkgs.lldb

              pkgs.vulkan-tools
              pkgs.vulkan-tools-lunarg
              pkgs.shaderc
              pkgs.spirv-tools
              pkgs.glsl_analyzer
              pkgs.renderdoc
            ];

            LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;
            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;
            VK_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
          };
        }
      );
    };
}
