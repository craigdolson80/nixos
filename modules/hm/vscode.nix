{config, pkgs, ...}:

{
 #VSCODE
     programs.vscode.enable = true;
     programs.vscode.enableExtensionUpdateCheck = true;
     programs.vscode.enableUpdateCheck = true;
     programs.vscode.extensions = [
	pkgs.vscode-extensions.ms-python.python
        pkgs.vscode-extensions.jnoortheen.nix-ide
        pkgs.vscode-extensions.dracula-theme.theme-dracula
        pkgs.vscode-extensions.catppuccin.catppuccin-vsc
        pkgs.vscode-extensions.catppuccin.catppuccin-vsc-icons
         ];
     programs.vscode.userSettings = {
        "editor.fontFamily" = "'Droid Sans Mono', 'monospace', monospace, 'FontAwesome'";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "security.workspace.trust.untrustedFiles" = "open";
        "workbench.startupEditor" = "none";
        "git.openRepositoryInParentFolders" = "always";
          };
}
