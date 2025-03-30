#!/bin/bash

# Human Readable Chars: 00: none, 01: above, 02: below, 03: both
# Width: 0x02 through 0x06
# Height: 0x01 through 0xFF
# Type:
#   0x00: UPC-A
#   0x01: UPC-E
#   0x02: EAN-13
#   0x03: EAN-8
#   0x04: CODE39
#   0x05: ITF
#   0x06: CODABAR NW-7

echo -e "\x1b@\
\x1dH\x02\
\x1dw\x03\
\x1dh\x50\
\x1dk\x06\
ABCD\x00\
\n\n\n
" | lp -d $1
