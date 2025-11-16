# Nushell Environment Config File

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

# Environment variables
$env.EDITOR = '/opt/homebrew/bin/nvim'
$env.VISUAL = '/opt/homebrew/bin/nvim'
$env.LANG = 'en_US.UTF-8'
$env.HOMEBREW_NO_ENV_HINTS = 1

# Add homebrew to path if not already there
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')

# Starship prompt (optional - install with: brew install starship)
# Uncomment if you want to use starship:
# mkdir ~/.cache/starship
# starship init nu | save -f ~/.cache/starship/init.nu
# use ~/.cache/starship/init.nu

# Simple custom prompt (if not using starship)
$env.PROMPT_COMMAND = {|| 
    let path = (pwd | path basename)
    $"(ansi green)($path)(ansi reset) > "
}

$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = "::: "
