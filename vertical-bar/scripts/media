#!/bin/bash
# This script handles all media commands

bkpCover=$HOME/.config/eww/vertical-bar/assets/music.png

function has_player() {
    if playerctl status &> /dev/null;then
        [[ $(playerctl status) = "Stopped" ]] && return 1 || return 0
    else
        return 1
    fi
}

function title() {
    echo "Nothing Playing"
    [[ ! -z has_player && has_player ]] && playerctl metadata title;
    playerctl metadata -f '{{ title }}.{{ playerName }}' -F | while read -r title; do
        [[ ! -z has_player && has_player && ! -z "$title" ]] && playerctl metadata title || echo "Nothing Playing"
    done;
}

function artist() {
    echo "Offline"
    [[ ! -z has_player && has_player ]] && playerctl metadata artist;
    playerctl metadata -f '{{ artist }}.{{ playerName }}' -F | while read -r artist; do
        [[ ! -z has_player && has_player && ! -z "$artist" ]] && playerctl metadata artist || echo "Offline"
    done;
}

function cover() {
    Cover="$HOME/.cache/temp-$(playerctl metadata --format '{{ title }}').png"
    albumart="$(playerctl metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')"
    [[ $(playerctl metadata mpris:artUrl) ]] && curl -s "$albumart" --output "$Cover" || cp $bkpCover "$Cover"
    echo $Cover
}

function follow_cover() {
    echo $bkpCover
    [[ ! -z has_player && has_player ]] && cover && echo $cover
    playerctl metadata -f '{{ mpris:artUrl }}' -F | while read -r coverPath; do
        [[ ! -z has_player && has_player && ! -z "$coverPath" ]] && cover && echo $Cover
    done;
}

function ttime() {
    echo "--:-- / --:--"
    [[ ! -z has_player && has_player ]] && playerctl metadata -f "{{duration(position)}} / {{duration(mpris:length)}}"
    playerctl metadata -f '{{ duration(position) }} / {{ duration(mpris:length) }}' -F | while read -r ttime; do
        [[ ! -z has_player && has_player && ! -z "$ttime" ]] && echo "$ttime" || echo "--:-- / --:--"
    done;
}

function current_time() {
    echo "--:--"
    [[ ! -z has_player && has_player ]] && playerctl metadata -f "{{duration(position)}}"
    playerctl metadata -f '{{ duration(position) }}' -F | while read -r ctime; do
        [[ ! -z has_player && has_player && ! -z "$ctime" ]] && echo "$ctime" || echo "--:--"
    done;
}

function total_time() {
    echo "--:--"
    [[ ! -z has_player && has_player ]] && playerctl metadata -f "{{duration(mpris:length)}}"
    playerctl metadata -f '{{ duration(mpris:length) }}' -F | while read -r ttime; do
        [[ ! -z has_player && has_player && ! -z "$ttime" ]] && echo "$ttime" || echo "--:--"
    done;
}

function class() {
    [[ ! -z has_player && has_player ]] && echo "pause" || echo "play"
    playerctl --follow status | while read -r status; do
        [[ ! -z has_player && has_player && "$status" = "Playing" ]] && echo "pause" || echo "play"
    done;
}

function icon() {
    [[ ! -z has_player && has_player && "$status" = "Playing" ]] && echo "" || echo ""
    playerctl --follow status | while read -r status; do
        [[ ! -z has_player && has_player && "$status" = "Playing" ]] && echo "" || echo ""
    done
}

function toggle() {
    if has_player; then
        playerctl play-pause
    fi
}

function play() {
    if has_player;then
        playerctl play
    fi
}

function pause() {
    if has_player;then
        playerctl pause
    fi
}

function stop() {
    if has_player;then
        playerctl stop
    fi
}

function next() {
    if has_player;then
        playerctl next
    fi
}

function prev() {
    if has_player;then
        playerctl previous
    fi
}

function percent() {
    if has_player;then
        local pos=$(playerctl position)
        local len=$(playerctl metadata mpris:length)
        echo "$pos $len" | awk '{ print ($1 / $2 * 1000000) * 100 }'
    else
        echo 0
    fi
}

function prev() {
    if has_player; then
        playerctl previous
    fi
}

function next() {
    if has_player; then
        playerctl next
    fi
}

function track() {
    if has_player; then
        local len=$(playerctl metadata mpris:length)
        local pos=$1
        pos=$((len * pos / 100000000))
        echo "$pos"
        playerctl position $pos
    fi
}

case "$1" in
    "title") title;;
    "artist") artist;;
    "time") ttime;;
    "current-time") current_time;;
    "total-time") total_time;;
    "toggle") toggle;;
    "icon") icon;;
    "percent") percent;;
    "play") play;;
    "pause") pause;;
    "stop") stop;;
    "prev") prev;;
    "next") next;;
    "class") class;;
    "cover") cover;;
    "track") track "$2";;
    "follow-cover") follow_cover;;
    *) cover;;
esac
