
{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation  rec {
    pname = "llvm-mos-sdk";
    version = "9.0.1";
    src = pkgs.fetchurl {
        url = "https://github.com/llvm-mos/llvm-mos-sdk/releases/download/v20.2.0/llvm-mos-linux.tar.xz";
        hash = "sha256-sObbnNChtVeQ2xE9HFaL/+DWL+TwD3CxoZ4Wsy/G3Pc=";
    };

    installPhase = ''
        runHook preInstall
        mkdir -p $out
        cp -r ./bin ./lib ./share ./mos-platform $out
        runHook postInstall
    '';
}


