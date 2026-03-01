{
  description = "MultiBUGS";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
    in {
      defaultPackage.${system} =
        with import nixpkgs { inherit system; };
        stdenv.mkDerivation rec {
          pname = "MultiBUGS";
	  version = "2.0";

	  src = fetchurl {
	    url = "https://github.com/MultiBUGS/MultiBUGS/releases/download/v2.0/multibugs_${version}-1.deb";
	    sha256 = "sha256-8WWmi4rnkGldit1PNhU9zkZSKKbOuhqS79P2RL5nZHA=";
	  };

	  builder = ./builder.sh;

	  nativeBuildInputs = [ dpkg ];

        };
    };
}
