FROM alpine:3.6

# copy crontabs for root user
COPY config/cronjobs /etc/crontabs/root

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

WORKDIR /scripts
COPY config/requirements.txt .
COPY config/conf.yml .
COPY scripts/helloworld.py .

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

RUN chmod a+x helloworld.py

# start crond with log level 8 in foreground, output to stderr
CMD ["crond", "-f", "-d", "8"]