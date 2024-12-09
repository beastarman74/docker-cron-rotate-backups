FROM python:alpine3.21

ENV ROTATE_CRON=""
ENV ROTATE_OPTIONS=""

RUN pip install rotate-backups

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["crond", "-f", "-l", "0"]