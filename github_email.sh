#!/bin/bash

# usage: bash <( wget https://github.com/rern/tips_bash/raw/main/githubemail.sh -qO - ) USER

wget -qO - https://api.github.com/users/$1/events/public \
    | jq -r .[0].payload.commits[0].author.email
