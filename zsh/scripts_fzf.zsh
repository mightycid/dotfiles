#!/usr/bin/env zsh

pw() {
    result=$(find $WORK_PROJECTS/* -type d -prune -exec basename {} ';' | sort | uniq | fzf | cut -f 2)
    [ -n "$result" ] && cd $WORK_PROJECTS/$result
}

pp() {
    result=$(find $PERSONAL_PROJECTS/* -type d -prune -exec basename {} ';' | sort | uniq | fzf | cut -f 2)
    [ -n "$result" ] && cd $PERSONAL_PROJECTS/$result
}
