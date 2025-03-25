{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];
  colorschemes.gruvbox.enable = true;

  plugins = {
    lualine.enable = true;
  };

  plugins.lsp = {
    enable = true;
    servers = {
      lua-ls.enable = true;
    };
  };
}
