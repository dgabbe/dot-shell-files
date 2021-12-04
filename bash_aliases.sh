#!/usr/bin/env bash
#
# Written to be Bash 3.x compatible
#
# Mac OS X specific
#
mac_apps=("Aquamacs" "BBedit" "RStudio" "SourceTree")
for a in "${mac_apps[@]}"
do
  al=$(echo "$a" | tr [:upper:] [:lower:])
  [[ -e "/Applications/${a}.app" ]] && alias ${al}="open -a /Applications/${a}.app"
done
unset mac_apps
unset a
unset al

alias gimp="open -a /Applications/GIMP-2.10.app/Contents/MacOS/gimp" # for command line

#
# These should work with any *nix. Uncomment the ones you want.
# CentOS uses dircolors for colorizing ls output. Use
# --color=tty and $LS_OPTIONS.
#
# Add an "alert" alias for long running commands.  Usage: sleep 10; alert
#
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias chex='chmod -vv u+x '
alias chp='chmod -go:rwx'   # Set files access to only owner
alias dss='diff --side-by-side'
alias fgrepi='fgrep --color=auto -i'
alias grepi='grep --color=auto -i'

# ls aliases
#
# Decoder as some options are infrequently used
#  A: Don't list . and .. entries
#  a: Include directory entries whose names begin with a dot
#  C: Force multi-column output
#  d: Directories are listed as plain files (not searched recursively)
#  e: Print the Access Control List (ACL) associated with the file
#  F: Describe entry - /, *, @, =
#  G: Enable colorized output. Set CLICOLOR instead
#  h: use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte
#  l: Long format - one per line
#  O: File flags
#
alias l='ls -ACF'
alias lld='ls -AdFlh'        # treat directory as a file
alias la='ls -A'
alias lf='ls -delO@'      # list permissions, flags, acls, extended attributes
alias ll='ls -AeFhlO'
alias lx='xattr -l'     # List the extended file attributes

alias mkdirp='mkdir -m -go:rex' # The Apple way of keeping things private
alias rmquar='xattr -d com.apple.quarantine'  # Remove Apple's quarantine setting
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias tagbrew='tag --add brew-installed /Applications/'

#
# Ruby related
#
#alias path='ruby -e "puts ENV[\"PATH\"].gsub(/:/, \"\n\")"'
#alias pretty_json='ruby -r json -e '\''txt = File.read(ARGV[0]); h = JSON.parse(txt); puts JSON.pretty_generate(h)'\'''
#alias tabify='ruby -pe '\''gsub(/ +/, "\t")'\'''

