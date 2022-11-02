#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bashrc;
}

if [[ -v CODESPACES ]]; then
    echo "Codespaces detected, auto installing Deno and Bun"
    ./scripts/install_bun.sh
    ./scripts/install_deno.sh
    doIt;
else
    if [ "$1" == "--force" -o "$1" == "-f" ]; then
    	doIt;
    else
    	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    	echo "";
    	if [[ $REPLY =~ ^[Yy]$ ]]; then
    		doIt;
    	fi;
    fi;
fi;

unset doSync;
