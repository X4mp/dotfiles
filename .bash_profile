export EDITOR=vim
export VISUAL=$EDITOR

echo "             _  _    __  ";
echo "           _| || |_ |  |  ";
echo "          |_  __  _||  | ";
echo "           _| || |_ |  |  ";
echo "          |_  __  _||__|  ";
echo "            |_||_|  (__)  ";
echo "                         ";
echo " ";

# make sure this is an interactive session, then start tmux
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && ~/.tmux_bootstrap
[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
