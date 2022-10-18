#!/bin/bash

## Files and cmd
FILE="$HOME/.cache/blight"
CFG="$HOME/.config/eww/popups"
EWW=`which eww`

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	${EWW} --config "$CFG" open blight
}

${EWW} --config "$CFG" close blight
run_eww
sleep 5 && ${EWW} --config "$CFG" close blight
