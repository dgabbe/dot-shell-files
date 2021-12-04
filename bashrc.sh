#!/usr/bin/env bash
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# Added support shellcheck - https://www.shellcheck.net/
#
# The bash coding style is inconsistent because code snippets from various
# versions of bash and authors are pulled together to create this file.
#

#
# The test for an interactive shell is frequently:
#   [[ -z "$PS1" ]] && return
#
# However, an environment variable may be set by anyone.
# Some marvelous code in RedHat and CentOS /etc/bashrc demonstrates this.
# See this 1999 bug https://bugzilla.redhat.com/show_bug.cgi?id=678
#
# If not running interactively, don't do anything
#
[[ $- != *i* ]] && return

#
# set PATH so it includes user's private bin if it exists
#
[[ -d "${HOME}/bin" ]] && export PATH="${HOME}/bin:${PATH}"

#
# Set CDPATH & machine specific environment variables and aliases if present.
# Somewhere between bash 4 -> 5 and MacOS 10.11 -> 10.13 the value of $HOSTNAME
# changed. Switched to hostname command for better reliability.
#
my_profile=${HOME}/.$(hostname -s)_${USER}_profile
[[ -e "${my_profile}" ]] && source "${my_profile}"
unset my_profile

#
# Set options using set or shopt or export. Listed alphabetically.
#

shopt -s cdspell
shopt -s checkwinsize # Update LINES and COLUMNS after each command

[[ "${BASH_VERSINFO}" = "5" ]] && shopt -s dirspell

set -o emacs
shopt -s histappend # Append to the history file, don't overwrite it
export HISTCONTROL='ignoredups:ignorespace' # don't put duplicate lines in the history.
export HISTFILESIZE=2000
shopt -s histreedit # If you bork a ! in bash, this lets you edit the line.
export HISTSIZE=1000
shopt -s histverify # Don't execute recalled command immediately
export HOMEBREW_NO_ANALYTICS=1 # opt out Homebrew analytics

#
# Required to make MacTex compatible w/older versions of Ruby.
# Deprecated in newer versions of Ruby and no longer a problem.
#
export LANGUAGE='en_US:en'
export LC_MESSAGES='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_COLLATE='en_US.UTF-8'

export LSCOLORS='Exfxcxdxbxegedabagacad'

shopt -s nocaseglob # Case-insensitive wildcard matching.
export PYTHONDONTWRITEBYTECODE=1 # No .pyc files

## !! There is bash_completion 2 for bash 4+ which should be added here ##
## Also look at Ned's https://github.com/nedbat/dot/blob/master/.bashrc, line 252
## if [[ $BASH_VERSINFO -ge 4 ]]; then ##
# bash-completion bug - https://github.com/scop/bash-completion/issues/44
if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
  set +o nounset
  source $(brew --prefix)/etc/bash_completion
else
  set -o nounset
fi

#
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
# shellcheck source=~/.bash_aliases
[[ -f ${HOME}/.bash_aliases ]] && source ${HOME}/.bash_aliases

_gcb=$(brew --prefix git)/etc/bash_completion.d/git-completion.bash
[[ -f ${_gcb} ]] && source ${_gcb}
unset _gcb

#
# Set prompt, window title, git status
#
[[ -f ${HOME}/.set-ps1 ]] && source ${HOME}/.set-ps1

#
# Add pip3 command completion if pip3 installed
#
[[ -n $(which pip3) ]] && eval "$(pip3 completion --bash)"


#
# load rvm
#
# if [[ -s "${HOME}/.rvm/scripts/rvm" ]]; then
#   PATH=${PATH}:${HOME}/.rvm/bin # Add RVM to PATH for scripting
#   source "${HOME}/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#   # load git prompt
#   if [[ $- == *i* ]]
#   then
#     . ${HOME}/.rvm/contrib/ps1_functions
#     ps1_set --prompt \$
#   fi
# fi

#
# Stuff from Bosco's file, but not supported on OS X
# make less more friendly for non-text input files, see lesspipe(1)
#
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"
