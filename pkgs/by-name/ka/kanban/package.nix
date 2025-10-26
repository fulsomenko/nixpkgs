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
    hash = "sha256-112i54zhxq4rdvpgq760c1kkl1vk2vxmcfqdc0p3kwac14zl5dc3";
  };

  cargoHash = "sha256-1iyisbdimqv6wv1x1kfdwcvwjpaimiwqjqjbk959ibnfh6fq87qn";

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
