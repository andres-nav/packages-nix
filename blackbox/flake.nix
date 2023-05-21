{
  description = "BlackBox Component Builder";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
    in {
      defaultPackage.${system} =
        with import nixpkgs { inherit system; };
        stdenv.mkDerivation rec {
          pname = "blackbox";
	  version = "2.0";

	  src = fetchurl {
            url = "https://blackbox.oberon.org/unstable/blackbox20/bbcb2-${version}~a1.build158_i386.deb";
	    sha256 = "sha256-kps3ECjeyWpZ9X8/eqevatEnJlYDt7blPNhsMcyMgFU=";
	  };

	  builder = ./builder.sh;

	  nativeBuildInputs = [ dpkg ];

        };
    };
}
