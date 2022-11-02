# hexagons dotfiles

### Getting started

1. Checkout this repo on a suitable location, then enter the new folder
2. Run `bootstrap.sh` to copy all relevant files in this repository to your home directory.

### Keeping in sync

`dotfiles --download` to sync from git repo to local
`dotfiles --upload` to sync from local to git repo
`dotfiles --all` to do a two way sync

Files in `static` is always copied from git repo to local on `--download`
Files in `synced` copies the latest version two-way when you `--upload` or `--download`
Files in `bootstrap` are copied to local if missing on `--download`, no further syncing is done

### Repo structure

```
.
├── bootstrap.sh                # Bootstrapper script
├── README.md                   # This file
├── static                      # Folder containing files that is synced (overwritten) from repo -> ~
│   ├── .bash_aliases
│   ├── .bash_codespaces
│   ├── .bash_profile
│   ├── .bash_prompt
│   ├── .bashrc
│   ├── .exports
│   ├── scripts
│   │   ├── global
│   │   │   └── dotfiles        # The dotfiles command
│   │   ├── install_bun.sh
│   │   ├── install_deno.sh
│   │   └── motd.sh
│   └── .ssh
│       └── rc
├── synced                      # Files that are two way synced on --download or --upload
└── templates                   # Files that are only copied to ~ if they do not already exist
    ├── .extra                  
    ├── .gitconfig
    └── .path
```