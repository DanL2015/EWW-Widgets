#!/bin/sh

EWW=`which eww`
CFG="$HOME/.config/eww/bottom-bar"

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
  ${EWW} -c $HOME/.config/eww/bottom-bar close bar
  ${EWW} -c $HOME/.config/eww/bottom-bar open bar
}

## Launch or close widgets accordingly
run_eww
