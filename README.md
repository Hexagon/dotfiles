# hexagons dotfiles

Running `bootstrap.sh` will copy all relevant files in this repository to your home directory.

```
.
├── scripts             
│   ├── global                  # Scripts in this folder will is made globally available by .path
│   │   └── testcmd                # Example of global script   
│   │   └── ...                    # More global scripts?
|   |
│   ├── install_bun.sh          # Bun installer
│   ├── install_deno.sh         # Deno installer
│   └── ...                     # More scripts?
│
├── .bashrc                     # Sources .bash_profile on interactive shell
├── .bash_profile               # Includes .bash_*, .path, .exports
├── .bash_codespaces            # Stuff that only is relevant to codespaces
├── .bootstrap.sh               # Bootstrapper script
│
└── ...                         # More files that are hopefully self-explanatory
```