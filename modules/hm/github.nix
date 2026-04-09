{
#GITHUB
  programs.git = {
    enable = true;
    settings.user.email = "craigdolson@gmail.com";
    settings.user.name = "Craig Olson";
    difftastic.options.background = "dark";
    difftastic.options.color = "always";
    difftastic.options.display = "inline";
	};
  programs.difftastic.git.enable = true;
}

