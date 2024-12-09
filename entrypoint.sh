#!/bin/sh

cat << EOF > /var/spool/cron/crontabs/root
${ROTATE_CRON} /usr/local/bin/rotate-backups ${ROTATE_OPTIONS} ${ROTATE_ADDITIONAL_OPTIONS} /path1 /path2 /path3 /path4 /path5 /path6 /path7 /path8 /path9 /path10 
EOF

exec "$@"
