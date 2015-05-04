#==========================================
#    Makefile: makefile for sl 6.0
#	Copyright 1993, 1998, 2014
#                 Toyoda Masashi
#		  (mtoyoda@acm.org)
#	Last Modified: 2014/03/31
#==========================================

CC=gcc

sl: sl.c sl.h
	$(CC) $(CFLAGS) -o sl sl.c -lncurses
	

install:
	install -D -m 0775 sl $(DESTDIR)/usr/bin/sl
	install -Dm 644 sl.1 $(DESTDIR)/usr/share/man/man1/sl.1
	gzip -9 -f $(DESTDIR)/usr/share/man/man1/sl.1

uninstall:
	rm -rf $(DESTDIR)/usr/bin/sl
	rm -rf $(DESTDIR)/usr/share/man/man1/sl.1.gz

clean:
	rm -rf sl
