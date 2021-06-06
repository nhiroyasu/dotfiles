
# configure alias
## git
alias gs='git status -s'
alias gaa 'git add'
alias gp 'git push origin HEAD'
alias gck='git checkout'
alias gck-b='git checkout -b'
alias gcm-m='git commit -m'

## docker
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dcur='docker ps -f status=running -l -q'
alias dexec='docker exec -it $(dur)'
alias dimgs='docker images'
alias drun='docker run -rm -it'
alias dstop='docker stop $(dcur)'
