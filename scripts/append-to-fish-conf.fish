abbr -a rf 'exec fish'

function list_dir --on-variable PWD
    ls -GF
end

if test -z "$TMUX"
    if tmux ls &>/dev/null
        echo 'Attaching to last session'
        tmux a
    else
        echo 'No tmux sessions, creating a new one'
        tmux
    end
end
