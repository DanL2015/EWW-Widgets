#!/bin/sh

BLANK='#00000000'
CLEAR='#a9b1d6'
DEFAULT='#565f89'
BLACK='#1a1b26'
TEXT='#a9b1d6'
WRONG='#f7768e'
VERIFYING='#7dcfff'



sleep 1 && eww -c $HOME/.config/eww/lock open-many welcome music stats &

i3lock \
--nofork \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLACK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--time-font=Iosevka          \
--date-font=Iosevka          \
--layout-font=Iosevka        \
--verif-font=Iosevka         \
--wrong-font=Iosevka         \
--greeter-font=Iosevka       \
\
--screen 1                   \
--ring-width 16              \
--blur 5                     \
--indicator                  \
--keylayout 1                \
\

eww -c $HOME/.config/eww/lock close-all &
