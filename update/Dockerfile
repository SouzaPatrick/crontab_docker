FROM python:3

WORKDIR /scripts
COPY config/requirements.txt .
COPY config/conf.yml .
COPY scripts/helloworld.py .

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

RUN chmod a+x helloworld.py

CMD ["nameko", "run", "--config", "conf.yml", "helloworld"]