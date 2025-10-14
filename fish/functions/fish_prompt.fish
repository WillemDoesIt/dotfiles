function fish_prompt
    set_color (printf '#97e768')
    echo -n (whoami)
    set_color (printf '#52eea3')
    echo -n '@'
    set_color (printf '#43cfea')
    echo -n (hostname -s)
    set_color (printf '#43cfea')
    echo -n ' '
    set_color (printf '#437cf3')
    echo -n (prompt_pwd)
    set_color (printf '#e54f9b')
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set branch (git branch --show-current)
        test -n "$branch"; and echo -n " ($branch)"
    end
    echo -n '> '
    set_color normal
end

