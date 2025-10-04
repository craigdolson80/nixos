{ config, pkgs, lib, ... }:

{
  options = { }; # no special options exposed, just a drop-in

  config = {
    environment.systemPackages = with pkgs; [ clamav ];

    # daily updater
    systemd.services.freshclam = {
      description = "ClamAV virus database updater";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.clamav}/bin/freshclam --quiet";
      };
    };

    systemd.timers.freshclam = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
    };

    # weekly scan
    systemd.services.clamav-weekly-scan = {
      description = "Weekly ClamAV scan of /home";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''
          ${pkgs.clamav}/bin/clamscan -r -i /home \
            --log=/var/log/clamav/weekly-scan.log
        '';
      };
    };

    systemd.timers.clamav-weekly-scan = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "weekly";
        Persistent = true;
      };
    };
  };
}
