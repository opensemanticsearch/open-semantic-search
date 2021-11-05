.PHONY: setup help
.DEFAULT_GOAL := help

help:
	@echo "Usage: make [COMMAND]"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo "    setup  - set up the git submodules so this is a full repo"

setup:
	git submodule init
	git submodule update --init --recursive
