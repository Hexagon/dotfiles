#!/usr/bin/env bash

echo -e "\n Globally available scripts:"
for file in ~/scripts/global/*; do
    FNAME=`basename "$file"`;
    SOURCE_FPATH="$DOTFILES_SOURCE_DIR/static/scripts/global/$FNAME";
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
        SOURCE_FPATH="$DOTFILES_SOURCE_DIR/static/scripts/$FNAME";
        if [[ -f $SOURCE_FPATH ]]; then
            echo -e "\t[synced] $FNAME";
        else
            echo -e "\t[local!] $FNAME";
        fi;
    fi;
    unset FNAME;
done;
unset file;