# Enable Starship prompt.
use ~/.cache/starship/init.nu

# 🐈
source ~/dotfiles/nushell/nu_scripts/themes/src/custom-nu-themes/catppuccin-frappe.nu

$env.config = {
    # Disable the welcome banner at startup.
    show_banner: false

    cursor_shape: {
        # Options: block, underscore, line, blink_block, blink_underscore, blink_line.
        vi_insert: line
        vi_normal: block
    }

    # Options: emacs, vi.
    edit_mode: vi # emacs, vi

    completions: {
        external: {
            enable: true
            max_results: 100
            completer: {|spans|
                fish --command $'complete "--do-complete=($spans | str join " ")"'
                | from tsv --flexible --noheaders --no-infer
                | rename value description
            }
        }
    }
}

# Aliases.
# Confirm before overwriting something.
alias cp = cp -i
alias mv = mv -i
alias rm = rm -i

# Always colorize ripgrep output.
alias rg = rg --color=auto

# More insightful ls.
alias lsa = ls -a
alias lsl = ls -l
alias lse = eza --group-directories-first --icons -lh --git -a
alias lst = eza --group-directories-first --icons -lh --tree --level=2 -a

# Replace cat with bat.
alias cat = bat -pp
# "Pretty" cat.
alias catp = bat

# Fzf with bat preview.
alias fzfp = fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"

# Lazy tools.
alias lg = lazygit
alias ld = lazydocker
