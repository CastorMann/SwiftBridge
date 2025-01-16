//
//  OneOverOne.swift
//  Bridge
//
//  Created by Castor Mann on 2024-11-27.
//


@available(macOS 13.0, *)
@available(iOS 16.0, *)
public class OneOverOne {
    public static let System: BiddingSystem = BiddingSystem.parseText(text: """

1C-1D:hcp>5 diamonds>3 clubs<5 and hcp>11 diamonds>hearts diamonds>spades or hcp<12 hearts<4 spades<4:1 över 1, minst 6 hp och minst 4 ruter

1C-1D-1N:12-14 hcp bal diamonds<4:12-14 hp, jämn hand
1C-1D-1N-P:hcp<11 diamonds<6:minimum, 6-10 hp
1C-1D-1N-2N:11-12 hcp diamonds<6:invit, 11-12 hp
1C-1D-1N-2N-P:hcp<13:minimum, 12 hp
1C-1D-1N-2N-3N:hcp>12:tillägg, 13-14 hp
1C-1D-1N-3N:hcp>12:slutbud, minst 13 hp
1C-1D-2N:18-19 hcp bal diamonds<4:18-19 hp, jämn hand
1C-1D-2N-3N:hcp<15:slutbud, 6-14 hp
1C-1D-2N-6N:15-18 hcp:slutbud, 15-18 hp

1C-1D-2D:hcp<15 diamonds>3:minimum med trumfstöd, 12-14 hp och 4 ruter
1C-1D-2D-P:hcp<11:minimum, 6-10 hp
1C-1D-2D-3D:11-12 hcp:invit, 11-12 hp
1C-1D-2D-3D-P:hcp<13:minimum, 12 hp
1C-1D-2D-3D-3N:hcp>12:tillägg, 13-14 hp
1C-1D-2D-3N:hcp>12:slutbud, minsr 13 hp
1C-1D-3D:15-17 hcp diamonds>3:invit med trumfstöd, 15-17 hp och 4 ruter
1C-1D-3D-P:hcp<9:minimum, 6-8 hp
1C-1D-3D-3N:hcp>8:tillägg, minst 9 hp

1C-1D-1H:hcp<18 clubs>4 hearts>3:tvåfärgshand, minst 5 klöver och minst 4 hjärter, 12-17 hp
1C-1D-1S:hcp<18 clubs>4 spades>3 hearts<4:tvåfärgshand, minst 5 klöver och minst 4 spader, 12-17 hp
1C-1D-2H:hcp>17 clubs>4 hearts>3:tvåfärgshand, minst 5 klöver och minst 4 hjärter, 18-21 hp, utgångskrav
1C-1D-2S:hcp>17 clubs>4 spades>3:tvåfärgshand, minst 5 klöver och minst 4 spader, 18-21 hp, utgångskrav

1C-1D-2C::
1C-1D-3C::

1C-1H:hcp>5 hearts>3 and hearts=4 spades=4 or hearts>spades and hearts>=diamonds or hcp<12:1 över 1, minst 6 hp och minst 4 hjärter
1C-1S:hcp>5 spades>3 and hearts=4 spades>4 or spades>=hearts and spades>=diamonds or hcp<12:1 över 1, minst 6hp och minst 4 spader
1C-1N:6-11 hcp shape 3334:avböjande 1NT, 6-11 hp

1D-1H:hcp>5 hearts>3 and hearts=4 spades=4 or hearts>spades and hearts>=clubs or hcp<12:1 över 1, minst 6 hp och minst 4 hjärter
1D-1S:hcp>5 spades>3 and hearts=4 spades>4 or spades>=hearts and spades>=clubs or hcp<12:1 över 1, minst 6 hp och minst 4 spader
1D-1N:6-11 hcp hearts<4 spades<4 diamonds<5:avböjande 1NT, 6-11 hp

1H-1S:hcp>5 hearts<3 spades>3 and spades>=clubs spades>= diamond or hcp<12:1 över 1, minst 6 hp och minst 4 spader
1H-1N:6-11 hcp hearts<3 spades<4:avböjande 1NT, 6-11 hp

1S-1N:6-11 hp spades<3:avböjande 1NT, 6-11 hp



""")
}
