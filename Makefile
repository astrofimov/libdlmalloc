PLATFORM ?= -m32

CFLAGS := $(PLATFORM)
LDFLAGS := $(PLATFORM)

all:
	gcc $(CFLAGS) -c -Wall -Werror -fpic -DMSPACES dlmalloc.c
	gcc $(LDFLAGS) -shared -o libdlmalloc.so dlmalloc.o
	ar cqs libdlmalloc.a dlmalloc.o

install: all
	cp libdlmalloc.so libdlmalloc.a /usr/lib/
	cp dlmalloc.h /usr/include/dlmalloc.h
	ln -sf `pwd`/dlmalloc.h dlmalloc.h

clean:
	rm -f libdlmalloc.so libdlmalloc.a dlmalloc.o
