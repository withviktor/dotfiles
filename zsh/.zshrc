export HOMEBREW_NO_ENV_HINTS=1

export LANG=en_US.UTF-8

export EDITOR=/opt/homebrew/bin/nvim

alias la=tree
alias cat=bat

alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --abbrev-commit"
alias ga="git add -p"
alias gr="git remote"
alias gre="git reset"

export XDG_CONFIG_HOME="/Users/ciernava/.config"

# Auto-start tmux if not already inside tmux and not in VSCode or other IDEs
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [ -z "$VSCODE_INJECTION" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
  # Check if any tmux sessions exist
  if tmux has-session 2>/dev/null; then
    # Attach to existing session
    exec tmux attach-session
  else
    # Create new session
    exec tmux new-session
  fi
fi
