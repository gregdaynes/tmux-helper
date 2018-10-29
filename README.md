# tmux-helper

Create an alias in your aliases/zsh/bash config to tmux-start.rb
`alias t=$HOME/dotfiles/tmux/tmux-start.rb`

Use the alias to start a tmux session in the current directory with a session name of the current directory
`t`

Chain window names to the alias to create those tabs at start
`t vim jsx rb js db sh`

Chain window names to the alias inside a tmux session to add those tabs
`t scss html md`
