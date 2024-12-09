FROM python:alpine3.21

ENV ROTATE_CRON=""
ENV ROTATE_OPTIONS=""
# Ensures that the python and pip executables used
# in the image will be those from our virtualenv.
ENV PATH="/venv/bin:$PATH"
# Setup the virtualenv
RUN python -m venv /venv
RUN pip install rotate-backups

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["crond", "-f", "-l", "0"]