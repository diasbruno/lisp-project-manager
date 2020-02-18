EXE='(asdf:make "lpm-executable")'
CL_SOURCE_REGISTRY=`cat $$(pwd)/source-registry.conf`

build:
	CL_SOURCE_REGISTRY=$(CL_SOURCE_REGISTRY) \
	sbcl --eval $(EXE) --non-interactive
