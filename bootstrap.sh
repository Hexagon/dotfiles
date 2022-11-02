#!/usr/bin/bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$CURRENT_DIR";

function doIt() {
	# Copy files
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;

	# Store dotfiles source directory in ~/.dotfiles_dir
	echo -e "export DOTFILES_SOURCE_DIR='$CURRENT_DIR'\n" > ~/.dotfiles_dir;

	# Source dotfiles instantly
	source ~/.bash_profile;

	echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "\n Dotfiles sucessfully installed/updated"
	echo -e "\n Use .path or .extra for local customizations"
	echo -e "\n Globally available scripts:"
	for file in ~/scripts/global/*; do
		FNAME=`basename "$file"`;
		SOURCE_FPATH="$DOTFILES_SOURCE_DIR/scripts/global/$FNAME";
		if [[ -f $SOURCE_FPATH ]]; then
			echo -e "\t[synced] $FNAME";
		else
			echo -e "\t[local!] $FNAME";
		fi;
		unset FNAME;
	done;
	unset file;
	echo -e "\n Scripts available in ~/scripts:"
	for file in ~/scripts/*; do
		FNAME=`basename "$file"`;
		if [[ -f $file ]]; then
			SOURCE_FPATH="$DOTFILES_SOURCE_DIR/scripts/$FNAME";
			if [[ -f $SOURCE_FPATH ]]; then
				echo -e "\t[synced] $FNAME";
			else
				echo -e "\t[local!] $FNAME";
			fi;
		fi;
		unset FNAME;
	done;
	unset file;
	echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
}

if [[ -v CODESPACES ]]; then
    echo "\nCodespaces detected, auto installing Deno and Bun\n"

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
