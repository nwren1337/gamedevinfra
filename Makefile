.PHONY: setup

setup:
	-@mkdir -p mnt/jenkins_home mnt/data/depot mnt/data/config
	-@docker compose build 