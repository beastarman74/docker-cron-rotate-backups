FROM python:3-alpine3.20

ENV ROTATE_CRON=""
ENV ROTATE_OPTIONS=""

RUN pip install rotate-backups

#RUN mkdir /data

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["crond", "-f", "-l", "0"]
