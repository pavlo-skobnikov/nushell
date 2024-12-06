
# Add environment variables.
load-env {
  # Add CLI configuration.
  "EDITOR": 'hx'
  "PAGER": 'less'
  "MANPAGER": "sh -c 'col -bx | bat -l man -p'"
  "MANWIDTH": 999
  # Set bat theme.
  "BAT_THEME": "base16"
  # Set karabiner configuration path for goku.
  "GOKU_EDN_CONFIG_FILE": ($env.HOME | path join .config karabiner karabiner.edn)
  # Enable preview files with bat for fzf.
  'FZF_CTRL_T_OPTS': "
    --walker-skip .git,node_modules,target
    --preview 'bat -n --color=always {}'"
  # SDKMan! path.
  "SDKMAN_DIR": ($env.HOME | path join .sdkman)
  # Set up Java and Maven PATHs via SDKMAN
  "JAVA_HOME": ($env.SDKMAN_DIR | path join candidates java current)
  "M2_HOME": ($env.SDKMAN_DIR | path join candidates maven current)
}


# Starship prompt setup.
mkdir ~/.cache/starship

starship init nu | save -f ~/.cache/starship/init.nu
