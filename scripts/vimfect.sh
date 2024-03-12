#!/bin/bash

REPODIR="$HOME/.files"
PLUGDIR="$REPODIR/.vim/pack/plugins"
STARTDIR="$PLUGDIR/start"
OPTDIR="$PLUGDIR/opt"

function is_installed() {
    local base_name=$(basename "$1")
    [[ -d "$STARTDIR/$base_name" || -d "$OPTDIR/$base_name" ]]
}

function vimfect() {
    local command="$1"
    local repo_path=""

    # Determine if a second argument is a repo path
    if [[ "$2" =~ ^[a-zA-Z0-9._-]+/[a-zA-Z0-9._-]+$ ]]; then
        repo_path="$2"
    elif [[ "$1" =~ ^[a-zA-Z0-9._-]+/[a-zA-Z0-9._-]+$ ]]; then
        repo_path="$1"
        command=""  # Assume command is plug/update based on installation status
    fi

    # Decide command based on installation status or explicit user command
    if [[ -n "$repo_path" && -z "$command" ]]; then
        if is_installed "$repo_path"; then
            command="update"
        else
            command="plug"
        fi
    elif [[ -z "$repo_path" && "$command" == "sync" ]]; then
        # sync command does not require a repo_path
        :  # noop
    else
        echo "Invalid usage. Provide a GitHub repo path or use the 'sync' command without a path."
        return 1
    fi

    local plugin_dir="$PLUGDIR/start/$(basename "$repo_path")"

    case "$command" in
        plug)
            if is_installed "$repo_path"; then
                echo "Plugin $repo_path is already installed. Consider using 'update' to update it."
                return 1
            fi
            echo "Installing plugin: $repo_path"
            mkdir -p "$plugin_dir" && cd "$REPODIR"
            git submodule add "https://github.com/$repo_path.git" "$plugin_dir"
            git add .gitmodules "$plugin_dir"
            git commit -m "Add plugin: $repo_path"
            ;;
        unplug)
            if is_installed "$repo_path"; then
                echo "Unplugging plugin: $repo_path"
                local plugin_name=$(basename "$repo_path")
                local plugin_dir="$PLUGDIR/$(is_installed "$repo_path" && echo "start" || echo "opt")/$plugin_name"
                git submodule deinit -f "$plugin_dir"
                git rm -f "$plugin_dir"
                rm -rf "$plugin_dir"
                git commit -m "Remove plugin: $repo_path"
            else
                echo "Plugin $repo_path not installed."
            fi
            ;;
        sync)
            echo "Syncing all plugins."
            cd "$REPODIR"
            git submodule update --remote --merge
            git commit -m "Sync plugins"
            ;;
        update)
            if is_installed "$repo_path"; then
                echo "Updating plugin: $repo_path"
                cd "$plugin_dir"
                git pull origin master
            else
                echo "Plugin $repo_path not installed. Use 'plug' to install it first."
            fi
            ;;
        *)
            echo "Invalid command. Use 'plug', 'unplug', 'sync', or 'update'."
            return 1
            ;;
    esac
}

vimfect "$@"

