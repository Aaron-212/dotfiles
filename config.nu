$env.config = {
    show_banner: false
    rm: {always_trash: true}
    display_errors: {exit_code: true, termination_signal: false}
    hooks: {
        command_not_found: {|cmd_name| (
                try {
                    let cmds: string = (brew which-formula $cmd_name)
                    if ($cmds | is-empty) {
                        return null
                    } else {
                        return (
                            $"(ansi $env.config.color_config.shape_external)($cmd_name)(ansi reset) " +
                            $"may be found in the following brew formulae:\n($cmds)"
                        )
                    }
                }
            ) }
        env_change: {
            PWD: [
                {||
                    if (which direnv | is-empty) {
                        return
                    }
                    direnv export json | from json | default {} | load-env
                }
            ]
        }
    }
}

$env.config.keybindings ++= [
    {
        name: cancel_input
        modifier: CONTROL
        keycode: Char_c
        mode: emacs
        event: [
            {edit: Clear}
        ]
    }
]

source "~/dotfiles/custom.nu"
