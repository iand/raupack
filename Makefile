

build: build-minecraft build-raupack
push: push-minecraft push-raupack

.PHONY: build-minecraft
build-minecraft:
	docker build -t iandavis/minecraft-forge:1.12.2 -f build/minecraft-1.12/Dockerfile .

.PHONY: build-raupack
build-raupack:
	docker build -t iandavis/raupack:latest -f build/raupack/Dockerfile .


.PHONY: push-minecraft
push-minecraft:
	docker push iandavis/minecraft-forge:1.12.2

.PHONY: push-raupack
push-raupack:
	docker push iandavis/raupack:latest

.PHONY: run-minecraft
run-minecraft:
	docker run -p 25565:25565 iandavis/minecraft-forge:1.12.2

.PHONY: run-raupack
run-raupack:
	docker run -p 25565:25565 iandavis/raupack:latest
