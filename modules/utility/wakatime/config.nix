{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf nvim;

  cfg = config.vim.utility.vim-wakatime;
in {
  config = mkIf (cfg.enable) {
    vim.startPlugins = [
      pkgs.vimPlugins.vim-wakatime
    ];

    vim.configRC.vim-wakatime = nvim.dag.entryAnywhere ''
      ${
        if cfg.cli-package == null
        then ""
        else ''let g:wakatime_CLIPath = "${cfg.cli-package}"''
      }
    '';
  };
}
