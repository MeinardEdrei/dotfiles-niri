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
set -U fish_user_paths /opt/flutter/bin $fish_user_paths
