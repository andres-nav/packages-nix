{
  description = "OpenBUGS";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
    in {
      defaultPackage.${system} =
        with import nixpkgs { inherit system; };
        stdenv.mkDerivation rec {
          pname = "OpenBUGS";
	  version = "3.2.3";

	  src = fetchTarball {
            url = "https://www.mrc-bsu.cam.ac.uk/wp-content/uploads/2018/04/${pname}-${version}.tar.gz";
	    sha256 = "sha256:0sjsrhxf653zsd3x9ihgydd7rx6bllvvmppmcrmq5zfwdjkk49im";
	  };

          configurePhase = ''
	    ./configure 
	  '';

          buildPhase = ''
	    cd src
            make
	    cd ..
          '';

          installPhase = ''
            mkdir -p $out/bin 

	    cd src
            cp OpenBUGSCli $out/bin
	    cd ..

            cp -r lib $out
            cp -r doc $out
          '';

	  nativeBuildInputs = [ glibc_multi gcc_multi libgccjit ];

        };
    };
}
