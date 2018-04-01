__all__ = (
    'configure'
)

def configure(repl):
    repl.confirm_exit = False
    repl.enable_input_validation = True
    repl.enable_open_in_editor = True
    repl.enable_mouse_support = True
    repl.enable_system_bindings = True
    repl.prompt_style = 'classic'
    repl.show_status_bar = True
    repl.use_code_colorscheme('native')
    repl.vi_mode = True
