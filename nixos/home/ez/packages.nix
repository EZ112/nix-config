{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wlr-which-key # App launcher
    brave # Browser
    font-manager # Font
    libnotify # Notification
    pcmanfm # File manager
    claude-code # AI
    obsidian # Docs

    # Compiler
    gcc

    # Calendar
    gcalcli

    # Chat
    discord

    # Devtool
    bruno
    devtoolbox

    # PDF
    zathura

    # Game dev
    blender
    godot

    # Shell toolkit
    quickshell
    qt6.qtdeclarative
    qt6.qtmultimedia

    # Package manager
    luajitPackages.luarocks

    # LSP
    nixd
    jdt-language-server
    lombok
    lua-language-server
    vscode-langservers-extracted
    typescript-language-server
    tailwindcss-language-server
    emmet-ls
    basedpyright
    ruff
    rust-analyzer

    # Lint
    eslint_d

    # Formatter
    google-java-format
    prettierd
    stylua
    xmlformat
    nixfmt
    rustfmt
  ];
}
