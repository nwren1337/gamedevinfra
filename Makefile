.PHONY: setup, clean

SHELL := /bin/bash

setup:
	-@mkdir -p mnt/jenkins_home mnt/data/depot mnt/data/config
	-@source .env && echo $$GITHUB_TOKEN | docker login ghcr.io -u $$GITHUB_USERNAME --password-stdin
	-@docker compose build && docker compose pull

clean:
	-@rm -r mnt
	-@docker compose down --rmi all -v --remove-orphans