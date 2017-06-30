{ buildGoPackage, fetchFromGitHub, ... }:

buildGoPackage rec {
  name = "go-service-example";
  version = "0.0.1";
  goPackagePath = "github.com/bottleofoil/nixos-go-service-example";
  
  src = fetchFromGitHub {
    owner = "bottleofoil";
    repo = "nixos-go-service-example";
    rev = "14e3dee1f0adc1b98649a2f91e3c7243a72f4f57";
    sha256 = "082cfh162c2n9qz9bdq3kl1ba8y6q3sm2favj9i5aqrsark2iyas";
  };

  buildFlags = "";
}
