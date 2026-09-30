{
  description = "C/C++ Vulkan dev shell (LLVM/Clang + SDL3)";

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
          llvm = pkgs.llvmPackages_21;
        in
        {
          default = pkgs.mkShell.override { stdenv = llvm.stdenv; } {
            packages = [
              llvm.clang-tools
              llvm.lldb
              pkgs.cmake
              pkgs.ninja
              pkgs.gnumake
              pkgs.pkg-config
              pkgs.bear
              pkgs.neocmakelsp
              pkgs.gersemi
              pkgs.valgrind

              pkgs.vulkan-tools
              pkgs.vulkan-tools-lunarg
              pkgs.shaderc
              pkgs.glslang
              pkgs.spirv-tools
              pkgs.glsl_analyzer
              pkgs.renderdoc
            ];

            buildInputs = [
              pkgs.vulkan-headers
              pkgs.vulkan-loader
              pkgs.vulkan-memory-allocator
              pkgs.sdl3
            ];

            hardeningDisable = [ "fortify" ];
            CMAKE_EXPORT_COMPILE_COMMANDS = "ON";

            VK_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
            LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
              pkgs.vulkan-loader
              pkgs.sdl3
            ];
          };
        }
      );
    };
}
