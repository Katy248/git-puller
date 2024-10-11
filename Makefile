SRC_FILES := $(shell shfmt -f .)

FMT_FLAGS := -i=4 -ci -sr -fn -s
CHECK_FLAGS := -a --color=always -x --format=tty

check:
	shellcheck $(SRC_FILES)

fmt:
	shfmt $(FMT_FLAGS) -w $(SRC_FILES)
