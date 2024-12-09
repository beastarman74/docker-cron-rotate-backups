#!/bin/sh

cat << EOF > /var/spool/cron/crontabs/root
${ROTATE_CRON} /usr/local/bin/rotate-backups ${ROTATE_OPTIONS} --config /etc/rotate-backups.d/config.ini  
EOF

exec "$@"
