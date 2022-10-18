#!/bin/bash

## Get Volume
get_vol() {
    vol=`pamixer --get-volume`
    echo "$vol"
}

## Get Icons
get_icon() {
	mute=`pamixer --get-mute`
	vol=`pamixer --get-volume`
	if [[ "$mute" == "true" ]]; then
		echo "婢 "
	elif [[ "$vol" -le "20" ]]; then
		echo " "
	elif [[ "$vol" -le "40" ]]; then
		echo " "
	elif [[ "$vol" -le "60" ]]; then
		echo " "
	elif [[ "$vol" -le "80" ]]; then
		echo " "
	else
		echo " "
	fi
}

## Output
if [[ "$1" == "--vol" ]]; then
	get_vol
elif [[ "$1" == "--icon" ]]; then
	get_icon
fi