//
//  File.swift
//  
//
//  Created by Castor Mann on 2024-05-30.
//

import Foundation

@available(macOS 13.0, *)
@available(iOS 16.0, *)
public class OpeningBids {
    public static let System: BiddingSystem = BiddingSystem.parseText(text: """

1C:12-21 hcp clubs>2 and clubs>diamonds clubs>hearts clubs> spades or spades<5 hearts<5 diamonds<4:minst 3 klöver och 12-21 hp
1D:12-21 hcp and shape 4432 or diamonds>3 and diamonds>hearts diamonds>spades diamonds>=clubs or hearts<5 spades<5 clubs<5:minst 3 ruter och 12-21 hp
1H:12-21 hcp hearts>4 and hearts>=diamonds hearts>=clubs hearts>spades:minst 5 hjärter och 12-21 hp
1S:12-21 hcp spades>4 and spades>=hearts spades>=diamonds spades>=clubs:minst 5 spader och 12-21 hp
1N:15-17 hcp bal[P10]:15-17 hp, jämn hand
2C:hcp>21:enda krav, minst 22 hp
2D:6-10 hcp diamonds=6 hearts<4 spades<4 clubs<5:spärrbud, 6-10 hp och 6 ruter
2H:6-10 hcp hearts=6 spades<4 clubs<5 diamonds<5:spärrbud, 6-10 hp och 6 hjärter
2S:6-10 hcp spades=6 hearts<4 clubs<5 diamonds<5:spärrbud, 6-10 hp och 6 spader
2N:20-21 hcp bal:20-21 hp, jämn hand
3C:6-10 hcp clubs=7 hearts<4 spades<4 diamonds<5:spärrbud, 6-10 hp och 7 klöver
3D:6-10 hcp diamonds=7 hearts<4 spades<4 clubs<5:spärrbud, 6-10 hp och 7 ruter
3H:6-10 hcp hearts=7 spades<4 clubs<5 diamonds<5:spärrbud, 6-10 hp och 7 hjärter
3S:6-10 hcp spades=7 hearts<4 clubs<5 diamonds<5:spärrbud, 6-10 hp och 7 spader

4C:6-10 hcp clubs=8 hearts<4 spades<4 diamonds<5:spärrbud, 6-10 hp och 8 klöver
4D:6-10 hcp diamonds=8 hearts<4 spades<4 clubs<5:spärrbud, 6-10 hp och 8 ruter
4H:6-10 hcp hearts>7 spades<4 clubs<5 diamonds<5:spärrbud, 6-10 hp och 8 hjärter
4S:6-10 hcp spades>7 hearts<4 clubs<5 diamonds<5:spärrbud, 6-10 hp och 8 spader

""")
}



