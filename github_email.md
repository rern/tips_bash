```sh
user=USER
wget -qO - https://api.github.com/users/$user/events/public \
    | jq -r .[0].payload.commits[0].author.email
```
