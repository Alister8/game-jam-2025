#!/bin/sh
echo -ne '\033c\033]0;Soda Slinger\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Soda_Slinger.x86_64_Linux.x86_64" "$@"
