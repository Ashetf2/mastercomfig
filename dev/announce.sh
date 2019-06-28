#!/bin/bash
# Run script within the directory
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "$BINDIR"

source mastercomfig-vars

# Announce on Discord #releases

curl -X POST -H 'Content-type: application/json' \
 --data "{\"content\":\"@everyone **[$1](https://mastercomfig.com/download)** released with $2.\"}" \
 $DISCORD_WEBHOOK

# TODO: Announce on teamfortress.tv and Steam Group

post_body="[url=https://mastercomfig.com/download]$1[/url] released with $2."

printf "\n"

echo "BBCode announcement for tf.tv and Steam Group:"
echo $post_body

printf "\n"
