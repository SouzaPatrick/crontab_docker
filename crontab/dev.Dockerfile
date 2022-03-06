FROM ubuntu:latest

RUN apt-get update && apt-get install -y software-properties-common && apt-get update && apt-get upgrade -y

RUN add-apt-repository ppa:deadsnakes/ppa

# Install Python Setuptools
RUN apt-get install -y python3.10 cron python3-pip

RUN apt-get purge -y software-properties-common && apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# copy crontabs for root user
COPY config/cronjobs /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab

WORKDIR /scripts
COPY config/requirements.txt .
COPY scripts/helloworld.py .

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

RUN chmod a+x helloworld.py

# Set the time zone to the local time zone
RUN echo "America/New_York" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

# start crond with log level 8 in foreground, output to stderr
#CMD ["cron", "-f", "-L", "8"]
CMD ["/etc/init.d/cron", "start"]