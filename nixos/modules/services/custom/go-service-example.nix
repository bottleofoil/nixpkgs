{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.go-service-example;

in {

  ###### interface

  options.services.go-service-example  = {
    enable = mkEnableOption "go-service-example";
    dataDirectory = mkOption {
      description = "Target directory to store sqlite database and files.";
      default = "/var/lib/go-service-example/db";
      type = types.str;
    };
    host = mkOption {
      description = "Host name with port number for the HTTP server to use.";
      default = "localhost:8080";
      type = types.str;
    };
  };

  ###### implementation

  config = mkIf cfg.enable {

    systemd.services.go-service-example = {
      description = "Go service example";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      script = ''
         ${pkgs.go-service-example}/bin/nixos-go-service-example2 -host ${cfg.host} -data-dir ${cfg.dataDirectory}
      '';
    };

  };
}

