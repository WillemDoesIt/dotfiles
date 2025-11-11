function fish_prompt
    set_color (printf '#95e566')
    echo -n (whoami)
    set_color (printf '#4feca1')
    echo -n '@'
    set_color (printf '#41cde8')
    echo -n (hostname -s)
    set_color (printf '#41cde8')
    echo -n ' '
    set_color (printf '#417af1')
    echo -n (prompt_pwd)
    set_color (printf '#e34d99')
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set branch (git branch --show-current)
        test -n "$branch"; and echo -n " ($branch)"
    end
    echo -n '> '
    set_color normal
end

