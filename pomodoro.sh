#!/bin/bash

WORK_DURATION=$((25 * 60))
SHORT_BREAK_DURATION=$((5 * 60))
LONG_BREAK_DURATION=$((15 * 60))

CYCLES_BEFORE_LONG_BREAK=4

NOTIFICATION_SOUND="notifpomodoro.wav"

send_notification() {
    notify-send --urgency=normal --expire-time=5000 "$1" "$2"
    paplay "$NOTIFICATION_SOUND"
}

cycle_count=0

while true; do
    send_notification "Pomodoro" "Commencez à travailler !"
    sleep $WORK_DURATION
    ((cycle_count++))
    if ((cycle_count == CYCLES_BEFORE_LONG_BREAK)); then
        send_notification "Pomodoro" "Prenez une pause longue de 15 minutes !"
        sleep $LONG_BREAK_DURATION
        cycle_count=0
    else
        send_notification "Pomodoro" "Prenez une pause courte de 5 minutes !"
        sleep $SHORT_BREAK_DURATION
    fi
done

