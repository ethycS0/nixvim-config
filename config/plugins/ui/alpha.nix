{
  plugins.alpha =
    let
      nixFlake = [
        " ┓ ┏┓      ┳                          "
        " ┃┃┃┣┓┏┓╋  ┃  ┏┏┓┏┓┏┓┏┓╋  ┏┏┓┏┓┏┓╋┏┓  "
        " ┗┻┛┛┗┗┻┗  ┻  ┗┗┻┛┗┛┗┗┛┗  ┗┛ ┗ ┗┻┗┗ ╻ "
        " ┳   ┓                ┓           ┓   "
        " ┃  ┏┫┏┓  ┏┓┏┓╋  ┓┏┏┓┏┫┏┓┏┓┏╋┏┓┏┓┏┫   "
        " ┻  ┗┻┗┛  ┛┗┗┛┗  ┗┻┛┗┗┻┗ ┛ ┛┗┗┻┛┗┗┻   "
      ];
    in
    {
      enable = true;
      settings.layout = [
        {
          type = "padding";
          val = 4;
        }
        {
          opts = {
            hl = "AlphaHeader";
            position = "center";
          };
          type = "text";
          val = nixFlake;
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "GruvboxBlue";
            position = "center";
          };
          type = "text";
          val = "https://github.com/ethycS0";
        }
      ];
    };
}
