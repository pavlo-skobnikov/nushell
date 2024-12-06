# Enable Starship prompt.
use ~/.cache/starship/init.nu

# Meow? Meow!
source ~/dotfiles/nushell/nu_scripts/themes/nu-themes/catppuccin-mocha.nu

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
}
