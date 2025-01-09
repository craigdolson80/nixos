self: super: {
  flameshot = super.flameshot.overrideAttrs (oldAttrs: rec {
  cmakeFlags = (oldAttrs.cmakeFlags or []) ++ [ "-DUSE_WAYLAND_GRIM=ON" ];  # Enable the flag
  });
}
