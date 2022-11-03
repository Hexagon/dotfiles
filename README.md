# hexagons dotfiles

### Getting started

1. Checkout this repo on a suitable location, then enter the new folder
2. Run `bootstrap.sh` to copy all relevant files in this repository to your home directory.
3. Log out and in again, IMPORTANT.

### Keeping in sync

After running bootstrap, the `dotfiles` command (`static/scripts/global/dotfiles`) will be globally available on your system, and is used like:

`dotfiles -d|--download` - sync from git repo to local

`dotfiles -u|--upload` - sync from local to git repo

`dotfiles -f|--full` - to do a two way sync

Sync is done using these rules 

*   Files in `static` is always copied from git repo to local on `--download`
*   Files in `synced` copies the latest version two-way when you `--upload` or `--download`
*   Files in `bootstrap` are copied to local if missing on `--download`, no further syncing is done

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
│   └── .testsynceddotfile
│
└── templates                   # Files that are only copied to ~ if they do not already exist
    ├── .extra                  
    ├── .gitconfig
    └── .path
```
