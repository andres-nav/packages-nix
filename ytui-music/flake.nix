{
  description = "ytui music";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
    in {
      defaultPackage.${system} =
        with import nixpkgs { inherit system; };
        rustPlatform.buildRustPackage rec {
          pname = "ytui-music";
	  version = "2.0.0";

          src = fetchFromGitHub {
            owner = "sudipghimire533";
            repo = pname;
            rev = "v2.0.0-rc1";
	    sha256 = "sha256-f/23PVk4bpUCvcQ25iNI/UVXqiPBzPKWq6OohVF41p8=";
          };

          cargoSha256 = "sha256-DP9WxVGcdL8JhCxWvnojtCpKDk+mdlSdF6Q7piLVPaw=";

          nativeBuildInputs = [
            installShellFiles
            makeWrapper
            openssl
            openssl.dev
            pkg-config
          ];

          buildInputs = [ mpv sqlite youtube-dl ];

	  doCheck = false;

          PKG_CONFIG_PATH = "${openssl.dev}/lib/pkgconfig";
        };
    };
}
