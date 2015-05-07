#==========================================
#    Makefile: makefile for sl 6.0
#	Copyright 1993, 1998, 2014
#                 Toyoda Masashi
#		  (mtoyoda@acm.org)
#	Last Modified: 2014/03/31
#==========================================

CC=gcc

all: sl sl-h

sl: sl.c sl.h
	$(CC) $(CFLAGS) -o sl sl.c -lncurses
	
sl-h: sl-h.c sl-h.h
	$(CC) $(CFLAGS) -o sl-h sl-h.c -lncurses

install:
	install -D -m 0775 sl $(DESTDIR)/usr/bin/sl
	install -D -m 0775 sl-h $(DESTDIR)/usr/bin/sl-h
	install -Dm 644 sl.1 $(DESTDIR)/usr/share/man/man1/sl.1
	gzip -9 -f $(DESTDIR)/usr/share/man/man1/sl.1

uninstall:
	rm -rf $(DESTDIR)/usr/bin/sl
	rm -rf $(DESTDIR)/usr/bin/sl-h
	rm -rf $(DESTDIR)/usr/share/man/man1/sl.1.gz

clean:
	rm -rf sl sl-h
