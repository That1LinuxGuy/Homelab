{ config, pkgs, ... }:

# Add searxng to laptops for AI use cases

{  
  # Enable searxng
  services.searx = {
    enable = true;
    package = pkgs.searxng; 
    redisCreateLocally = true; 
    settings = {
      server.bind_address = "127.0.0.1";
      server.port = 8888;
      server.secret_key = "@SEARXNG_SECRET@";

      search = {
        safe_search = 0;
        autocomplete = "duckduckgo";
        formats = [
          "html"
          "json"
        ];
      };

      engines = [
        { name = "qwant"; disabled = false; }
        { name = "mojeek"; disabled = false; }
        { name = "bing"; disabled = false; }
        { name = "google"; disabled = false; }
        { name = "duckduckgo"; disabled = false; }
      ];
    };
  };
}
