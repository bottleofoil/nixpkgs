{ buildGoPackage, fetchFromGitHub, ... }:

buildGoPackage rec {
  name = "go-service-example";
  version = "0.0.1";
  goPackagePath = "github.com/bottleofoil/nixos-go-service-example2";
  
  src = fetchFromGitHub {
    owner = "bottleofoil";
    repo = "nixos-go-service-example2";
    rev = "3089414c757b42e2ff323949e1cb0338ff4977ed";
    sha256 = "0sv3q5ylvsz63z5pxz8fjdayrax7kmj6zrhxjf3g6mpxcpyzslsm";
  };

  buildFlags = "";
}
