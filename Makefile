VENV_NAME?=server/venv
PYTHON=${VENV_NAME}/bin/python

## @ docker
.PHONY:  build run logs
build:  ## Gera a imagem do backend e sobe para o dockerhub
	docker build -t crontabdocker:latest ./crontab

run:  ## Gera a imagem do backend e sobe para o dockerhub
	docker container run  -d  --name cron crontabdocker:latest

logs:
	docker logs cron -f --tail=50

.PHONY: help
help:
	@${PYTHON} help.py