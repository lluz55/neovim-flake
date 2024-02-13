{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkOption;
  inherit (lib.types) types;
in {
  options.vim = {
    package = mkOption {
      type = types.package;
      default = pkgs.neovim-unwrapped;
      description = ''
        The neovim package to use. You will need to use an unwrapped package for this option to work as intended.
      '';
    };

    debugMode = {
      enable = mkEnableOption "debug mode";
      level = mkOption {
        type = types.int;
        default = 20;
        description = "Set the debug level";
      };

      logFile = mkOption {
        type = types.path;
        default = "/tmp/nvim.log";
        description = "Set the log file";
      };
    };

    spellChecking = {
      enable = mkEnableOption "neovim's built-in spellchecking";
      enableProgrammingWordList = mkEnableOption "vim-dirtytalk, a wordlist for programmers, that includes programming words";
      languages = mkOption {
        type = with types; listOf str;
        description = "The languages to be used for spellchecking";
        default = ["en"];
        example = ["en" "de"];
      };
    };

    leaderKey = mkOption {
      type = with types; nullOr str;
      default = null;
      description = "The leader key to be used internally";
    };

    colourTerm = mkOption {
      type = types.bool;
      default = true;
      description = "Set terminal up for 256 colours";
    };

    disableArrows = mkOption {
      type = types.bool;
      default = false;
      description = "Set to prevent arrow keys from moving cursor";
    };

    hideSearchHighlight = mkOption {
      type = types.bool;
      default = false;
      description = "Hide search highlight so it doesn't stay highlighted";
    };

    scrollOffset = mkOption {
      type = types.int;
      default = 8;
      description = "Start scrolling this number of lines from the top or bottom of the page.";
    };

    wordWrap = mkOption {
      type = types.bool;
      default = true;
      description = "Enable word wrapping.";
    };

    syntaxHighlighting = mkOption {
      type = types.bool;
      default = true;
      description = "Enable syntax highlighting";
    };

    mapLeaderSpace = mkOption {
      type = types.bool;
      default = true;
      description = "Map the space key to leader key";
    };

    useSystemClipboard = mkOption {
      type = types.bool;
      default = false;
      description = "Make use of the clipboard for default yank and paste operations. Don't use * and +";
    };

    mouseSupport = mkOption {
      type = with types; enum ["a" "n" "v" "i" "c"];
      default = "a";
      description = "Set modes for mouse support. a - all, n - normal, v - visual, i - insert, c - command";
    };

    lineNumberMode = mkOption {
      type = with types; enum ["relative" "number" "relNumber" "none"];
      default = "relNumber";
      description = "How line numbers are displayed. none, relative, number, relNumber";
    };

    preventJunkFiles = mkOption {
      type = types.bool;
      default = false;
      description = "Prevent swapfile, backupfile from being created";
    };

    tabWidth = mkOption {
      type = types.int;
      default = 4;
      description = "Set the width of tabs";
    };

    autoIndent = mkOption {
      type = types.bool;
      default = true;
      description = "Enable auto indent";
    };

    cmdHeight = mkOption {
      type = types.int;
      default = 1;
      description = "Height of the command pane";
    };

    updateTime = mkOption {
      type = types.int;
      default = 300;
      description = "The number of milliseconds till Cursor Hold event is fired";
    };

    showSignColumn = mkOption {
      type = types.bool;
      default = true;
      description = "Show the sign column";
    };

    bell = mkOption {
      type = types.enum ["none" "visual" "on"];
      default = "none";
      description = "Set how bells are handled. Options: on, visual or none";
    };

    mapTimeout = mkOption {
      type = types.int;
      default = 500;
      description = "Timeout in ms that neovim will wait for mapped action to complete";
    };

    splitBelow = mkOption {
      type = types.bool;
      default = true;
      description = "New splits will open below instead of on top";
    };

    splitRight = mkOption {
      type = types.bool;
      default = true;
      description = "New splits will open to the right";
    };
    enableEditorconfig = mkOption {
      type = types.bool;
      default = true;
      description = "Follow editorconfig rules in current directory";
    };

    cursorlineOpt = mkOption {
      type = types.enum ["line" "screenline" "number" "both"];
      default = "line";
      description = "Highlight the text line of the cursor with CursorLine hl-CursorLine";
    };

    enableLuaLoader = mkEnableOption "experimental Lua module loader to speed up the start up process";

    searchCase = mkOption {
      type = types.enum ["ignore" "smart" "sensitive"];
      default = "sensitive";
      description = "Set the case sensitivity of search";
    };
  };
}
