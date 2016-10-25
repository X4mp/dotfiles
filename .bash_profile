echo "  _____                  __              __________                " 
echo "  /  _  \_______   ____ |  |__           \______   \__  _  ______  "
echo " /  /_\  \_  __ \_/ ___\|  |  \   ______  |     ___/\ \/ \/ /    \\ "
echo "/    |    \  | \/\  \___|   Y  \ /_____/  |    |     \     /   |  \\"
echo "\____|__  /__|    \___  /___|  /          |____|      \/\_/|___|  /"
echo "        \/            \/     \/                                 \/ "

#echo "   _  _    __  ";
#echo " _| || |_ |  |  ";
#echo "|_  __  _||  | ";
#echo " _| || |_ |  |  ";
#echo "|_  __  _||__|  ";
#echo "  |_||_|  (__)  ";
#echo "               ";
#echo " ";

# make sure this is an interactive session, then start tmux
[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && ~/.tmux_bootstrap

