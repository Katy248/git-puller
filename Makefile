SRC_FILES := $(shell shfmt -f .)

FMT_FLAGS := -i=4 -ci -sr -fn -s
CHECK_FLAGS := -a --color=always -x --format=tty

check:
	shellcheck $(SRC_FILES)
	desktop-file-validate ./other/git-puller.desktop

fmt:
	shfmt $(FMT_FLAGS) -w $(SRC_FILES)

install:
	cp ./git-puller.sh /usr/bin/git-puller
	cp ./other/git-puller.desktop /usr/share/applications/git-puller.desktop
