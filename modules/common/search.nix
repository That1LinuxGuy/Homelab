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
        { name = "duckduckgo"; disabled = true; }
        { name = "mojeek"; disabled = true; }
        { name = "startpage"; disabled = true; }
        { name = "qwant"; disabled = true; }
        { name = "mwmbl"; disabled = true; }
        { name = "ddg definitions"; disabled = true; }
        
        # Enabled
        { 
          name = "brave"; 
          engine = "braveapi";
          api_key = "@BRAVE_API_KEY@";
          disabled = false; 
          weight = 2.0;
        }
        {
          name = "github";
          engine = "github";
          api_key = "@GITHUB_TOKEN@";
          disabled = false;
          weight = 1.0;
        }
        {
          name = "google"; 
          disabled = false; 
          use_mobile_ui = true;
          weight = 3.0;
        }
        { name = "bing"; disabled = false; }
        { name = "wikidata"; disabled = false; weight = 0.5; }
        { name = "wikibooks"; disabled = false; weight = 0.5; }
        { name = "wikiversity"; disabled = false; weight = 0.5; }
        { name = "wikivoyage"; disabled = false; weight = 0.5; }
      ];
    };
  };
}
