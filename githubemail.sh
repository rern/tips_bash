#!/bin/bash

# usage: bash<( wget USER )

wget -qO - https://api.github.com/users/$1/events/public \
    | jq -r .[0].payload.commits[0].author.email
