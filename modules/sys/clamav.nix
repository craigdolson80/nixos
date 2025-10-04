{ config, pkgs, ... }:

# imported into configuration.nix
{
  services.clamav = {
    enable = true;           # installs base tools
    daemon.enable = true;    # runs clamd for faster scans
    updater.enable = true;   # runs freshclam automatically
  };

  # systemd timer for weekly scan
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
    description = "Weekly ClamAV Full Scan Timer";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";   # adjust to daily if you prefer
      Persistent = true;
    };
  };
}
