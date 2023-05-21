{
  description = "different shells";

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
    in {
      "ds" = 
        with import nixpkgs { inherit system; };
        mkShell {
          buildInputs = [ 
            python311
            python311Packages.matplotlib
            python311Packages.numpy
            python311Packages.pandas
            python311Packages.scipy
          ];

          shellHook = ''
            echo Data Science with python
            
          '';
        };

      "r" = 
        with import nixpkgs { inherit system; };
        mkShell {
          buildInputs = [ 
            R
            rPackages.ggplot2
	    rstudio
          ];

          shellHook = ''
            echo R with Rstudio
            
          '';
        };

      "c" = 
        with import nixpkgs { inherit system; };
        mkShell {
          buildInputs = [ 
            gcc_multi
            gnumake
	    gdb
	    valgrind
          ];

          shellHook = ''
            echo C C++ development
            
          '';
        };

      "web" = 
        with import nixpkgs { inherit system; };
        mkShell {
          buildInputs = [ 
            python311
            python311Packages.django
            python311Packages.flask
          ];

          shellHook = ''
            echo Django and Flask
            
          '';
        };
    };
}
