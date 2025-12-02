if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
# set -Ux HYPRSHOT_DIR "$HOME/Pictures/Screenshots"

# android sdk
set -e ANDROID_SDK_ROOT
set -x ANDROID_HOME /home/batman/Android/Sdk
set -x PATH $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $PATH

# cmdline-tools path
# set -g PATH $HOME/Android/Sdk/cmdline-tools/latest/bin $HOME/Android/Sdk/platform-tools $HOME/Android/Sdk/emulator $PATH

# flutter
# set -U fish_user_paths /opt/flutter/bin $fish_user_paths

function fish_user_key_bindings
    # 1. Bind Ctrl+y to accept the autosuggestion
    bind \cy accept-autosuggestion

    # 2. Bind Ctrl+k (Up) and Ctrl+j (Down) for history search
    # removing '-M insert' fixes the issue for standard mode
    bind \ck history-search-backward
    bind \cj history-search-forward
end

if status is-interactive
    if not set -q TMUX
        # Check if tmux is already running and attach, otherwise create a new session
        tmux attach -t default || tmux new -s default
    end
end
