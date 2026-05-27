#!/usr/bin/bash
# Notify if ~/dotfiles has uncommitted changes (tracked or untracked).
# Invoked by the dotfiles-nudge.timer systemd user unit.

REPO="$HOME/dotfiles"

cd "$REPO" || exit 0

# --porcelain prints one line per changed/untracked file; empty = clean.
status="$(git status --porcelain)"
[ -z "$status" ] && exit 0

count=$(printf '%s\n' "$status" | wc -l)
notify-send -a dotfiles -u normal \
    "dotfiles: $count uncommitted change(s)" \
    "Run: cd ~/dotfiles && git status"
