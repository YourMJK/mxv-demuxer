DIR = bin

.PHONY: build $(BINARY) clean
.DEFAULT_GOAL := build


$(DIR):
	mkdir $(DIR)

build: $(DIR)
	go build -C src/ -o ../$(DIR)/

clean:
	go clean -C src/
	rm $(DIR)/*
