{ config, pkgs, ... }:

# Add searxng to laptops for AI use cases

{  
  # Enable searxng
  services.searx = {
    enable = true;
    package = pkgs.searxng; 
    environmentFile = "/etc/searxng/searxng.env";
    redisCreateLocally = true; 
    settings = {
      server.bind_address = "127.0.0.1";
      server.port = 8888;

      search = {
        safe_search = 0;
        autocomplete = "duckduckgo";
        formats = [
          "html"
          "json"
        ];
      };

      outgoing = {
        request_timeout = 5.0;
        max_request_timeout = 10.0;
        enable_http2 = true;
      };

      engines = [
        # Disabled
        { name = "brave"; disabled = true; }
        { name = "qwant"; disabled = true; }
        { name = "mojeek"; disabled = true; }
        
        # Enabled
        { name = "mwmbl"; disabled = false; }
        { name = "bing"; disabled = false; }
        { name = "google"; disabled = false; }
        { name = "duckduckgo"; disabled = false; use_mobile_ui = true; }
      ];
    };
  };
}
