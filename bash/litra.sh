# add command line shortcuts for Logitech Litra Glow
#
# references:
# https://ultracrepidarian.phfactor.net/tag/mac/
# https://github.com/todbot/hidapitester

function _hid() {
  /usr/local/bin/hidapitester --vidpid 046D/C900 --open --length 20 --send-output $1
}

function litra_on() {
  _hid 0x11,0xff,0x04,0x1c,0x01
}

function litra_off() {
  _hid 0x11,0xff,0x04,0x1c
}