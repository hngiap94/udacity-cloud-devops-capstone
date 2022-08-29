setup:
	python3 -m venv ~/.devops

install:
	pip install --upgrade pip &&\
	pip install -r requirements.txt

install-git:
	sudo yum update -y
	sudo yum install git -y
	git version

install-docker:
	sudo yum update -y
	sudo yum install docker
	sudo usermod -a -G docker ec2-user
	id ec2-user
	newgrp docker
	sudo systemctl enable docker.service
	sudo systemctl start docker.service

install-hadolint:
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64
	chmod +x ./hadolint
	mv ./hadolint /usr/local/bin/hadolint

lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint