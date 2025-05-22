#!/bin/sh

set -oue pipefail

help() {
    cat <<EOF
Usage: $(basename "$0") <command> [args...]

Commands:
  install <src_dir> <dest_dir>   Install using the bootstrap.sh build system.

See https://github.com/adelynnmckay/bootstrap.sh for more information.
EOF
}

install() {
    src_dir=$1
    dest_dir=$2

    if [ -z "$src_dir" ] || [ -z "$dest_dir" ]; then
        echo "Error: 'install' requires two arguments: <src_dir> <dest_dir>" >&2
        help
        exit 1
    fi

    if [ ! -d "$src_dir" ]; then
        echo "Error: Source directory does not exist: $src_dir" >&2
        exit 1
    fi

    mkdir -p "$dest_dir" || {
        echo "Error: Failed to create directory: $dest_dir" >&2
        exit 1
    }

    # Remove broken symlinks in dest_dir
    for file in "$dest_dir"/*; do
        if [ -L "$file" ] && [ ! -e "$file" ]; then
            rm -f "$file"
        fi
    done

    # Create symlinks for all files in src_dir
    for src_file in "$src_dir"/*; do
        if [ -f "$src_file" ]; then
            base_name=$(basename "$src_file")
            ln -sf "$(pwd)/$src_file" "$dest_dir/$base_name"
        fi
    done

    echo "Installed symlinks from $src_dir to $dest_dir"
}

main() {
    trap 'echo "Error: An error occurred."; help; exit 1' ERR

    if [ "$#" -lt 1 ]; then
        echo "Error: No command provided." >&2
        help
        exit 1
    fi

    case "$1" in
        install)
            if [ "$#" -ne 3 ]; then
                echo "Error: 'install' requires exactly two arguments: <src_dir> <dest_dir>" >&2
                help
                exit 1
            fi
            install "$2" "$3"
            ;;
        -h|--help)
            help
            exit 0
            ;;
        *)
            echo "Error: Unknown command: $1" >&2
            help
            exit 1
            ;;
    esac
}

main "$@"
