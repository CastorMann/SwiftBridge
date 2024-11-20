# ````

Summary

## Overview

Text

## Topics

### Group

- ``Symbol``


### File Formats

- ``.deals``

The .deals format is the most simple representation of a set of deals. 
The file contains 0 or more deals. Each deal consisting of 4 hands, 
north, east, south and west. Each hand containing 0 to 52 cards. 
Generally most deals will contain a 'complete' deal with each hand 
holding exactly 13 cards and no hands holding the same card, however 
endpositions with fewer then 13 cards in each hand could also 
realistically occur. Each deal is represented by exaclty 32 bytes in
the file, 8 bytes for each hand, in order NESW. Each 8-byte section
should be interpreted as a Little-Endian 64-bit unsigned integer. Bits 
0-51 in this integer determine if the hand is holding aspecific card. 
The LSB represents the 2 of clubs and bit 51 represents the ace of 
spades. The rest of the bits represents the cards in logical order.

- ``.dx``

The .dx (deals extended) format is a slightly more information dense 
representation of a set of deals, including not only the hands, but 
data for the auction and play. The file contains 0 or more deals, each
consisting of a single byte descriving the deal number, followed by a 
deal in the same format as in the .deals file format (32 bytes), and a
variable amount of bytes for both the auction and the play, separated 
and ended by 0xFF byte. The 32 byte deal is followed by 0 or more bytes
describing the auction, followed by a termination byte (0xFF). Each 
byte in the sequence describes one single bid in the following way:

    BID_BYTE = (BID_LEVEL << 5) | (1 << BID_SUIT)

where the bid suit is a value between 0 and 4 (inclusive), in the order
CDHSN (C = 0, N = 4).

So, for example the bid 4 hearts is represented by 132 becasue:
    
    BID_4_HEARTS = 
            (4 << 5) | (1 << 2) = 
            (0b100 << 5) | (0b1 << 2) =
            0b10000000 | 0b100 =
            0b10000100 =
            132

Non-strain bids are represented as follows: Pass = 1, Double = 2, 
Redouble = 4.

After the terminating 0xFF byte, between 0 and 52 bytes follow, each 
represeting a played card. Cards are represented by numbers from 0 to 
51 (inclusive). 2 of clubs is represented by 0 and the ace of spades is
represented by 51. The rest are in logical order. The whole sequence is
terminated by a 0xFF byte.
