#!/bin/sh

dzenForeGround=$1
dzenBackGround=$2
myFont=$3
height=20

screen_size=`xwininfo -metric -root|sed -ne 's/.*geometry.*x\([0-9]*\)+.*/\1/p'`

y_cord=`expr $screen_size - $height`

number_of_screens=`xrandr | grep Screen | wc -l`

if [ "$number_of_screens" = "1" ]; then
    echo One screen found
    conqy_string="conky -c ~/.dzen/.dzen_conky | dzen2 -y '$y_cord' -h '20' -ta 'r' -fg '$dzenForeGround' -bg '$dzenBackGround' -fn '$myFont'"

elif [ $number_of_screens eq 2 ]; then
    echo Two screens found
    conqy_string="conky -c ~/.dzen/.dzen_conky | dzen2 -y '0' -h '20' -ta 'r' -fg '$dzenForeGround' -bg '$dzenBackGround' -xs 2 -fn '$myFont'"

else
    echo Too many screens.
    exit 1
fi

echo $conqy_string

eval ${conqy_string} &
