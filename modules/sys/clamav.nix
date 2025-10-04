{ config, pkgs, ... }:

# imported into configuration.nix
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ clamav ];

  # Systemd service for updating virus definitions
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

  # Weekly scan job
  systemd.services.clamav-weekly-scan = {
    description = "Weekly ClamAV Full Scan";
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
}

