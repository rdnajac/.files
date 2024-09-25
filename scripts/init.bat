@echo off

rem Start Alacritty terminal
REM start "" "C:\Users\R\Desktop\Alacritty.exe"

REM rem Wait for a moment to ensure Alacritty opens
REM timeout /t 1

REM rem Run WSL and SSH into your server with tmux
REM wsl -e bash -c "ssh rdn@${HOME_IP} 'zsh -l -c \"tmux attach-session -t windows-ssh || tmux new-session -s windows-ssh\"'"


start "" "C:\Users\R\Desktop\Alacritty.exe" -e "ssh rdn@ip 'zsh -l -c \"tmux attach-session -t windows-ssh || tmux new-session -s windows-ssh\"'"


