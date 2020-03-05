#tmux ide
This plugin provide 'tide' command that allow you to open tmux with predefined layout. 

```zsh
plugins=(... tmuxide)
```
## Prerequisites

vim with NERDTree plugin.

## Usage

Start tmux session with opened vim in specified directory

```
tide sessionname ~/workspace/project
```

Select throug existing sessions

```zsh
tide
```

Attach to existing session with name 'sessionname'
```zsh
tide sessionname
```

### additional configuration

You can put .tide file at your project directory and put tmux commands to setup tmux layout

Example: .tide 
```zsh
split -h "lein repl"
split -v
neww -n "MidnightC" mc
select-window -t :=0
select-pane -t 0
resize-pane -Z
```

will open a tmux session with two windws. First with vim, lein repl and one more pane for compiling and running server. Second with midnight commander opened. 
