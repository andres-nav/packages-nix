{
  description = "JFLAP";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
    in {
      defaultPackage.${system} =
        with import nixpkgs { inherit system; };
        stdenv.mkDerivation rec {
          pname = "JFLAP";
	  version = "7.1";

	  src = ./.;

          configurePhase = ''
	  '';

          buildPhase = ''
          '';

          installPhase = ''
	    export file="$out/bin/${pname}"
	    mkdir -p $out/bin
	    cp ./${pname}${version}.jar $file
	    chmod +x $file
          ''; # this can be better improved by adding java to be installed and creating a custom script

        };
    };
}
