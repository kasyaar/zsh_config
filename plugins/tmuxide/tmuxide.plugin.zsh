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
                prj_path="`readlink -f $2`/"
                echo  "$prj_path.tide"
               tmux new -A -s $1 -c $prj_path -n "Editor" "vim +NERDTreeToggle" \; source-file "$prj_path/.tide"
            fi
        fi
    fi
}
