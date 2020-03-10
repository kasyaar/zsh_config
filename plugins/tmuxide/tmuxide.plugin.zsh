tide() {
    if [ -z "$1" ]; then
        tmux new -A -s choose \; choose-tree -s
    else
        project_path="`readlink -f $1`/"
        if [ -z "$2" ]; then
            #no session name specified
            session_name="`basename $project_path`"
        else
            session_name=$2
        fi
        tmux new -A -s $session_name -c $project_path -n "Editor" "vim +NERDTreeToggle" \; source-file "$project_path/.tide"
    fi
}
