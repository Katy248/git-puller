#!/bin/bash

# CONFIG_FILE=$HOME/.config/git-puller/rc
LIST_FILE=$HOME/.config/git-puller/dir.list

GREEN_COLOR=$(tput setaf 2)
NORMAL_TERM=$(tput sgr0)

LOG_INFO="INFO"

log()
{
    local message=$1
    local type=$2
    local timestamp

    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    echo -e "[${timestamp}] ${GREEN_COLOR}${type}:${NORMAL_TERM} ${message}"
}
stash()
{
    log "Stashing in '$(pwd)': \n $(git status --short --column=always)" $LOG_INFO
    git stash push .
}
pull()
{
    log "Fetching '$(git describe --all)'" $LOG_INFO
    git fetch
    git pull --rebase
}
push()
{
    log "Trying to push to '$(git remote show)'" $LOG_INFO
    git push
}
for directory in $(cat "$LIST_FILE" || grep -v "^#"); do
    expanded_path=$(eval echo "$directory")
    log "Working with '$expanded_path'" $LOG_INFO
    cd "$expanded_path" || break
    stash
    pull
    push
    log "Ended with '$expanded_path'" $LOG_INFO
done
