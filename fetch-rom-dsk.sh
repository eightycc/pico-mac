#!/bin/sh
set -xe

if ! [ -f rom.bin ]; then
    curl -L 'https://ia902205.us.archive.org/view_archive.php?archive=/18/items/mac_rom_archive_-_as_of_8-19-2011/mac_rom_archive_-_as_of_8-19-2011.zip&file=4D1F8172%20-%20MacPlus%20v3.ROM' > rom.bin
fi

if ! [ -f umac0ro.img ]; then
    if ! [ -f os.7z ]; then
        curl -L 'https://archive.org/download/apple-mac-os-system-3.2-finder-5.3-system-tools-1.0-512-ke-jun-1986-3.5-800k.-7z/Apple%20Mac%20OS%20%28System%203.2%20Finder%205.3%29%20%28System%20Tools%201.0%20Mac%20128%2C%20512K%29%20%28Jun%201986%29%20%283.5-400k%29.7z' > 'os.7z'
    fi
    7z x -so 'os.7z' 'Apple Mac OS (System 3.2 Finder 5.3) (System Tools 1.0 Mac 128, 512K) (Jun 1986) (3.5-400k)/System Installation.img' > umac0ro.img
fi
