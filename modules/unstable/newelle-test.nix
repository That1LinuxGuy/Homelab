# newelle-test.nix
{ pkgs ? import <nixpkgs> {} }:

let
  # Define the model2vec package inline
  model2vec = pkgs.python3.pkgs.buildPythonPackage rec {
    pname = "model2vec";
    version = "0.1.2";
    format = "pyproject";
    src = pkgs.fetchPypi {
      inherit pname version;
      hash = "sha256-To6BpaXrsjE2ZGRfWtVkXpDglCrFxVyTcRxXFrY0McI="; 
    };
    nativeBuildInputs = [ pkgs.python3.pkgs.setuptools-scm ];
    propagatedBuildInputs = with pkgs.python3.pkgs; [ numpy tqdm huggingface-hub tokenizers ];
  };

  # Apply the overrides to Newelle
  patchedNewelle = pkgs.newelle.overrideAttrs (oldAttrs: {
    # 1. Fix TLS support by adding glib-networking and the wrapping hook
    nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ pkgs.wrapGAppsHook4 ];
    buildInputs = (oldAttrs.buildInputs or []) ++ [ pkgs.glib-networking ];

    # 2. Add the missing Python modules into its runtime environment
    propagatedBuildInputs = (oldAttrs.propagatedBuildInputs or []) ++ [
      pkgs.python3.pkgs.cssselect
      model2vec
    ];
  });
in
# Return a development shell containing our patched package
pkgs.mkShell {
  name = "newelle-test-env";
  buildInputs = [ patchedNewelle ];

  shellHook = ''
    echo "========================================================"
    echo " Entering Newelle Test Environment"
    echo " Run 'newelle' to start the application and watch logs."
    echo "========================================================"
  '';
}
