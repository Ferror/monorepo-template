.PHONY:
run:
	docker compose up -d

.PHONY:
validate:
	docker compose run --rm tools vendor/bin/monorepo-builder validate
