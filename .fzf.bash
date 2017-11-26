# Setup fzf
# ---------
if [[ ! "$PATH" == */home/eric/.fzf/bin* ]]; then
  export PATH="$PATH:/home/eric/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/eric/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/eric/.fzf/shell/key-bindings.bash"

