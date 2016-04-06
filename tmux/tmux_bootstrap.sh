#!/bin/sh

usage() {
  echo "Usage: " && \
  echo "$0 [remote.window.name] [remote.user.name] [remote.host.address] [tmux.session.name]" 
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

SESSIONNAME="tmux-session-01"
if [ "" != $4 ]; then
  SESSIONNAME=$4
fi
echo "SESSIONNAME=$SESSIONNAME"

# Creates a new tmux session, detaches it (so it doesn’t open in your current terminal) and names it $SESSIONNAME in this case.
# -d  The new session is attached to the current terminal unless -d is given
# -s  Specify the session name
tmux new-session -d -s $SESSIONNAME

# The following set of new-window commands create five new windows and executes the command at the end.
# -t $SESSIONNAME:1 tells tmux to "target" the session $SESSIONNAME and the window with the id of 1.
# -n 'Server1' 'ssh xx@x.x.x.x' portion tells tmux to name the window Server1 and execute the 'ssh xx@x.x.x.x' command in it.
tmux new-window -t $SESSIONNAME:1
tmux new-window -t $SESSIONNAME:2
tmux new-window -t $SESSIONNAME:3 -n "$1" "ssh $2@$3"

# Tells tmux that you want to active window 1 of session '$SESSIONNAME' 
tmux select-window -t $SESSIONNAME:1

# Tells tmux you want to attach to session '$SESSIONNAME' with 256 colors terminal 
# -2            Force tmux to assume the terminal supports 256 colours.
tmux -2 attach-session -t $SESSIONNAME

