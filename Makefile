# slock - simple screen locker
# See LICENSE file for copyright and license details.

INCS = -I. -I/usr/include 
LIBS = -L/usr/lib -lc -lcrypt -lX11 -lXext -lXrandr

CFLAGS = -std=c99 -pedantic -Wall
CFLAGS += ${INCLUDE} ${LIBS}
CFLAGS += -s -Ofast -march=native -mtune=native -flto

install: slock
	cp -f slock /usr/bin
	chmod 755 /usr/bin/slock
	chmod u+s /usr/bin/slock

slock: slock.c
	${CC} slock.c -o slock ${CFLAGS}

uninstall:
	rm -f /usr/bin/slock slock

.PHONY: install uninstall
