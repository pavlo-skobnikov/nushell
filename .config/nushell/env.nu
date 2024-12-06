# Add PATHs.
$env.PATH = (
  $env.PATH
  | split row (char esep)
  # Homebrew's binaries.
  | prepend '/opt/homebrew/bin'
  # User-installed binaries.
  | append ($env.HOME | path join ".local/bin")
  # Public scripts.
  | append ($env.HOME | path join "public-scripts")
  # Private scripts.
  | append ($env.HOME | path join "private-scripts")
  # Add GNU coreutils to the PATH.
  | append "/opt/homebrew/opt/coreutils/libexec/gnubin"
  # Add GNU sed to the PATH.
  | append "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
  # Rust-installed binaries.
  | append ($env.HOME | path join ".cargo/bin")
  # Rust environment.
  | append ($env.HOME | path join ".cargo/env")
  # Go-installed binaries.
  | append ($env.HOME | path join "go/bin")
  # Rust toolkit.
  | append ($env.HOME | path join ".cargo/bin")
  # IntelliJ IDEA.
  | append "/Applications/IntelliJ IDEA.app/Contents/MacOS/"
  # Remove repeating entries.
  | uniq
)

# Add environment variables.
# SDKMan! path.
$env.SDKMAN_DIR = ($env.HOME | path join .sdkman)

load-env {
  # Add CLI configuration.
  "EDITOR": "hx"
  "PAGER": "less"
  "MANPAGER": "sh -c 'col -bx | bat -l man -p'"
  "MANWIDTH": 999
  # Set bat theme.
  "BAT_THEME": "base16"
  # Set karabiner configuration path for goku.
  "GOKU_EDN_CONFIG_FILE": ($env.HOME | path join .config karabiner karabiner.edn)
  # Hide Starship warnings.
  "STARSHIP_LOG": "error"
  # Set up Java and Maven PATHs via SDKMAN
  "JAVA_HOME": ($env.SDKMAN_DIR | path join candidates java current)
  "M2_HOME": ($env.SDKMAN_DIR | path join candidates maven current)
}

# Source the secrets.
# NOTE: The files is just a simple TOML file with simple definitions
# (i.e. KEY = "VALUE") to allow dynamic loading of environment variables.
$env.HOME | path join secrets secret_exports.toml | open | load-env

# Starship prompt setup.
mkdir ~/.cache/starship

starship init nu | save -f ~/.cache/starship/init.nu
