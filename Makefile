.PHONY: all
all: install

.PHONY: install
install:
	chmod +x ./bootstrap.sh && ./bootstrap.sh