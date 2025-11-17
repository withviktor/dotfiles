# Nushell Config File

# Load starship prompt
use ~/.cache/starship/init.nu

# Aliases
alias la = tree
alias cat = bat
alias cl = clear

# Git aliases
alias gc = git commit -m
alias gca = git commit -a -m
alias gp = git push origin HEAD
alias gpu = git pull origin
alias gst = git status
alias glog = git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit
alias gdiff = git diff
alias gco = git checkout
alias gb = git branch
alias gba = git branch -a
alias gadd = git add
alias ga = git add -p
alias gcoall = git checkout -- .
alias gr = git remote
alias gre = git reset

# Docker aliases
alias dco = docker compose
alias dps = docker ps
alias dpa = docker ps -a
alias dl = docker ps -l -q
alias dx = docker exec -it

# Custom functions
def cx [path: string] {
    cd $path
    ls
}

def fcd [] {
    let dir = (fd --type d --hidden --follow | fzf)
    if $dir != "" {
        cd $dir
        ls
    }
}

def fv [] {
    let file = (fd --type f --hidden --follow | fzf)
    if $file != "" {
        nvim $file
    }
}

# Config
$env.config.keybindings = [
  {
    name: completion_menu
    modifier: none
    keycode: tab
    mode: [emacs vi_normal vi_insert]
    event: {
      until: [
        {
          send: menu
          name: completion_menu
        }
      ]
    }
  }
]
$env.config.show_banner = false 
$env.config.edit_mode = "vi" 

source ~/.config/nushell/themes/catppuccin-mocha.nu
use ~/.config/nushell/themes/catppuccin-mocha.nu 
$env.config.color_config = (catppuccin-mocha)

source ~/.config/nushell/env.nu
use ~/.cache/starship/init.nu

# Auto-start tmux
if (which tmux | is-not-empty) and ($env.TMUX? | is-empty) {
    tmux attach -t default; or tmux new -s default
}
