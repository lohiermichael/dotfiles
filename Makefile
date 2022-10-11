# Copyright 2022 Michael Lohier

PWD = $(shell pwd)

.PHONY: install
install: dotfiles
	@:

.PHONY: uninstall
uninstall: uninstall-dotfiles
	@:

DOTFILES += .bash_profile
DOTFILES += .bashrc
DOTFILES += .bash_aliases
DOTFILES += .exports
DOTFILES += .gitconfig

.PHONY: dotfiles
dotfiles: $(addprefix $(HOME)/,$(DOTFILES))

$(HOME)/%: %
	@! [ -e $@ ] || rm -rf -- $@
	@mkdir -pv $(@D)
	@ln -svf $(PWD)/$< $@
	@! [ $(@D) = $(HOME)/.gnupg ] || chmod -c 600 $< $@

.PHONY: uninstall-dotfiles
uninstall-dotfiles:
	@$(foreach f,$(addprefix $(HOME)/,$(DOTFILES)), rm -fv $f;)

BREWS += tree

.PHONY: brew
brew:
	brew update
	brew install $(BREWS)

# TODO: try the autogenerated helper
.PHONY: help
help:
	@echo "Hi, these are Michael's config files."
	@echo
	@echo "The following targets are available:"
	@echo
	@echo "  brew                     install system packages with homebrew"
	@echo "  dotfiles                 install user config files (starting with .)"
	@echo "  help                     show this help message"
	@echo "  install                  install user config files"
	@echo "  uninstall                uninstall user config files"
	@echo "  uninstall-dotfiles       install user config files (starting with .)"
	@echo
