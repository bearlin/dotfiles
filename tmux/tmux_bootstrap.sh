#!/bin/sh

usage() {
  echo "Usage: " && \
  echo "$0 [remote.window.name] [remote.user.name] [remote.host.address]" 
}

byebye() {
  echo "ByeBye!"
  echo
  exit 0
}

if [ "$#" -lt 3 ]; then
  usage
  byebye "$@"
fi

# Creates a new tmux session, detaches it (so it doesn’t open in your current terminal) and names it hostlinst in this case.
# -d  The new session is attached to the current terminal unless -d is given
# -s  Specify the session name
tmux new-session -d -s hostlinst

# The following set of new-window commands create five new windows and executes the command at the end.
# -t hostlinst:1 tells tmux to "target" the session hostlinst and the window with the id of 1.
# -n 'Server1' 'ssh xx@x.x.x.x' portion tells tmux to name the window Server1 and execute the 'ssh xx@x.x.x.x' command in it.
tmux new-window -t hostlinst:1
tmux new-window -t hostlinst:2
tmux new-window -t hostlinst:3 -n "$1" "ssh $2@$3"

# Tells tmux that you want to active window 1 of session 'hostlinst' 
tmux select-window -t hostlinst:1

# Tells tmux you want to attach to session 'hostlinst' with 256 colors terminal 
# -2            Force tmux to assume the terminal supports 256 colours.
tmux -2 attach-session -t hostlinst

