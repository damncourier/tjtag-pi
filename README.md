Things added in this forked repo:

- **/brcmlv for exiting broadcom lv mode.** lv mode will report the cpuid as all 1s. personal experience with bcm4717 led me to this patch. safe bet bcm4716 and bcm4718 also start in lv mode because it is bcm47xx with dualband 802.11N support. this is also stated in mailing list post by Paul Fertser (big thanks to him for spreading lv mode documentation around the web)
- **cpu type for bcm4717.** (when in ejtag mode). based on config files found in openocd (again Paul Fertser), it seems the id is shared with bcm4718. no idea if it holds for bcm4716 (or if what was already in the code has any meaning).
- **/swap_endian applies to writing.** no clue if need for this was caused by SoC or the spi flash present in wrt320n but things were being written in the wrong order and the argument seemed to only have been implemented when reading.
- **/debug to set debug flag.** instead of requiring change to source, output is pretty verbose and only moderately useful.
- **support for pi 4.** use "make pi4", pi and pi3 are still there.

---

tjtag-pi is a fork of [tjtag][] with support for [Raspberry Pi][pi]
which eliminates the need for a PC with parallel port.

For Pi3, compile it with:
        $ make pi3

WARNING
=======

Be warned that incorrect usage can lead to a point of no return
situation. Before you do anything besides what is described here, please
do research on how to use this tool. A good starting point is the
excellent and cautionary `guide.pdf` written by the HairyDairyMaid, the
original author. Always backup before flashing.

Requirements
============

 * A Raspberry Pi (I've only tested model B as of late 2013)
 * [Dual female jumper wires][jumper] to connect GPIO pins to WRT
 * Pins soldered on the JTAG header on WRT
 * Beverege to enjoy afterward

Setup
=====

 1. Hook up the two boards as per the diagram in `wiring.jpg`
 2. Power up your WRT
 3. Checkout the code, compile and run it

        $ cd ~
        $ git clone git@github.com:oxplot/tjtag-pi.git
        $ cd tjtag-pi
        $ make pi
        $ ./tjtag -probeonly

    If it gets stuck, try using `/noemw` option.

If at this point, your SoC and flash is recognized, you're all set.
Enjoy your beverage and look for an appropriate guide that explains how
to use tjtag to revive/upgrade your router's firmware.

Notes
=====

 * If you have issues with reliability of your connection, you can slow
   down the speed of _tjtag_ by using `/delay:N` command line option.
   `N` is the amount of time to delay flipping the clock signal. The
   higher the value, the slower the transfer rate.
 * Due to bit-banging nature of the operation of tjtag, various things
   affect the transfer speed. The one with most degrading effect is the
   progress output. Therefore it is recommended to use `/silent` command
   line option and redirect outputs to `/dev/null` (ie using
   `&> /dev/null`), after having made sure everything works OK.

[jumper]: http://www.seeedstudio.com/depot/1-pin-dualfemale-jumper-wire-100mm-50pcs-pack-p-260.html?cPath=44
[tjtag]: http://sourceforge.net/projects/tjtag/
[pi]: http://www.raspberrypi.org/
