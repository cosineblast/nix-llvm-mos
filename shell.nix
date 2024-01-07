
{ pkgs ? import <nixpkgs> {} } :

pkgs.mkShell {
    nativeBuildInputs = [ (pkgs.callPackage ./default.nix { inherit pkgs; }) ];
}

