tide() {
	if [ -z "$1" ];then
        tmux new -A -s choose \; choose-tree -Zs
    else
        if [[ $(tmux ls -F#S | grep ^$1$) ]];then
            tmux attach -t $1
        else
            if [ -z "$2" ];then
                echo "Path to project is not specified."
            else
                tmux new -A -s $1 -c $2 -n "Editor" "vim +NERDTreeToggle" \; source-file "$2/.tide"
            fi
        fi
    fi
}
