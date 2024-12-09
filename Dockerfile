FROM python:3-alpine3.20

ENV ROTATE_CRON=""
ENV ROTATE_OPTIONS=""
ENV ROTATE_ADDITIONAL_OPTIONS=""

RUN pip install rotate-backups

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["crond", "-f", "-l", "0"]