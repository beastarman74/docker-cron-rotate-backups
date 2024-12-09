FROM python:alpine

ENV ROTATE_CRON=""
ENV ROTATE_OPTIONS=""

# Setup the virtualenv
RUN python -m venv /venv
RUN pip install --no-cache-dir rotate-backups

# Ensures that the python and pip executables used
# in the image will be those from our virtualenv.
ENV PATH="/venv/bin:$PATH"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["crond", "-f", "-l", "0"]