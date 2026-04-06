{ config, pkgs, ... }:

{
  systemd.user.services.gcal-notifier = {
    Unit = {
      Description = "Google Calendar Dunst Notifier";
      After = [ "network-online.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = pkgs.writeScript "gcal-notify-script" ''
        #!${pkgs.bash}/bin/bash
        ${pkgs.libcanberra-gtk3}/bin/canberra-gtk-play -f ${../../sfx/notification.oga};
        ${pkgs.gcalcli}/bin/gcalcli remind 15 '${pkgs.dunst}/bin/dunstify -a "Google Calendar" -h string:x-dunst-stack-tag:calendar_alert "Upcoming Event" "%s"'
      '';
    };
  };

  systemd.user.timers.gcal-notifier = {
    Unit = {
      Description = "Run gcal-notifier every 5 minutes";
    };
    Timer = {
      OnBootSec = "2m";
      OnUnitActiveSec = "5m";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
