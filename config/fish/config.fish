if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git*' --glob '!node_modules/*' --glob '!vendor/*'"
