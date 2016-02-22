#!/bin/sh

COLUMN=btrfs
COLOR=green

MSG=$(/sbin/btrfs device stats /)
MSGF=$(/sbin/btrfs fi show --all-devices)

if echo "${MSG}" | grep -vE ' 0$' ; then
    STATUS="&red $(hostname) btrfs status is not OK"
    COLOR=RED
else
    STATUS="&green $(hostname) btrfs status is OK"
fi

${XYMON} "${XYMSRV}" "status ${MACHINE}.${COLUMN} ${COLOR} $(date)

${STATUS}

${MSG}

${MSGF}
"
