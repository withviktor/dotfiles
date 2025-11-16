# Nushell Environment Config File

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# Starship prompt
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

# Editor
$env.EDITOR = '/opt/homebrew/bin/nvim'

# Homebrew
$env.HOMEBREW_NO_ENV_HINTS = 1

# Language
$env.LANG = 'en_US.UTF-8'

# XDG Config
$env.XDG_CONFIG_HOME = '/Users/ciernava/.config'

# Starship config
$env.STARSHIP_CONFIG = '~/.config/starship/starship.toml'

# FZF
$env.FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow'

# Path
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')
