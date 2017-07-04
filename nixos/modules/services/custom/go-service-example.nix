{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.go-service-example;

in {

  ###### interface

  options.services.go-service-example  = {
    enable = mkOption {
      description = "Whether to enable example service.";
      default = false;
      type = types.bool;
    };
    dataDirectory = mkOption {
      description = "directory to store sqlite and files";
      default = "/var/lib/go-service-example/db";
      type = types.string;
    };
    host = mkOption {
      description = "host name with port to use for binding";
      default = "localhost:8080";
      type = types.string;
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
      };
        '';
    };

    environment.systemPackages = [ pkgs.go-service-example ];

  };
}

