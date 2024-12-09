FROM python:3-alpine3.20

ENV ROTATE_CRON=""
ENV ROTATE_OPTIONS=""
ENV ROTATE_ADDITIONAL_OPTIONS=""

RUN pip install rotate-backups

COPY config.ini /etc/rotate-backups.d/config.ini
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["crond", "-f", "-l", "0"]