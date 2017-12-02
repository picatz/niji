all: niji

niji:
	mkdir -p bin
	crystal build --release src/niji.cr -o bin/niji

PREFIX ?= /usr/local

install: niji 
	install -d $(PREFIX)/bin
	install bin/niji $(PREFIX)/bin
