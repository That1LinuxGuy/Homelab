# NixOS machines

I manage 4 machines with a single NixOS flake.

Bulbasaur is the "primary":
- 40Gb RAM
- 4c|8t
- 1Tb SSD storage
- runs k3s-master module

Squirtle / Charmander are "secondary":
- 24Gb RAM / 12Gb RAM respectively
- 4c|4t / 4c|4t
- 256Gb SSD / 500Gb HHD 
- run k3s-server module

Pikachu is my dev laptop:
- 8Gb RAM
- 4c|8t
- 256Gb SSD
- run niri, cosmic, and unstable modules
