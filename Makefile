.PHONY: all
all: slide.pdf

slide.pdf: slide.saty
	docker run \
		--rm \
		--name satysfi \
		--mount type=bind,src=$$(pwd),dst=/work \
		satysfi \
		satysfi slide.saty

.PHONY: shell
shell:
	docker run \
		-it \
		--rm \
		--name satysfi \
		--mount type=bind,src=$$(pwd),dst=/work \
		satysfi \
		sh

.PHONY: docker
docker:
	docker build --tag satysfi .

.PHONY: clean
clean:
	rm -f *.pdf *.satysfi-aux
