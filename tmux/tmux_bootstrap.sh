#!/bin/sh

# Creates a new tmux session, detaches it (so it doesn’t open in your current terminal) and names it hostlinst in this case.
# -d  The new session is attached to the current terminal unless -d is given
# -s  Specify the session name
tmux new-session -d -s hostlinst

# The following set of new-window commands create five new windows and executes the command at the end.
# -t hostlinst:1 tells tmux to "target" the session hostlinst and the window with the id of 1.
# -n 'Server1' 'ssh xx@x.x.x.x' portion tells tmux to name the window Server1 and execute the 'ssh xx@x.x.x.x' command in it.
tmux new-window -t hostlinst:1 -n 'Local1'
tmux new-window -t hostlinst:2 -n 'Local2'
tmux new-window -t hostlinst:3 -n 'Server1' 'ssh linst@127.0.0.1'

# Tells tmux that you want to active window 1 of session 'hostlinst' 
tmux select-window -t hostlinst:1

# Tells tmux you want to attach to session 'hostlinst' with 256 colors terminal 
# -2            Force tmux to assume the terminal supports 256 colours.
tmux -2 attach-session -t hostlinst

