#!/bin/bash

menu=$(printf "Shutdown\nHibernate\nSuspend\nRestart\nLogout\nLock" | fuzzel --dmenu --lines=6 --width=40)

case "$menu" in
    Shutdown) systemctl poweroff ;;
    Hibernate) systemctl hibernate ;;
    Suspend) systemctl suspend ;;
    Restart) systemctl reboot ;;
    Logout) loginctl terminate-user $USER ;;
    Lock) hyprlock ;;
esac

