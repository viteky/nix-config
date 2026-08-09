{
  den.aspects.desktop = {
    homeManager = {
      programs.vesktop = {
        enable = true;
        settings = {
          appBadge = false;
          disableMinSize = true;
          splashTheming = true;
          checkUpdates = false;
          staticTitle = true;
          hardwareAcceleration = true;
        };
        vencord.settings = {
          disableMinSize = true;
          autoUpdate = false;
          autoUpdateNotification = false;
          notifyAboutUpdates = false;
          frameless = true;
          plugins = {
            ReadAllNotificationsButton.enabled = true;
            PictureInPicture.enabled = true;
            BetterNotesBox.enabled = true;
            OnePingPerDM.enabled = true;
            BiggerStreamPreview.enabled = true;
            Experiments.enabled = true;
            BetterFolders.enabled = true;
            BetterSettings.enabled = true;
            OpenInApp.enabled = true;
          };
        };
      };

      xdg.desktopEntries.vesktop = {
        name = "Discord";
        exec = "vesktop %U";
        icon = "discord";
        type = "Application";
      };
    };
  };
}
