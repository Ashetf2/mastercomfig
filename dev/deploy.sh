#!/bin/bash
# Run script within the directory
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "${BINDIR}" || exit 2

. ./mastercomfig-vars || echo "Using system environment for mastercomfig vars."

# Get old release version
old_release=$(gh release view --json tagName -q .tagName)

# Create release
gh release create $1 -t $1 -n "**Highlights:** $2\n\n[**Support me:**](https://docs.mastercomfig.com/page/support_me/) Learn how you can support more updates to mastercomfig!\n\n[**How to install:**](https://docs.mastercomfig.com/page/setup/install/) Instructions on setting up mastercomfig initially and get it working with your custom files.\n\n[**How to update:**](https://docs.mastercomfig.com/page/next_steps/update/) Instructions on updating mastercomfig after you've already installed it.\n\n---\n\n---\n\n[View the code changes](https://github.com/mastercomfig/mastercomfig/compare/${old_release}...$1)"

# Upload files
. ./common.sh

uploadAssets

printf "\n"
