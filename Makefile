INSTALLS=$(wildcard */install.zsh)

all: $(INSTALLS)

vim: go/install.zsh node/install.zsh python/install.zsh

%: %/install.zsh

%/install.zsh: FORCE %
	$(eval c=$(patsubst %/install.zsh,%,$@))
	echo | awk '{print "\033[1;32m$(c)\033[39m Starting..."}'
	zsh -l $@ 2>&1 | awk '{print "\033[1;32m$(c)\033[39m " $$0}'
	echo | awk '{print "\033[1;32m$(c)\033[39m Done!"}'

FORCE:
