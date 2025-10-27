{
  lib,
  fetchFromGitHub,
  rustPlatform,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "kanban";
  version = "0.1.10";

  src = fetchFromGitHub {
    owner = "fulsomenko";
    repo = "kanban";
    rev = "v${version}";
    hash = "sha256-m0j5ZaVyd2HKF29rM0mXGhanzgPnZGAGbiHUYIhHa90=";
  };

  cargoHash = "sha256-fWo80fQqKBMeaWQHeMeix5fVwWzhXCaHAPCU+sdGCRg=";

  meta = {
    description = "A terminal-based project management solution";
    longDescription = ''
      A terminal-based kanban/project management tool inspired by lazygit,
      built with Rust. Features include file persistence, keyboard-driven
      navigation, multi-select capabilities, and sprint management.
    '';
    homepage = "https://github.com/fulsomenko/kanban";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ fulsomenko ];
    mainProgram = "kanban";
    platforms = lib.platforms.all;
  };

  passthru.updateScript = nix-update-script { };
}
