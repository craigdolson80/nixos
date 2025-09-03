{
  #SSH
  programs.ssh = {
   enable = true;
   matchBlocks.forwardAgent = true;
   matchBlocks.hashKnownHosts = true;
   };

}
