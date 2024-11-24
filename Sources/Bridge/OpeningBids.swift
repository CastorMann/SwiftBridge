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
1N:15-17 hcp bal:15-17 hp, jämn hand
1N-2N:hcp=9 spades<4 hearts<4:invit, 9hp
1N-3N:10-15 hcp spades<4 hearts<4:slutbud, 10-15 hp
""")
}

@available(macOS 13.0, *)
@available(iOS 16.0, *)
public class NTBidding {
    public static let System: BiddingSystem = BiddingSystem.parseText(text: """
P:0-11 hcp:0-11 hp
1N:15-17 hcp bal:15-17 hp, jämn hand

1N-P:hcp<9 spades<5 hearts<5:0-8 hp
1N-2C:hcp>7 spades=4 or hcp>7 hearts=4:högfärgsfråga
1N-2D:hearts>4:överföring, minst 5 hjärter
1N-2H:spades>4:överföring, minst 5 spader
1N-2N:hcp=9 spades<4 hearts<4:invit, 9hp
1N-3N:10-15 hcp spades<4 hearts<4:slutbud, 10-15 hp
1N-4N:16-17 hcp spades<4 hearts<4:kvantitativ slaminvit, 16-18 hp
1N-5N:20-21 hcp spades<4 hearts<4:kvantitativ storslamsinvit, 20-21 hp
1N-6N:18-19 hcp spades<4 hearts<4:slutbud, 18-19 hp
1N-7N:hcp>21:slutbud, minst 22 hp

1N-2N-P:hcp=15:minimum, 15 hp
1N-2N-3N:hcp>15:tillägg, 16-17 hp

1N-2C-2D:spades<4 hearts<4:ingen högfärg
1N-2C-2H:hearts>3:minst 4 hjärter
1N-2C-2S:spades>3:minst 4 spader

1N-2C-2D-2N:8-9 hcp:invit, 8-9 hp
1N-2C-2D-3N:10-15 hcp: slutbud, 10-15 hp
1N-2C-2D-4N:16-17 hcp:kvantitativ slaminvit, 16-18 hp
1N-2C-2D-5N:20-21 hcp:kvantitativ storslamsinvit, 20-21 hp
1N-2C-2D-6N:18-19 hcp:slutbud, 18-19 hp

1N-2C-2H-2N:8-9 hcp hearts<4:invit, 8-9 hp och 4 spader
1N-2C-2H-3N:10-15 hcp hearts<4:förslag till slutbud, 10-15 hp och 4 spader
1N-2C-2H-4N:16-17 hcp hearts<4:kvantitativ invit, 16-17 hp och 4 spader
1N-2C-2H-5N:20-21 hcp hearts<4:kvantitativ storslamsinvit, 20-21 hp och 4 spader
1N-2C-2H-6N:18-19 hcp hearts<4: slutbud, 18-19 hp och 4 spader
1N-2C-2H-3H:8-9 hcp hearts>3:invit, 8-9 stp med trumfstöd
1N-2C-2H-4H:10-15 hcp hearts>3:slutbud, 10-15 stp med trumfstöd

1N-2C-2S-2N:8-9 hcp spades<4:invit, 8-9 hp och 4 hjärter
1N-2C-2S-3N:10-15 hcp spades<4:förslag till slutbud, 10-15 hp och 4 hjärter
1N-2C-2S-4N:16-17 hcp spades<4:kvantitativ invit, 16-17 hp och 4 hjärter
1N-2C-2S-5N:20-21 hcp spades<4:kvantitativ storslamsinvit, 20-21 hp och 4 hjärter
1N-2C-2S-6N:18-19 hcp spades<4: slutbud, 18-19 hp och 4 hjärter
1N-2C-2S-3S:8-9 hcp spades>3:invit, 8-9 stp med trumfstöd
1N-2C-2S-4S:10-15 hcp spades>3:slutbud, 10-15 stp med trumfstöd

1N-2C-2D-2N-P:hcp=15:minimum, 15 hp
1N-2C-2D-2N-3N:hcp>15:tillägg, 16-17 hp

1N-2C-2H-2N-P:hcp=15 spades<4:minimum, 15 hp
1N-2C-2H-2N-3N:hcp>15 spades<4:tillägg, 16-17 hp
1N-2C-2H-2N-3S:hcp=15 spades>3:minimum med stöd. 15-16 stp och 4 spader
1N-2C-2H-2N-4S:hcp>16 spades>3:tillägg med stöd. minst 17 stp och 4 spader
1N-2C-2H-2N-3S-4S:hcp=9:slutbud, minst 10 stp

1N-2C-2S-2N-P:hcp=15 spades<4:minimum, 15 hp
1N-2C-2S-2N-3N:hcp>15 spades<4:tillägg, 16-17 hp

1N-2D-2H::överföring accepterad, måste bjudas
1N-2H-2S::överföring accepterad, måste bjudas

1N-2D-2H-P:0-7 hcp:avlägg, 0-7 hp
1N-2D-2H-2N:8-9 hcp hearts=5:invit, 8-9 hp och exakt 5 hjärter
1N-2D-2H-2N-P:hcp=15 hearts=2:avlägg, 15 hp och exakt 2 hjärter
1N-2D-2H-2N-3N:hcp>15 hearts=2:tillägg, 16-17 hp och exakt 2 hjärter
1N-2D-2H-2N-3H:hcp=15 hearts>2:minimum med stöd, 15-16 stp och minst 3 hjärter
1N-2D-2H-2N-3H-4H:hcp=9:slutbud, minst 10 stp
1N-2D-2H-2N-4H:hcp>15 hearts>2:tillägg med stöd, minst 17 stp och minst 3 hjärter
1N-2D-2H-3N:10-15 hcp hearts=5:förslag till slutbud, 10-15 hp och exakt 5 hjärter
1N-2D-2H-3H:7-8 hcp hearts>5:invit, 8-9 stp och minst 6 hjärter
1N-2D-2H-3H-P:hcp=15:minimum, 15-16 stp
1N-2D-2H-3H-4H:hcp>15:tillägg, minst 17 stp
1N-2D-2H-4H:9-14 hcp hearts>5:slutbud, 10-15 stp och minst 6 hjärter

1N-2H-2S-P:0-7 hcp:avlägg, 0-7 hp
1N-2H-2S-2N:8-9 hcp spades=5:invit, 8-9 hp och exakt 5 spader
1N-2H-2S-2N-P:hcp=15 spades=2:avlägg, 15 hp och exakt 2 spader
1N-2H-2S-2N-3N:hcp>15 spades=2:tillägg, 16-17 hp och exakt 2 spader
1N-2H-2S-2N-3S:hcp=15 spades>2:minimum med stöd, 15-16 stp och minst 3 spader
1N-2H-2S-2N-3S-4H:hcp=9:slutbud, minst 10 stp
1N-2H-2S-2N-4S:hcp>15 spades>2:tillägg med stöd, minst 17 stp och minst 3 spader
1N-2H-2S-3N:10-15 hcp spades=5:förslag till slutbud, 10-15 hp och exakt 5 spader
1N-2H-2S-3S:7-8 hcp spades>5:invit, 8-9 stp och minst 6 spader
1N-2H-2S-3S-P:hcp=15:minimum, 15-16 stp
1N-2H-2S-3S-4S:hcp>15:tillägg, minst 17 stp
1N-2H-2S-4S:9-14 hcp spades>5:slutbud, 10-15 stp och minst 6 spader

""")
}
