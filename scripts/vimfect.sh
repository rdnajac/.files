#!/bin/bash

REPODIR="$HOME/.files"
PLUGDIR="$REPODIR/.vim/pack/plugins"

# Determines the directory of a plugin and checks if it's installed.
get_plugin_dir() {
    local repo_path="$1"
    for subpath in start opt; do
        local dir="$PLUGDIR/$subpath/$(basename "$repo_path")"
        if [[ -d "$dir" ]]; then
            echo "$dir"
            return 0
        fi
    done
    return 1
}

plug() {
    local repo_path="$1"
    local subpath="${2:-start}"
    local plugin_name=$(basename "$repo_path")
    local plugin_dir="$PLUGDIR/$subpath/$plugin_name"
    
    if get_plugin_dir "$repo_path" &>/dev/null; then
        echo "Vim plugin $repo_path is already installed. Consider using 'update' to update it."
        return 1
    fi

    if [ -d "$plugin_dir" ]; then
        echo "Directory for $repo_path already exists. Please remove it manually if it's not a valid git repository."
        return 1
    fi

    echo "Installing Vim plugin: $repo_path"
    if ! git -C "$REPODIR" submodule add "https://github.com/$repo_path.git" "$plugin_dir"; then
        echo "Failed to add $repo_path as a submodule."
        return 1
    fi

    git -C "$REPODIR" commit -m "Add Vim plugin: $repo_path"
}

unplug() {
    local repo_path="$1"
    local plugin_name=$(basename "$repo_path")
    local plugin_dir_relative="vim/pack/plugins/start/$plugin_name"
    local plugin_dir="$REPODIR/$plugin_dir_relative"

    cd "$REPODIR"

    if [ -d "$plugin_dir" ]; then
        git submodule deinit -f "$plugin_dir_relative"
        git rm -f "$plugin_dir_relative"
        git commit -m "Remove plugin: $repo_path"

        echo "Plugin $repo_path has been successfully unplugged."
    else
        echo "Plugin directory does not exist: $plugin_dir"
    fi
}


sync() {
    echo "Syncing all plugins."
    cd "$REPODIR"
    git submodule update --remote --merge
    git commit -m "Sync Vim plugins"
}

update() {
    local repo_path="$1"
    local plugin_dir=$(get_plugin_dir "$repo_path")

    if [[ -z "$plugin_dir" ]]; then
        echo "Vim plugin $repo_path not installed. Use 'plug' to install it first."
        return 1
    fi

    echo "Updating Vim plugin: $repo_path"
    cd "$plugin_dir"
    git pull origin master
}

vimfect() {
    local command="$1"

    if [[ -z "$command" ]]; then
        echo "No command provided. Use one of 'plug', 'unplug', 'sync', or 'update'."
        return 1
    elif [[ "$command" != "plug" && "$command" != "unplug" && "$command" != "sync" && "$command" != "update" ]]; then
        echo "Invalid command: $command. Use one of 'plug', 'unplug', 'sync', or 'update'."
        return 1
    fi

    "$command" "${@:2}"
}

vimfect "$@"

