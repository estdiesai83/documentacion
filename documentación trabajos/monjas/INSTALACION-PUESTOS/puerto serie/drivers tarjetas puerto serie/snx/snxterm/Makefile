# Copyright 2009 SUNIX GROUP all right reserved 
#CC=gcc -fmessage-length=0 -Wall -D_FORTIFY_SOURCE=2 -fstack-protector -O2 -pthread -pipe -o
CC=gcc -Wall -O2 -pthread -pipe -o
 

all: snxterm

install: snxterm
	cp -p snxterm /usr/bin


snxterm: snxterm.c
	$(CC) snxterm snxterm.c -lncurses


clean:  
	rm -f snxterm
	rm -f *~ *.o

