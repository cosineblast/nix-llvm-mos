
{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation  rec {
    pname = "llvm-mos-sdk";
    version = "9.0.1";
    src = pkgs.fetchurl {
        url = "https://github.com/llvm-mos/llvm-mos-sdk/releases/latest/download/llvm-mos-linux.tar.xz";
        hash = "sha256-kcNlUtHBo6bRrFYuGdkJtlHCOzhbS+tcdL8RR9d1i28=";
    };



    installPhase = ''
        runHook preInstall
        mkdir -p $out
        cp -r ./bin ./lib ./share ./mos-platform $out
        runHook postInstall
    '';
}


