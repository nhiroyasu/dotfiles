# configure alias
## git
alias gs='git status -s'
alias ga='git add'
alias gp='git push origin HEAD'
alias gck='git checkout'
alias gckb='git checkout -b'
alias gcmm='git commit -m'
alias gf='git fetch origin'
alias gm='git merge'

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
