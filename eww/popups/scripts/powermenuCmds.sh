FILE="$HOME/.cache/powermenu"

## Shutdown
shutdown() {
	rm $FILE
	systemctl poweroff
}

## Reboot
reboot() {
	rm "$FILE"
	systemctl reboot
}

## Lock Screen
lock() {
	rm "$FILE"
	loginctl lock-session
}

## Suspend
suspend() {
	rm "$FILE"
	systemctl suspend
}

## Logout
logout() {
	rm "$FILE"
	loginctl terminate-session ${XDG_SESSION_ID-}
}

if [[ "$1" == "--shutdown" ]]; then
	shutdown
elif [[ "$1" == "--reboot" ]]; then
    reboot
elif [[ "$1" == "--lock" ]]; then
    lock
elif [[ "$1" == "--suspend" ]]; then
    suspend
elif [[ "$1" == "--logout" ]]; then
    logout
fi
