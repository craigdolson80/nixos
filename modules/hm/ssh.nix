{
  #SSH
#  programs.ssh = {
#   enable = true;
#   forwardAgent = true;
#   hashKnownHosts = true;
#   };

programs.ssh = {
  enable = true;

  # stop relying on default values
  enableDefaultConfig = false;

  # define defaults for all hosts
  matchBlocks."*" = {
    hashKnownHosts = true;
    forwardAgent = true;
  };

  # example: custom settings for github.com
  matchBlocks."github.com" = {
    user = "git";
    identityFile = "~/.ssh/id_ed25519";
  };
};


}
