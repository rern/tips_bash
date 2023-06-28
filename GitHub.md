### GitHub
- Get email: `wget -qO - https://api.github.com/users/USER/events/public | jq -r .[0].payload.commits[0].author.email`
- Get latest release: `curl -L https://api.github.com/repos/USER/REPO/releases/latest`
