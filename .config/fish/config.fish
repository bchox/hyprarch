if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

# Starting directory
cd ~/

# Starting applications / commands
# neofetch

# Alias commands
alias ll="ls -l -a"
alias leggo="Hyprland"

# Have Powerline Shell take control of the prompt
function fish_prompt
	powerline-shell --shell bare $status
end
