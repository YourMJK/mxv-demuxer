DIR = bin

.PHONY: build $(BINARY) clean
.DEFAULT_GOAL := build


$(DIR):
	mkdir $(DIR)

build: $(DIR)
	go build -o $(DIR)/

clean:
	go clean
	rm $(DIR)/*
