#!/usr/bin/env zsh

pw() {
    result=$(find $WORKSPACE/work/* -type d -prune -exec basename {} ';' | sort | uniq | fzf | cut -f 2)
    [ -n "$result" ] && cd $WORKSPACE/work/$result
}

pp() {
    result=$(find $WORKSPACE/personal/* -type d -prune -exec basename {} ';' | sort | uniq | fzf | cut -f 2)
    [ -n "$result" ] && cd $WORKSPACE/personal/$result
}
