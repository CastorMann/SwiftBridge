//
//  TrumpSupport.swift
//  Bridge
//
//  Created by Castor Mann on 2024-11-27.
//


@available(macOS 13.0, *)
@available(iOS 16.0, *)
public class TrumpSupport {
    public static let System: BiddingSystem = BiddingSystem.parseText(text: """

1C-2C:6-10 hcp clubs>4 hearts<4 spades<4:enkelhöjning, 6-10 hp och minst 5 klöver
1C-3C:11-12 hcp clubs>4 hearts<4 spades<4:dubbelhöjning, 11-12 hp och minst 5 klöver

1D-2D:6-10 hcp diamonds>4 hearts<4 spades<4:enkelhöjning, 6-10 hp och minst 5 ruter
1D-3D:11-12 hcp diamonds>4 hearts<4 spades<4:dubbelhöjning, 11-12 hp och minst 5 ruter

1H-2H:6-10 stp(hearts, 3) hearts>2:enkelhöjning, 6-10 stp och minst 3 hjärter
1H-3H:11-12 stp(hearts, 3) hearts>2:dubbelhöjning, 11-12 stp och minst 3 hjärter

1H-2H:6-10 stp(spades, 3) spades>2:enkelhöjning, 6-10 stp och minst 3 spader
1H-3H:11-12 stp(spades, 3) spades>2:dubbelhöjning, 11-12 stp och minst 3 spader

1C-2C-P:hcp<15:minimum, 12-14 hp
1C-2C-3C:15-17 hcp: invit, 15-17 hp
1C-2C-3C-P:hcp<9:minimum, 6-8 hp
1C-2C-3C-3N:9-10 hcp:maximum, 9-10 hp
1C-2C-3N:hcp>18:slutbud, minst 18 hp
1C-3C-P:hcp<14:minimum, 12-13 hp
1C-3C-3N:hcp>13:tillägg, minst 14 hp

1D-2D-P:hcp<15:minimum, 12-14 hp
1D-2D-3D:15-17 hcp: invit, 15-17 hp
1D-2D-3D-P:hcp<9:minimum, 6-8 hp
1D-2D-3D-3N:9-10 hcp:maximum, 9-10 hp
1D-2D-3N:hcp>18:slutbud, minst 18 hp
1D-3D-P:hcp<14:minimum, 12-13 hp
1D-3D-3N:hcp>13:tillägg, minst 14 hp

1H-2H-P:stp(hearts, 5)<16:minimum, 12-15 stp
1H-2H-3H:16-18 stp(hearts, 5): invit, 16-18 stp
1H-2H-3H-P:stp(hearts, 3)<9:minimum, 6-8 stp
1H-2H-3H-4H:stp(hearts, 3)>8:miximum, 9-10 stp
1H-2H-4H:stp(hearts, 5)>18:slutbud, minst 19 stp
1H-3H-P:stp(hearts, 5)<15:minimum, 12-14 stp
1H-3H-4H:stp(hearts, 5)>14:tillägg, minst 15 stp

1S-2S-P:stp(spades, 5)<16:minimum, 12-15 stp
1S-2S-3S:16-18 stp(spades, 5): invit, 16-18 stp
1S-2S-3S-P:stp(spades, 3)<9:minimum, 6-8 stp
1S-2S-3S-4S:stp(spades, 3)>8:miximum, 9-10 stp
1S-2S-4S:stp(spades, 5)>18:slutbud, minst 19 stp
1S-3S-P:stp(spades, 5)<15:minimum, 12-14 stp
1S-3S-4S:stp(spades, 5)>14:tillägg, minst 15 stp

""")
}
