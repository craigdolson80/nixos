{
  # GITHUB
  programs.git = {
    enable = true;
    settings.user.email = "craigdolson@gmail.com";
    settings.user.name = "Craig Olson";
  };

  programs.difftastic = {
    enable = true;
    git.enable = true;

    options = {
      background = "dark";
      color = "always";
      display = "inline";
    };
  };
}