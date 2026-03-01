{
  description = "A package for pgquarrel";

  outputs = { self, nixpkgs, flake-utils }:
    let
      system = "x86_64-linux";
    in {
      defaultPackage.${system} =
        with import nixpkgs { inherit system; };
        stdenv.mkDerivation rec {
          pname = "pgquarrel";
          version = "0.7.0";
        
          src = fetchFromGitHub {
            owner = "eulerto";
            repo = "pgquarrel";
            rev = "pgquarrel_0_7_0";
            sha256 = "sha256-v3JDPA0y1/QYIbCJYpxapO8QuIqKoL6uzlepbWgiPNs=";
          };
        
          buildInputs = [ cmake postgresql ];
        
          patchPhase = ''
            sed -i '/set(PostgreSQL_LIBRARY_DIRS "''${pgpath}")/a set(pgpath "${postgresql}/lib")' CMakeLists.txt
          '';
        };
    };
}
