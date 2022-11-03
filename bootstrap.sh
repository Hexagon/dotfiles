#!/usr/bin/env bash

# Store the directory of this script in CURRENT_DIR
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

# Set content of ~/.dotfiles_dir to CURRENT_DIR
echo -e "export DOTFILES_SOURCE_DIR='$CURRENT_DIR'\n" > ~/.dotfiles_dir;
export DOTFILES_SOURCE_DIR="$CURRENT_DIR"

# Instantly set DOTFILES_SOURCE_DIR by sourcing ~/.dotfiles_dir
source ~/.dotfiles_dir;

# Check that everything went well
if ! [ "$CURRENT_DIR" = "$DOTFILES_SOURCE_DIR" ]; then
	echo -e "Failed to export DOTFILES_SOURCE_DIR, exiting."
	exit
fi;

# Enter .dotfiles_dir
cd "$DOTFILES_SOURCE_DIR"

# Force install dotfiles script
mkdir -p ~/scripts/global/
yes | cp ./static/scripts/global/dotfiles ~/scripts/global/

if [ "$1" == "--force" -o "$1" == "-f" ]; then

	# Ok, carry on
	echo "Forced bootstrap initated"

elif [[ -v CODESPACES ]]; then

	# Ok, carry on
	echo "Codespaces automated bootstrap initiated"

else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then

		# Ok, carry on
		echo "Ok, overwriting files ..."

	else

		exit;

	fi;
fi;

# Download dotfiles
~/scripts/global/dotfiles download

# Run codespaces specific actions
if [[ -v CODESPACES ]]; then
    echo -e "\nCodespaces detected, auto installing Deno and Bun\n"
    
	# Install deno/bun
	~/scripts/install_bun.sh
    ~/scripts/install_deno.sh
fi;

# Source dotfiles instantly
source ~/.bash_profile

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\n Dotfiles sucessfully installed/updated"
echo -e "\n Use .path or .extra for local customizations"

# Print motd
source ~/scripts/motd.sh

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

echo -e "IMPORTANT: Before doing anything else, either log in/out\n           or run 'source ~/.bash_profile' or 'source ~/.zshrc' manually\n"