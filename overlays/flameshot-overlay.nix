self: super: {
  flameshot = super.flameshot.overrideAttrs (oldAttrs: rec {
    buildInputs = (oldAttrs.buildInputs or []) ++ [ pkgs.wayland pkgs.grim ]; # Ensure Wayland and grim are available
    cmakeFlags = (oldAttrs.cmakeFlags or []) ++ [ "-DUSE_WAYLAND_GRIM=ON" ];  # Enable the flag
  });
}
