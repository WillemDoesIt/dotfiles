if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x EDITOR nvim
    set -x VISUAL nvim
end

set -g fish_greeting ""
fastfetch
