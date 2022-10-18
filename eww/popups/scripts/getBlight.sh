## Get Brightness
get_blight() {
	bright=`xbacklight -get`
	echo "$bright"
}

##Get Icons
get_icon() {
	bright=`xbacklight -get`
	if [[ "$bright" -le "20" ]]; then
		echo " "
	elif [[ "$bright" -le "40" ]]; then
		echo " "
	elif [[ "$bright" -le "60" ]]; then
		echo " "
	elif [[ "$bright" -le "80" ]]; then
		echo " "
	else
		echo " "
	fi
}

if [[ "$1" == "--blight" ]]; then
	get_blight
elif [[ "$1" == "--icon" ]]; then
	get_icon
fi