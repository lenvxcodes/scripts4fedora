#!/bin/bash

USER_NAME=$(whoami)
USER_HOME=$(eval echo ~$USER_NAME)
XAUTH_FILE="$USER_HOME/.Xauthority"
DISPLAY_NUM=${DISPLAY:-:0}
COOKIE=$(mcookie)

touch "$XAUTH_FILE"
xauth -f "$XAUTH_FILE" add "$DISPLAY_NUM" MIT-MAGIC-COOKIE-1 "$COOKIE"
chown "$USER_NAME":"$USER_NAME" "$XAUTH_FILE"
chmod 600 "$XAUTH_FILE"
