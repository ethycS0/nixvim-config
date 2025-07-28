{
  plugins = {
    project-nvim = {
      enable = true;
      enableTelescope = true;
      settings = {
        patterns = [
          ".clangd"
          ".git"
        ];
        # manual_mode = true;
      };
    };
  };
}
