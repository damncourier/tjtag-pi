CFLAGS += -Wall -O2 

WRT54GMEMOBJS = tjtag.o

all: tjtag

wrt54g: $(WRT54GMEMOBJS)
	gcc $(CFLAGS) -o $@ $(WRT54GMEMOBJS)

pi4: CFLAGS += -D RASPPI -D RASPPI4
pi4: all

pi3: CFLAGS += -D RASPPI -D RASPPI3
pi3: all

pi: CFLAGS += -D RASPPI
pi: all

clean:
	rm -rf *.o tjtag
