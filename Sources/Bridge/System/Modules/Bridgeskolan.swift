//
//  Bridgeskolan.swift
//  Bridge
//
//  Created by Castor Mann on 2024-11-25.
//


@available(macOS 13.0, *)
@available(iOS 16.0, *)
public class Bridgeskolan {
    public static let System: BiddingSystem = BiddingSystem.parseText(text: """
1C:12-21 hcp clubs>2 and clubs>diamonds clubs>hearts clubs>spades or spades<5 hearts<5 diamonds<4:12-21 hp och minst 3♣️
1C-P::
1C-P-P:hcp<6:0-5 hp
1C-P-1D:hcp>5 diamonds>3 clubs<5 and hcp>11 diamonds>hearts diamonds>spades or hcp<12 hearts<4 spades<4:1 över 1, minst 6 hp och minst 4♦️
1C-P-1D-P-1H:12-17 hcp clubs>4 hearts>3:Tvåfärgshand, minst 5♣️ och minst 4♥️ och 12-17 hp
1C-P-1D-P-1H-P-4H:stp(hearts, 4)>12 hearts>3:Trumfstöd, minst 4♥️ och minst 13 stp
1C-P-1D-P-1S:12-17 hcp clubs>4 spades>3:Tvåfärgshand, minst 5♣️ och minst 4♠️ och 12-17 hp
1C-P-1D-P-1S-P-4S:stp(spades, 4)>12 spades>3:Trumfstöd, minst 4♠️ och minst 13 stp
1C-P-1D-P-1NT:12-14 hcp bal:Jämn hand, 12-14 hp
1C-P-1D-P-1NT-P-P:6-10 hcp:6-10 hp
1C-P-1D-P-1NT-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1C-P-1D-P-2C:12-14 hcp clubs>5:Enfärgshand, minst 6♣️ och 12-14 hp
1C-P-1D-P-2C-P-P:6-10 hcp:6-10 hp
1C-P-1D-P-2C-P-2NT:11-12 hcp clubs<2:Invit, 11-12 hp och max 1♣️
1C-P-1D-P-2C-P-2NT-P-P:hcp<13:12 hp
1C-P-1D-P-2C-P-2NT-P-3NT:hcp>12:13-14hp
1C-P-1D-P-2C-P-3C:11-12 hcp clubs>1:Invit, 11-12 hp och minst 2♣️
1C-P-1D-P-2C-P-3C-P-P:hcp<13:12 hp
1C-P-1D-P-2C-P-3C-P-3NT:hcp>12:13-14hp
1C-P-1D-P-2C-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1C-P-1D-P-2D:hcp<15 diamonds>3:Trumfstöd, 12-14 hp och minst 4♦️
1C-P-1D-P-2D-P-P:hcp<11:minimum, 6-10 hp
1C-P-1D-P-2D-P-3NT:hcp>12:slutbud, minst 13 hp
1C-P-1D-P-2NT:18-19 hcp bal:Jämn hand, 18-19 hp
1C-P-1D-P-2NT-P-3NT:6-13 hcp:6-13 hp
1C-P-1D-P-3C:15-17 hcp clubs>5:Enfärgshand, minst 6♣️ och 15-17 hp
1C-P-1D-P-3C-P-P:hcp<9:6-8 hp
1C-P-1D-P-3C-P-3NT:9-15 hcp:Slutbud, 9-15 hp
1C-P-1H:hcp>5 hearts>3 and hearts=4 spades=4 or hearts>spades and hearts>=diamonds or hcp<12:1 över 1, minst 6 hp och minst 4♥️
1C-P-1H-P-1S:12-17 hcp clubs>4 spades>3:Tvåfärgshand, minst 5♣️ och minst 4♠️ och 12-17 hp
1C-P-1H-P-1S-P-4S:stp(spades, 4)>12 spades>3:Trumfstöd, minst 4♠️ och minst 13 stp
1C-P-1H-P-1NT:12-14 hcp bal:Jämn hand, 12-14 hp
1C-P-1H-P-1NT-P-P:6-10 hcp:6-10 hp
1C-P-1H-P-1NT-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1C-P-1H-P-2C:12-14 hcp clubs>5:Enfärgshand, minst 6♣️ och 12-14 hp
1C-P-1H-P-2C-P-P:6-10 hcp:6-10 hp
1C-P-1H-P-2C-P-2NT:11-12 hcp clubs<2:Invit, 11-12 hp och max 1♣️
1C-P-1H-P-2C-P-2NT-P-P:hcp<13:12 hp
1C-P-1H-P-2C-P-2NT-P-3NT:hcp>12:13-14hp
1C-P-1H-P-2C-P-3C:11-12 hcp clubs>1:Invit, 11-12 hp och minst 2♣️
1C-P-1H-P-2C-P-3C-P-P:hcp<13:12 hp
1C-P-1H-P-2C-P-3C-P-3NT:hcp>12:13-14hp
1C-P-1H-P-2C-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1C-P-1H-P-2H:12-15 stp(hearts, 4) hearts>3:Trumfstöd, 12-15 stp och minst 4♥️
1C-P-1H-P-2H-P-P:6-10 stp(hearts, 4):6-10 stp
1C-P-1H-P-2H-P-3H:11-12 stp(hearts, 4):Invit, 11-12 stp
1C-P-1H-P-2H-P-3H-P-P:12-13 stp(hearts, 4):12-13 stp
1C-P-1H-P-2H-P-3H-P-4H:stp(hearts, 4)>13:14-15 stp
1C-P-1H-P-2H-P-4H:13-18 stp(hearts, 4):slutbud, 13-18 stp
1C-P-1H-P-2NT:18-19 hcp bal:Jämn hand, 18-19 hp
1C-P-1H-P-2NT-P-3NT:6-13 hcp:6-13 hp
1C-P-1H-P-2NT-P-4H:6-13 stp(hearts, 6) hearts>5:Slutbud, 6-13 stp och minst 6♥️
1C-P-1H-P-3C:15-17 hcp clubs>5:Enfärgshand, minst 6♣️ och 15-17 hp
1C-P-1H-P-3C-P-P:hcp<9:6-8 hp
1C-P-1H-P-3C-P-3NT:9-15 hcp:Slutbud, 9-15 hp
1C-P-1H-P-3H:16-18 stp(hearts, 4) hearts>3:Trumfstöd, 16-18 stp och minst 4♥️
1C-P-1H-P-3H-P-P:stp(hearts, 4)<9:6-8 stp
1C-P-1H-P-3H-P-4H:9-14 stp(hearts, 4):Slutbud, 9-14 stp
1C-P-1H-P-4H:stp(hearts, 4)>18 hearts>3:Trumfstöd, minst 19 stp och minst 4♥️
1C-P-1S:hcp>5 spades>3 and hearts=4 spades>4 or spades>=hearts and spades>=diamonds or hcp<12:1 över 1, minst 6hp och minst 4♠️
1C-P-1S-P-1NT:12-14 hcp bal:Jämn hand, 12-14 hp
1C-P-1S-P-1NT-P-P:6-10 hcp:6-10 hp
1C-P-1S-P-1NT-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1C-P-1S-P-2C:12-14 hcp clubs>5:Enfärgshand, minst 6♣️ och 12-14 hp
1C-P-1S-P-2C-P-P:6-10 hcp:6-10 hp
1C-P-1S-P-2C-P-2NT:11-12 hcp clubs<2:Invit, 11-12 hp och max 1♣️
1C-P-1S-P-2C-P-2NT-P-P:hcp<13:12 hp
1C-P-1S-P-2C-P-2NT-P-3NT:hcp>12:13-14hp
1C-P-1S-P-2C-P-3C:11-12 hcp clubs>1:Invit, 11-12 hp och minst 2♣️
1C-P-1S-P-2C-P-3C-P-P:hcp<13:12 hp
1C-P-1S-P-2C-P-3C-P-3NT:hcp>12:13-14hp
1C-P-1S-P-2C-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1C-P-1S-P-2S:12-15 stp(spades, 4) spades>3:Trumfstöd, 12-15 stp och minst 4♠️
1C-P-1S-P-2S-P-P:6-10 stp(spades, 4):6-10 stp
1C-P-1S-P-2S-P-3S:11-12 stp(spades, 4):Invit, 11-12 stp
1C-P-1S-P-2S-P-3S-P-P:12-13 stp(spades, 4):12-13 stp
1C-P-1S-P-2S-P-3S-P-4S:stp(spades, 4)>13:14-15 stp
1C-P-1S-P-2S-P-4S:13-18 stp(spades, 4):slutbud, 13-18 stp
1C-P-1S-P-2NT:18-19 hcp bal:Jämn hand, 18-19 hp
1C-P-1S-P-2NT-P-3NT:6-13 hcp:6-13 hp
1C-P-1S-P-2NT-P-4S:6-13 stp(spades, 6) spades>5:Slutbud, 6-13 stp och minst 6♠️
1C-P-1S-P-3C:15-17 hcp clubs>5:Enfärgshand, minst 6♣️ och 15-17 hp
1C-P-1S-P-3C-P-P:hcp<9:6-8 hp
1C-P-1S-P-3C-P-3NT:9-15 hcp:Slutbud, 9-15 hp
1C-P-1S-P-3S:16-18 stp(spades, 4) spades>3:Trumfstöd, 16-18 stp och minst 4♠️
1C-P-1S-P-3S-P-P:stp(spades, 4)<9:6-8 stp
1C-P-1S-P-3S-P-4S:9-14 stp(spades, 4):Slutbud, 9-14 stp
1C-P-1S-P-4S:stp(spades, 4)>18 spades>3:Trumfstöd, minst 19 stp och minst 4♠️
1C-P-1NT:6-11 hcp:Avböjande 1NT, 6-11 hp
1C-P-1NT-P-P:12-14 hcp bal:Jämn hand och 12-14 hp
1C-P-1NT-P-2C:12-14 hcp clubs>5:Enfärgshand, minst 6♣️ och 12-14 hp
1C-P-1NT-P-2C-P-P:6-10 hcp:6-10 hp
1C-P-1NT-P-2C-P-2NT:11-12 hcp clubs<2:Invit, 11-12 hp och max 1♣️
1C-P-1NT-P-2C-P-2NT-P-P:hcp<13:12 hp
1C-P-1NT-P-2C-P-2NT-P-3NT:hcp>12:13-14hp
1C-P-1NT-P-2C-P-3C:11-12 hcp clubs>1:Invit, 11-12 hp och minst 2♣️
1C-P-1NT-P-2C-P-3C-P-P:hcp<13:12 hp
1C-P-1NT-P-2C-P-3C-P-3NT:hcp>12:13-14hp
1C-P-1NT-P-2C-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1C-P-1NT-P-2NT:18-19 hcp bal:Jämn hand, 18-19 hp
1C-P-1NT-P-2NT-P-3NT:6-13 hcp:6-13 hp
1C-P-1NT-P-3C:15-17 hcp clubs>5:Enfärgshand, minst 6♣️ och 15-17 hp
1C-P-1NT-P-3C-P-P:hcp<9:6-8 hp
1C-P-1NT-P-3C-P-3NT:9-15 hcp:Slutbud, 9-15 hp
1C-P-2C:6-10 hcp clubs>4:6-10 hp och minst 5♣️
1C-P-2C-P-P:hcp<16:12-15 hp
1C-P-2C-P-3NT:hcp>17:18-21 hp
1C-P-3C:11-12 hcp clubs>4:11-12 hp och minst 5♣️
1C-P-3C-P-P:hcp<14:12-13 hp
1C-P-3C-P-3NT:hcp>13:minst 14 hp
1C-1D:10-16 hcp diamonds>4:Inkliv, 10-16 hp och minst 5♦️
1C-1D-P::
1C-1D-P-2D:6-10 hcp diamonds>2:Enkelhöjning, 6-10 hp och minst 3♦️
1C-1D-P-3D:11-12 hcp diamonds>2:Dubbelhöjning, 11-12 hp och minst 3♦️
1C-1D-P-3D-P::
1C-1D-P-3D-P-3NT:14-16 hcp:Slutbud, 14-16 hp
1C-1D-P-3NT:hcp>12:Slutbud, minst 13 hp
1C-1H:10-16 hcp hearts>4 hearts>spades hearts>=diamonds:Inkliv, 10-16 hp och minst 5♥️
1C-1H-P::
1C-1H-P-2H:6-10 stp(hearts, 3) hearts>2:Enkelhöjning, 6-10 stp och minst 3♥️
1C-1H-P-2H-P::
1C-1H-P-2H-P-4H:stp(hearts, 5)>18:Slutbud, minst 19 stp
1C-1H-P-3H:11-12 stp(hearts, 3) hearts>2:Dubbelhöjning, 11-12 stp och minst 3 ♥️
1C-1H-P-3H-P::
1C-1H-P-3H-P-4H:14-17 stp(hearts, 5):Slutbud, 14-17 stp
1C-1H-P-4H:stp(hearts, 3)>12 hearts>2:Slutbud, minst 13 stp och minst 3♥️
1C-1S:10-16 hcp spades>4 spades>=hearts spades>=diamonds:Inkliv, 10-16 hp och minst 5♠️
1C-1S-P::
1C-1S-P-2S:6-10 stp(spades, 3) spades>2:Enkelhöjning, 6-10 stp och minst 3♠️
1C-1S-P-2S-P-4S:stp(spades, 5)>18:Slutbud, minst 19 stp
1C-1S-P-3S:11-12 stp(spades, 3) spades>2:Dubbelhöjning, 11-12 stp och minst 3 ♠️
1C-1S-P-3S-P-4S:14-17 stp(spades, 5):Slutbud, 14-17 stp
1C-1S-P-4S:stp(spades, 3)>12 spades>2:Slutbud, minst 13 stp och minst 3♠️
1C-1NT:15-17 hcp bal stopper(clubs):Jämn hand och 15-17 hp med håll i ♣️
1C-1NT-P::
1C-1NT-P-P:0-8 hcp:0-8 hp
1C-1NT-P-2NT:hcp=9:Invit, 9 hp
1C-1NT-P-2NT-P:hcp=15:Minimum, 15 hp
1C-1NT-P-2NT-3NT:16-17 hcp:Tillägg, 16-17 hp
1C-1NT-P-3NT:10-15 hcp:10-15 hp
1D:12-21 hcp and shape 4432 or diamonds>3 and diamonds>hearts diamonds>spades diamonds>=clubs or hearts<5 spades<5 clubs<5:12-21 hp och minst 3♦️
1D-P-P:hcp<6:0-5 hp
1D-P-1H:hcp>5 hearts>3 and hearts=4 spades=4 or hearts>spades and hearts>=clubs or hcp<12:1 över 1, minst 6 hp och minst 4♥️
1D-P-1H-P-1S:12-17 hcp diamonds>4 spades>3:Tvåfärgshand, minst 5♦️ och minst 4♠️ och 12-17 hp
1D-P-1H-P-1S-P-4S:stp(spades, 4)>12 spades>3:Trumfstöd, minst 4♠️ och minst 13 stp
1D-P-1H-P-1NT:12-14 hcp bal:Jämn hand, 12-14 hp
1D-P-1H-P-1NT-P-P:6-10 hcp:6-10 hp
1D-P-1H-P-1NT-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1D-P-1H-P-2C:12-17 hcp diamonds>4 clubs>3:Tvåfärgshand, minst 5♦️ och minst 4♣️ och 12-17 hp
1D-P-1H-P-2D:12-14 hcp diamonds>5:Enfärgshand, minst 6♦️ och 12-14 hp
1D-P-1H-P-2D-P-P:6-10 hcp:6-10 hp
1D-P-1H-P-2D-P-2NT:11-12 hcp diamonds<2:Invit, 11-12 hp och max 1♦️
1D-P-1H-P-2D-P-2NT-P-P:hcp<13:12 hp
1D-P-1H-P-2D-P-2NT-P-3NT:hcp>12:13-14hp
1D-P-1H-P-2D-P-3D:11-12 hcp diamonds>1:Invit, 11-12 hp och minst 2♦️
1D-P-1H-P-2D-P-3D-P-P:hcp<13:12 hp
1D-P-1H-P-2D-P-3D-P-3NT:hcp>12:13-14hp
1D-P-1H-P-2D-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1D-P-1H-P-2H:12-15 stp(hearts, 4) hearts>3:Trumfstöd, 12-15 stp och minst 4♥️
1D-P-1H-P-2H-P-P:6-10 stp(hearts, 4):6-10 stp
1D-P-1H-P-2H-P-3H:11-12 stp(hearts, 4):Invit, 11-12 stp
1D-P-1H-P-2H-P-3H-P-P:12-13 stp(hearts, 4):12-13 stp
1D-P-1H-P-2H-P-3H-P-4H:stp(hearts, 4)>13:14-15 stp
1D-P-1H-P-2H-P-4H:13-18 stp(hearts, 4):Slutbud, 13-18 stp
1D-P-1H-P-2NT:18-19 hcp bal:Jämn hand, 18-19 hp
1D-P-1H-P-2NT-P-3NT:6-13 hcp:6-13 hp
1D-P-1H-P-2NT-P-4H:6-13 stp(hearts, 6) hearts>5:Slutbud, 6-13 stp och minst 6♥️
1D-P-1H-P-3D:15-17 hcp diamonds>5:Enfärgshand, minst 6♦️ och 15-17 hp
1D-P-1H-P-3D-P-P:hcp<9:6-8 hp
1D-P-1H-P-3D-P-3NT:9-15 hcp:Slutbud, 9-15 hp
1D-P-1H-P-3H:16-18 stp(hearts, 4) hearts>3:Trumfstöd, 16-18 stp och minst 4♥️
1D-P-1H-P-3H-P-P:stp(hearts, 4)<9:6-8 stp
1D-P-1H-P-3H-P-4H:9-14 stp(hearts, 4):Slutbud, 9-14 stp
1D-P-1H-P-4H:stp(hearts, 4)>18 hearts>3:Trumfstöd, minst 19 stp och minst 4♥️
1D-P-1S:hcp>5 spades>3 and hearts=4 spades>4 or spades>=hearts and spades>=clubs or hcp<12:1 över 1, minst 6 hp och minst 4♠️
1D-P-1S-P-1NT:12-14 hcp bal:Jämn hand, 12-14 hp
1D-P-1S-P-1NT-P-P:6-10 hcp:6-10 hp
1D-P-1S-P-1NT-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1D-P-1S-P-2C:12-17 hcp diamonds>4 clubs>3:Tvåfärgshand, minst 5♦️ och minst 4♣️ och 12-17 hp
1D-P-1S-P-2D:12-14 hcp diamonds>5:Enfärgshand, minst 6♦️ och 12-14 hp
1D-P-1S-P-2D-P-P:6-10 hcp:6-10 hp
1D-P-1S-P-2D-P-2NT:11-12 hcp diamonds<2:Invit, 11-12 hp och max 1♦️
1D-P-1S-P-2D-P-2NT-P-P:hcp<13:12 hp
1D-P-1S-P-2D-P-2NT-P-3NT:hcp>12:13-14hp
1D-P-1S-P-2D-P-3D:11-12 hcp diamonds>1:Invit, 11-12 hp och minst 2♦️
1D-P-1S-P-2D-P-3D-P-P:hcp<13:12 hp
1D-P-1S-P-2D-P-3D-P-3NT:hcp>12:13-14hp
1D-P-1S-P-2D-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1D-P-1S-P-2S:12-15 stp(spades, 4) spades>3:Trumfstöd, 12-15 stp och minst 4♠️
1D-P-1S-P-2S-P-P:6-10 stp(spades, 4):6-10 stp
1D-P-1S-P-2S-P-3S:11-12 stp(spades, 4):Invit, 11-12 stp
1D-P-1S-P-2S-P-3S-P-P:12-13 stp(spades, 4):12-13 stp
1D-P-1S-P-2S-P-3S-P-4S:stp(spades, 4)>13:14-15 stp
1D-P-1S-P-2S-P-4S:13-18 stp(spades, 4):Slutbud, minst 13 stp
1D-P-1S-P-2NT:18-19 hcp bal:Jämn hand, 18-19 hp
1D-P-1S-P-2NT-P-3NT:6-13 hcp:6-13 hp
1D-P-1S-P-2NT-P-4S:6-13 stp(spades, 6) spades>5:Slutbud, 6-13 stp och minst 6♠️
1D-P-1S-P-3D:15-17 hcp diamonds>5:Enfärgshand, minst 6♦️ och 15-17 hp
1D-P-1S-P-3D-P-P:hcp<9:6-8 hp
1D-P-1S-P-3D-P-3NT:9-15 hcp:Slutbud, 9-15 hp
1D-P-1S-P-3S:16-18 stp(spades, 4) spades>3:Trumfstöd, 16-18 stp och minst 4♠️
1D-P-1S-P-3S-P-P:stp(spades, 4)<9:6-8 stp
1D-P-1S-P-3S-P-4S:9-14 stp(spades, 4):Slutbud, 9-14 stp
1D-P-1S-P-4S:stp(spades, 4)>18 spades>3:Trumfstöd, minst 19 stp och minst 4♠️
1D-P-1NT:6-11 hcp:Avböjande 1NT, 6-11 hp
1D-P-1NT-P-P:12-14 hcp bal:Jämn hand och 12-14 hp
1D-P-1NT-P-2C:12-17 hcp diamonds>4 clubs>3:Tvåfärgshand, minst 5♦️ och minst 4♣️ och 12-17 hp
1D-P-1NT-P-2D:12-14 hcp diamonds>5:Enfärgshand, minst 6♦️ och 12-14 hp
1D-P-1NT-P-2D-P-P:6-10 hcp:6-10 hp
1D-P-1NT-P-2D-P-2NT:11-12 hcp diamonds<2:Invit, 11-12 hp och max 1♦️
1D-P-1NT-P-2D-P-2NT-P-P:hcp<13:12 hp
1D-P-1NT-P-2D-P-2NT-P-3NT:hcp>12:13-14hp
1D-P-1NT-P-2D-P-3D:11-12 hcp diamonds>1:Invit, 11-12 hp och minst 2♦️
1D-P-1NT-P-2D-P-3D-P-P:hcp<13:12 hp
1D-P-1NT-P-2D-P-3D-P-3NT:hcp>12:13-14hp
1D-P-1NT-P-2D-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1D-P-1NT-P-2NT:18-19 hcp bal:Jämn hand, 18-19 hp
1D-P-1NT-P-2NT-P-3NT:6-13 hcp:6-13 hp
1D-P-1NT-P-3D:15-17 hcp diamonds>5:Enfärgshand, minst 6♦️ och 15-17 hp
1D-P-1NT-P-3D-P-P:hcp<9:6-8 hp
1D-P-1NT-P-3D-P-3NT:9-15 hcp:Slutbud, 9-15 hp
1D-P-2C:hcp>11 clubs>3 hearts<clubs spades<clubs diamonds<5:2 över 1, minst 12 hp och minst 4♣️. Utgångskrav
1D-P-2C-P-2D:diamonds>5:Enfärgshand, minst 6♦️
1D-P-2C-P-2D-P-3NT::Slutbud
1D-P-2C-P-2H:diamonds>=5 hearts>=4:Tvåfärgshand, minst 5♦️ och minst 4♥️
1D-P-2C-P-2H-P-4H:hearts>3:Trumfstöd, minst 4♥️
1D-P-2C-P-2S:diamonds>=5 spades>=4:Tvåfärgshand, minst 5♦️ och minst 4♠️
1D-P-2C-P-2S-P-4S:spades>3:Trumfstöd, minst 4♠️
1D-P-2C-P-2NT:12-14 hcp bal:Jämn hand och 12-14 hp
1D-P-2C-P-2NT-P-3NT::Slutbud
1D-P-2C-P-3C:clubs>3:Trumfstöd, minst 4♣️
1D-P-2C-P-3C-P-3NT::Slutbud
1D-P-2D:6-10 hcp diamonds>4:6-10 hp och minst 5♦️
1D-P-2D-P-P:hcp<16:12-15 hp
1D-P-2D-P-3NT:18-21 hcp:18-21 hp
1D-P-3D:11-12 hcp diamonds>4:11-12 hp och minst 5♦️
1D-P-3D-P-P:hcp<14:12-13 hp
1D-P-3D-P-3NT:hcp>13:minst 14 hp
1D-1H:10-16 hcp hearts>4 hearts>spades hearts>=clubs:Inkliv, 10-16 hp och minst 5♥️
1D-1H-P::
1D-1H-P-2H:6-10 stp(hearts, 3) hearts>2:Enkelhöjning, 6-10 stp och minst 3♥️
1D-1H-P-2H-P::
1D-1H-P-2H-P-4H:stp(hearts, 5)>18:Slutbud, minst 19 stp
1D-1H-P-3H:11-12 stp(hearts, 3) hearts>2:Dubbelhöjning, 11-12 stp och minst 3 ♥️
1D-1H-P-3H-P::
1D-1H-P-3H-P-4H:14-17 stp(hearts, 5):Slutbud, 14-17 stp
1D-1H-P-4H:stp(hearts, 3)>12 hearts>2:Slutbud, minst 13 stp och minst 3♥️
1D-1S:10-16 hcp spades>4 spades>=hearts spades>=clubs:Inkliv, 10-16 hp och minst 5♠️
1D-1S-P::
1D-1S-P-2S:6-10 stp(spades, 3) spades>2:Enkelhöjning, 6-10 stp och minst 3♠️
1D-1S-P-2S-P-4S:stp(spades, 5)>18:Slutbud, minst 19 stp
1D-1S-P-3S:11-12 stp(spades, 3) spades>2:Dubbelhöjning, 11-12 stp och minst 3 ♠️
1D-1S-P-3S-P-4S:14-17 stp(spades, 5):Slutbud, 14-17 stp
1D-1S-P-4S:stp(spades, 3)>12 spades>2:Slutbud, minst 13 stp och minst 3♠️
1D-1NT:15-17 hcp bal stopper(diamonds):Jämn hand och 15-17 hp med håll i ♦️
1D-1NT-P::
1D-1NT-P-P:0-8 hcp:0-8 hp
1D-1NT-P-2NT:hcp=9:Invit, 9 hp
1D-1NT-P-2NT-P:hcp=15:Minimum, 15 hp
1D-1NT-P-2NT-3NT:16-17 hcp:Tillägg, 16-17 hp
1D-1NT-P-3NT:10-15 hcp:10-15 hp
1D-2C:10-16 hcp clubs>5 hcp(clubs)>2:Tvålägesinkliv, 10-16 hp och minst 6♣️
1D-2C-P::
1D-2C-P-3C:8-12 hcp clubs>1:8-12 hp och minst 2♣️
1D-2C-P-3NT::
1H:12-21 hcp and hearts>4 hearts>spades hearts>= diamonds hearts>=clubs:12-21 hp och minst 5♥️
1H-P-P:stp(hearts, 3)<6 hcp<6:0-5 stp
1H-P-1S:hcp>5 hearts<3 spades>3 and spades>=clubs spades>= diamond or hcp<12:1 över 1, minst 6 hp och minst 4♠️
1H-P-1S-P-1NT:12-14 hcp bal:Jämn hand, 12-14 hp
1H-P-1S-P-1NT-P-P:6-10 hcp:6-10 hp
1H-P-1S-P-1NT-P-3NT:13-18 hcp:Slutbud, 13-18 hp
1H-P-1S-P-2C:12-17 hcp hearts>4 clubs>3:Tvåfärgshand, minst 5♥️ och minst 4♣️ och 12-17 hp
1H-P-1S-P-2D:12-17 hcp hearts>4 diamonds>3:Tvåfärgshand, minst 5♥️ och minst 4♦️ och 12-17 hp
1H-P-1S-P-2H:12-14 hcp hearts>5:Enfärgshand, minst 6♥️ och 12-14 hp
1H-P-1S-P-2H-P-4H:13-16 stp(hearts, 2) hearts>1:Slutbud, 13-16 stp och exakt 2♥️
1H-P-1S-P-2S:12-15 stp(spades, 4) spades>3:Trumfstöd, 12-15 stp och minst 4♠️
1H-P-1S-P-2S-P-P:6-10 stp(spades, 4):6-10 stp
1H-P-1S-P-2S-P-3S:11-12 stp(spades, 4):Invit, 11-12 stp
1H-P-1S-P-2S-P-3S-P-P:12-13 stp(spades, 4):12-13 stp
1H-P-1S-P-2S-P-3S-P-4S:stp(spades, 4)>13:14-15 stp
1H-P-1S-P-2S-P-4S:13-18 stp(spades, 4):Slutbud, minst 13 stp
1H-P-1S-P-2NT:18-19 hcp bal:Jämn hand, 18-19 hp
1H-P-1S-P-2NT-P-3NT:6-13 hcp:6-13 hp
1H-P-1S-P-2NT-P-4S:6-13 stp(spades, 6) spades>5:Slutbud, 6-13 stp och minst 6♠️
1H-P-1S-P-3H:15-17 hcp hearts>5:Enfärgshand, minst 6♥️ och 15-17 hp
1H-P-1S-P-3H-P-3NT:9-15 hcp hearts<2:Förslag till slutbud, 9-15 hp och max 1♥️
1H-P-1S-P-3H-P-3NT-P-4H:hearts>6:Minst 7♥️
1H-P-1S-P-3H-P-4H:8-13 stp(hearts, 2) hearts>1:Slutbud, minst 2♥️ och 8-13 stp
1H-P-1S-P-3S:16-18 stp(spades, 4) spades>3:Trumfstöd, 16-18 stp och minst 4♠️
1H-P-1S-P-3S-P-P:stp(spades, 4)<9:6-8 stp
1H-P-1S-P-3S-P-4S:9-14 stp(spades, 4):Slutbud, 9-14 stp
1H-P-1S-P-4H:hcp>17 hearts>5 hcp(hearts)>6:Enfärgshand, minst 6♥️ och minst 18 hp
1H-P-1S-P-4S:stp(spades, 4)>18 spades>3:Trumfstöd, minst 19 stp och minst 4♠️
1H-P-1NT:6-11 hcp:Avböjande 1NT, 6-11 hp
1H-P-1NT-P-P:12-14 hcp bal:Jämn hand och 12-14 hp
1H-P-1NT-P-2C:12-17 hcp hearts>4 clubs>3:Tvåfärgshand, minst 5♥️ och minst 4♣️ och 12-17 hp
1H-P-1NT-P-2D:12-17 hcp hearts>4 diamonds>3:Tvåfärgshand, minst 5♥️ och minst 4♦️ och 12-17 hp
1H-P-1NT-P-2H:12-14 hcp hearts>5:Enfärgshand, minst 6♥️ och 12-14 hp
1H-P-1NT-P-2H-P-4H:13-16 stp(hearts, 2) hearts>1:Slutbud, 13-16 stp och exakt 2♥️
1H-P-1NT-P-2NT:18-19 hcp bal:Jämn hand, 18-19 hp
1H-P-1NT-P-2NT-P-3NT:6-13 hcp:6-13 hp
1H-P-1NT-P-3H:15-17 hcp hearts>5:Enfärgshand, minst 6♥️ och 15-17 hp
1H-P-1NT-P-3H-P-3NT:9-15 hcp hearts<2:Förslag till slutbud, 9-15 hp och max 1♥️
1H-P-1NT-P-3H-P-3NT-P-4H:hearts>6:Minst 7♥️
1H-P-1NT-P-3H-P-4H:8-13 stp(hearts, 2) hearts>1:Slutbud, minst 2♥️ och 8-13 stp
1H-P-1NT-P-4H:hcp>17 hearts>5 hcp(hearts)>6:Enfärgshand, minst 6♥️ och minst 18 hp
1H-P-2C:hcp>11 clubs>3 spades<clubs hearts<4  and clubs>diamonds or shape xx44:2 över 1, minst 12 hp och minst 4♣️. Utgångskrav
1H-P-2C-P-2D:hearts>=5 diamonds>=4:Tvåfärgshand, minst 5♥️ och minst 4♦️
1H-P-2C-P-2D-P-3NT::Slutbud
1H-P-2C-P-2H:hearts>5:Enfärgshand, minst 6♥️
1H-P-2C-P-2H-P-4H:hearts>1:Trumfstöd, minst 2♥️
1H-P-2C-P-2S:hearts>=5 spades>=4:Tvåfärgshand, minst 5♥️ och minst 4♠️
1H-P-2C-P-2S-P-4S:spades>3:Trumfstöd, minst 4♠️
1H-P-2C-P-2NT:12-14 hcp bal:Jämn hand och 12-14 hp
1H-P-2C-P-2NT-P-3NT::Slutbud
1H-P-2C-P-3C:clubs>3:Trumfstöd, minst 4♣️
1H-P-2C-P-3C-P-3NT::Slutbud
1H-P-2D:hcp>11 spades<diamonds hearts<4 diamonds>3 and diamonds>=clubs diamonds>4 or diamonds>clubs:2 över 1, minst 12 hp och minst 4♦️. Utgångskrav
1H-P-2D-P-2H:hearts>5:Enfärgshand, minst 6♥️
1H-P-2D-P-2H-P-4H:hearts>1:Trumfstöd, minst 2♥️
1H-P-2D-P-2S:hearts>=5 spades>=4:Tvåfärgshand, minst 5♥️ och minst 4♠️
1H-P-2D-P-2S-P-4S:spades>3:Trumfstöd, minst 4♠️
1H-P-2D-P-2NT:12-14 hcp bal:Jämn hand och 12-14 hp
1H-P-2D-P-2NT-P-3NT::Slutbud
1H-P-2D-P-3C:hearts>=5 clubs>=4:Tvåfärgshand, minst 5♥️ och minst 4♣️
1H-P-2D-P-3C-P-3NT::Slutbud
1H-P-2D-P-3D:diamonds>3:Trumfstöd, minst 4♦️
1H-P-2D-P-3D-P-3NT::Slutbud
1H-P-2H:6-10 stp(hearts, 3) hearts>2:6-10 stp och minst 3♥️
1H-P-2H-P-P:stp(hearts, 5)<16:12-15 stp
1H-P-2H-P-4H:stp(hearts, 5)>18:minst 19 stp
1H-P-3H:11-12 stp(hearts, 3) hearts>2:11-12 stp och minst 3♥️
1H-P-3H-P-P:stp(hearts, 5)<15:12-14 stp
1H-P-3H-P-4H:stp(hearts, 5)>14:minst 15 stp
1H-1S:10-16 hcp spades>4 spades>=diamonds spades>=clubs:Inkliv, 10-16 hp och minst 5♠️
1H-1S-P::
1H-1S-P-2S:6-10 stp(spades, 3) spades>2:Enkelhöjning, 6-10 stp och minst 3♠️
1H-1S-P-2S-P-4S:stp(spades, 5)>18:Slutbud, minst 19 stp
1H-1S-P-3S:11-12 stp(spades, 3) spades>2:Dubbelhöjning, 11-12 stp och minst 3 ♠️
1H-1S-P-3S-P-4S:14-17 stp(spades, 5):Slutbud, 14-17 stp
1H-1S-P-4S:stp(spades, 3)>12 spades>2:Slutbud, minst 13 stp och minst 3♠️
1H-1NT:15-17 hcp bal stopper(hearts):Jämn hand och 15-17 hp med håll i ♥️
1H-1NT-P::
1H-1NT-P-P:0-8 hcp:0-8 hp
1H-1NT-P-2NT:hcp=9:Invit, 9 hp
1H-1NT-P-2NT-P:hcp=15:Minimum, 15 hp
1H-1NT-P-2NT-3NT:16-17 hcp:Tillägg, 16-17 hp
1H-1NT-P-3NT:10-15 hcp:10-15 hp
1H-2C:10-16 hcp clubs>5 hcp(clubs)>2:Tvålägesinkliv, 10-16 hp och minst 6♣️
1H-2C-P::
1H-2C-P-3C:8-12 hcp clubs>1:8-12 hp och minst 2♣️
1H-2C-P-3NT::
1H-2D:10-16 hcp diamonds>5 hcp(diamonds)>2:Tvålägesinkliv, 10-16 hp och minst 6♦️
1H-2D-P::
1H-2D-P-3D:8-12 hcp diamonds>1:8-12 hp och minst 2♦️
1H-2D-P-3NT::
1S:12-21 hcp spades>4 and spades>=hearts spades>=diamonds spades>=clubs:12-21 hp och minst 5♠️
1S-P-P:stp(spades, 3)<6 hcp<6:0-5 stp
1S-P-1NT:6-11 hcp:Avböjande 1NT, 6-11 hp
1S-P-1NT-P-P:12-14 hcp bal:Jämn hand och 12-14 hp
1S-P-1NT-P-2C:12-17 hcp spades>4 clubs>3:Tvåfärgshand, minst 5♠️ och minst 4♣️ och 12-17 hp
1S-P-1NT-P-2D:12-17 hcp spades>4 diamonds>3:Tvåfärgshand, minst 5♠️ och minst 4♦️ och 12-17 hp
1S-P-1NT-P-2H:12-17 hcp spades>4 hearts>3:Tvåfärgshand, minst 5♠️ och minst 4♥️ och 12-17 hp
1S-P-1NT-P-2S:12-14 hcp spades>5:Enfärgshand, minst 6♠️ och 12-14 hp
1S-P-1NT-P-2S-P-4S:13-16 stp(spades, 2) spades>1:Slutbud, 13-16 stp och exakt 2♠️
1S-P-1NT-P-2NT:18-19 hcp bal:Jämn hand, 18-19 hp
1S-P-1NT-P-2NT-P-3NT:6-13 hcp:6-13 hp
1S-P-1NT-P-3S:15-17 hcp spades>5:Enfärgshand, minst 6♠️ och 15-17 hp
1S-P-1NT-P-3S-P-3NT:9-15 hcp spades<2:Förslag till slutbud, 9-15 hp och max 1♠️
1S-P-1NT-P-3S-P-3NT-P-4S:spades>6:Minst 7♠️
1S-P-1NT-P-3S-P-4S:8-13 stp(spades, 2) spades>1:Slutbud, minst 2♠️ och 8-13 stp
1S-P-1NT-P-4S:hcp>17 spades>5 hcp(spades)>6:Enfärgshand, minst 6♠️ och minst 18 hp
1S-P-2C:hcp>11 clubs>3 spades<4 and clubs>hearts or hearts=4 and clubs>diamonds or shape xx44:2 över 1, minst 12 hp och minst 4♣️. Utgångskrav
1S-P-2C-P-2D:spades>=5 diamonds>=4:Tvåfärgshand, minst 5♠️ och minst 4♦️
1S-P-2C-P-2D-P-3NT::Slutbud
1S-P-2C-P-2H:spades>=5 hearts>=4:Tvåfärgshand, minst 5♠️ och minst 4♥️
1S-P-2C-P-2H-P-4H:hearts>3:Trumfstöd, minst 4♥️
1S-P-2C-P-2S:spades>5:Enfärgshand, minst 6♠️
1S-P-2C-P-2S-P-4S:spades>1:Trumfstöd, minst 2♠️
1S-P-2C-P-2NT:12-14 hcp bal:Jämn hand och 12-14 hp
1S-P-2C-P-2NT-P-3NT::Slutbud
1S-P-2C-P-3C:clubs>3:Trumfstöd, minst 4♣️
1S-P-2C-P-3C-P-3NT::Slutbud
1S-P-2D:hcp>11 diamonds>3 spades<4 and hearts=4 or diamonds>hearts and diamonds>=clubs diamonds>4 or diamonds>clubs:2 över 1, minst 12 hp och minst 4♦️. Utgångskrav
1S-P-2D-P-2H:spades>=5 hearts>=4:Tvåfärgshand, minst 5♠️ och minst 4♥️
1S-P-2D-P-2H-P-4H:hearts>3:Trumfstöd, minst 4♥️
1S-P-2D-P-2S:spades>5:Enfärgshand, minst 6♠️
1S-P-2D-P-2S-P-4S:spades>1:Trumfstöd, minst 2♠️
1S-P-2D-P-2NT:12-14 hcp bal:Jämn hand och 12-14 hp
1S-P-2D-P-2NT-P-3NT::Slutbud
1S-P-2D-P-3C:spades>=5 clubs>=4:Tvåfärgshand, minst 5♠️ och minst 4♣️
1S-P-2D-P-3C-P-3NT::Slutbud
1S-P-2D-P-3D:diamonds>3:Trumfstöd, minst 4♦️
1S-P-2D-P-3D-P-3NT::Slutbud
1S-P-2H:hcp>11 spades<4 hearts>4 hearts>=diamonds hearts>=clubs:2 över 1, minst 12 hp och minst 5♥️. Utgångskrav
1S-P-2H-P-2S:spades>5:Enfärgshand, minst 6♠️
1S-P-2H-P-2S-P-4S:spades>1:Trumfstöd, minst 2♠️
1S-P-2H-P-2NT:12-14 hcp bal:Jämn hand och 12-14 hp
1S-P-2H-P-2NT-P-3NT::Slutbud
1S-P-2H-P-3C:spades>=5 clubs>=4:Tvåfärgshand, minst 5♠️ och minst 4♣️
1S-P-2H-P-3C-P-3NT::Slutbud
1S-P-2H-P-3D:spades>=5 diamonds>=4:Tvåfärgshand, minst 5♠️ och minst 4♦️
1S-P-2H-P-3D-P-3NT::Slutbud
1S-P-2H-P-3H:stp(hearts, 3)>15 hearts>2:Trumfstöd och tillägg, minst 3♥️ och minst 16 stp
1S-P-2H-P-4H:stp(hearts, 3)<16 hearts>2:Trumfstöd och minimum, minst 3♥️ och max 15 stp
1S-P-2S:6-10 stp(spades, 3) spades>2:6-10 stp och minst 3♠️
1S-P-2S-P-P:stp(spades, 5)<16:12-15 stp
1S-P-2S-P-4S:stp(spades, 5)>18:minst 19 stp
1S-P-3S:11-12 stp(spades, 3) spades>2:11-12 stp och minst 3♠️
1S-P-3S-P-P:stp(spades, 5)<15:12-14 stp
1S-P-3S-P-4S:stp(spades, 5)>14:minst 15 stp
1S-1NT:15-17 hcp bal stopper(spades):Jämn hand och 15-17 hp med håll i ♠️
1S-1NT-P::
1S-1NT-P-P:0-8 hcp:0-8 hp
1S-1NT-P-2NT:hcp=9:Invit, 9 hp
1S-1NT-P-2NT-P:hcp=15:Minimum, 15 hp
1S-1NT-P-2NT-3NT:16-17 hcp:Tillägg, 16-17 hp
1S-1NT-P-3NT:10-15 hcp:10-15 hp
1S-2C:10-16 hcp clubs>5 hcp(clubs)>2:Tvålägesinkliv, 10-16 hp och minst 6♣️
1S-2C-P::
1S-2C-P-3C:8-12 hcp clubs>1:8-12 hp och minst 2♣️
1S-2C-P-3NT::
1S-2D:10-16 hcp diamonds>5 hcp(diamonds)>2:Tvålägesinkliv, 10-16 hp och minst 6♦️
1S-2D-P::
1S-2D-P-3D:8-12 hcp diamonds>1:8-12 hp och minst 2♦️
1S-2D-P-3NT::
1S-2H:10-16 hcp hearts>4 hcp(hearts)>2:Tvålägesinkliv, 10-16 hp och minst 5♥️
1S-2H-P::
1S-2H-P-3H:hearts>=3 8-12 stp(hearts, 3):Trumfstöd, 8-12 stp
1S-2H-P-4H:hearts>=3 stp(hearts, 4)>=13:Trumfstöd, minst 13 stp
1NT:15-17 hcp bal:15-17 hp och jämn hand
1NT-P::
1NT-P-P:hcp<9:0-8 hp
1NT-P-2C:hearts=4 or spades=4 and hcp>7 spades<5 hearts<5:Högfärgsfråga. Minst 8 hp och 4 kort i någon ♥️ eller ♠️
1NT-P-2C-P::
1NT-P-2C-P-2D:spades<4 hearts<4:Ingen 4 korts högfärg
1NT-P-2C-P-2D-P::
1NT-P-2C-P-2D-P-2NT:8-9 hcp:Invit. 8-9 hp
1NT-P-2C-P-2D-P-2NT-P-P:hcp=15:15 hp
1NT-P-2C-P-2D-P-2NT-P-3NT:16-17 hcp:16-17 hp
1NT-P-2C-P-2D-P-3NT:10-15 hcp:Slutbud. 10-15 hp
1NT-P-2C-P-2H:hearts>3:Minst 4♥️
1NT-P-2C-P-2H-P::
1NT-P-2C-P-2H-P-2NT:8-9 hcp hearts<4:Invit utan trumfstöd. 8-9 hp max 3♥️. Lovar 4♠️
1NT-P-2C-P-2H-P-2NT-P-P::15 hp utan 4♠️
1NT-P-2C-P-2H-P-2NT-P-3S:15-16 stp(spades, 4):15-16 stp med 4♠️
1NT-P-2C-P-2H-P-2NT-P-3NT::16-17 hp utan 4♠️
1NT-P-2C-P-2H-P-2NT-P-4S:stp(spades, 4)>16:Minst 17 stp med 4♠️
1NT-P-2C-P-2H-P-3H:8-9 stp(hearts, 4) hearts>3:Invit med trumfstöd. 8-9 stp och 4♥️
1NT-P-2C-P-2H-P-3H-P-P:15-16 stp(hearts, 4):15-16 stp
1NT-P-2C-P-2H-P-3H-P-4H:stp(hearts, 4)>16:Minst 17 stp
1NT-P-2C-P-2H-P-3NT:10-15 hcp hearts<4:Förslag till slutbud. 10-15 hp och max 3♥️. Lovar 4♠️
1NT-P-2C-P-2H-P-3NT-P-P:spades<4:Max 3♠️
1NT-P-2C-P-2H-P-3NT-P-4S:spades>3:4 kort i ♠️
1NT-P-2C-P-2H-P-4H:10-15 stp(hearts, 4) hearts>3:Slutbud. 10-15 stp och 4♥️
1NT-P-2C-P-2S:spades>3 hearts<4:Minst 4♠️. Förnekar 4♥️
1NT-P-2C-P-2S-P::
1NT-P-2C-P-2S-P-2NT:8-9 hcp spades<4:Invit utan trumfstöd. 8-9 hp max 3♠️. Lovar 4♥️
1NT-P-2C-P-2S-P-2NT-P-P:hcp=15:15 hp
1NT-P-2C-P-2S-P-2NT-P-3NT:16-17 hcp:16-17 hp
1NT-P-2C-P-2S-P-3S:8-9 stp(spades, 4) spades>3:Invit med trumfstöd. 8-9 stp och 4♠️
1NT-P-2C-P-2S-P-3S-P-P:15-16 stp(spades, 4):15-16 stp
1NT-P-2C-P-2S-P-3S-P-4S:stp(spades, 4)>16:Minst 17 stp
1NT-P-2C-P-2S-P-3NT:10-15 hcp spades<4:Slutbud. 10-15 hp och max 3♠️. Lovar 4♥️
1NT-P-2C-P-2S-P-4S:10-15 stp(spades, 4) spades>3:Slutbud. 10-15 stp och 4♠️
1NT-P-2D:hearts>4 hearts>spades:Överföring. Minst 5♥️ och minst 0 hp
1NT-P-2D-P::
1NT-P-2D-P-2H:hearts<4 or stp(hearts, 3)<17:Överföring accepterad
1NT-P-2D-P-2H-P::
1NT-P-2D-P-2H-P-P:hearts=5 hcp<8 or stp(hearts, 6)<8:0-7 hp/stp
1NT-P-2D-P-2H-P-2NT:8-9 hcp hearts=5:Invit. 8-9 hp och exakt 5♥️
1NT-P-2D-P-2H-P-2NT-P-P:hcp=15 hearts<3:15 hp utan 3♥️
1NT-P-2D-P-2H-P-2NT-P-3H:15-16 stp(hearts, 3) hearts>2:15-16 stp med minst 3♥️
1NT-P-2D-P-2H-P-2NT-P-3H-P-P:8-9 stp(hearts, 5):8-9 stp
1NT-P-2D-P-2H-P-2NT-P-3H-P-4H:stp(hearts, 5)>9:Minst 10 stp
1NT-P-2D-P-2H-P-2NT-P-3NT:16-17 hcp hearts<3:16-17 hp utan 3♥️
1NT-P-2D-P-2H-P-2NT-P-4H:stp(hearts, 3)>16:Minst 17 stp med minst 3♥️
1NT-P-2D-P-2H-P-3H:8-9 stp(hearts, 6) hearts>5:Invit. 8-9 stp och minst 6♥️
1NT-P-2D-P-2H-P-3H-P-P:15-16 stp(hearts, 2):15-16 stp
1NT-P-2D-P-2H-P-3H-P-4H:stp(hearts, 2)>16:Minst 17 stp
1NT-P-2D-P-2H-P-3NT:10-15 hcp hearts=5:Förslag till slutbud. 10-15 hp och exakt 5♥️
1NT-P-2D-P-2H-P-3NT-P-P:hearts=2:Exakt 2♥️
1NT-P-2D-P-2H-P-3NT-P-4H:hearts>2:Minst 3♥️
1NT-P-2D-P-2H-P-4H:10-15 stp(hearts, 6) hearts>5:Slutbud. 10-15 stp och minst 6♥️
1NT-P-2H:spades>4 spades>= hearts:Överföring. Minst 5♠️ och minst 0 hp
1NT-P-2H-P::
1NT-P-2H-P-2S:spades<4 or stp(spades, 3)<17:Överföring accepterad
1NT-P-2H-P-2S-P::
1NT-P-2H-P-2S-P-P:spades=5 hcp<8 or stp(spades, 6)<8:0-7 hp/stp
1NT-P-2H-P-2S-P-2NT:8-9 hcp spades=5:Invit. 8-9 hp och exakt 5♠️
1NT-P-2H-P-2S-P-2NT-P-P:hcp=15 spades<3:15 hp utan 3♠️
1NT-P-2H-P-2S-P-2NT-P-3S:15-16 stp(spades, 3) spades>2:15-16 stp med minst 3♠️
1NT-P-2H-P-2S-P-2NT-P-3S-P-P:8-9 stp(spades, 5):8-9 stp
1NT-P-2H-P-2S-P-2NT-P-3S-P-4S:stp(spades, 5)>9:Minst 10 stp
1NT-P-2H-P-2S-P-2NT-P-3NT:16-17 hcp spades<3:16-17 hp utan 3♠️
1NT-P-2H-P-2S-P-2NT-P-4S:stp(spades, 3)>16:Minst 17 stp med minst 3♠️
1NT-P-2H-P-2S-P-3S:8-9 stp(spades, 6) spades>5:Invit. 8-9 stp och minst 6♠️
1NT-P-2H-P-2S-P-3S-P-P:15-16 stp(spades, 2):15-16 stp
1NT-P-2H-P-2S-P-3S-P-4S:stp(spades, 2)>16:Minst 17 stp
1NT-P-2H-P-2S-P-3NT:10-15 hcp spades=5:Förslag till slutbud. 10-15 hp och exakt 5♠️
1NT-P-2H-P-2S-P-3NT-P-P:spades=2:Exakt 2♠️
1NT-P-2H-P-2S-P-3NT-P-4S:spades>2:Minst 3♠️
1NT-P-2H-P-2S-P-4S:10-15 stp(spades, 6) spades>5:Slutbud. 10-15 stp och minst 6♠️
1NT-P-2NT:hcp=9:9 hp, invit till 3NT
1NT-P-2NT-P::
1NT-P-2NT-P-P:hcp=15:15 hp
1NT-P-2NT-P-3NT:16-17 hcp:16-17 hp
1NT-P-3NT:10-15 hcp:10-15 hp, slutbud
1NT-P-6NT:18-19 hcp:18-19 hp
1NT-P-7NT:hcp>21:22-25 hp
2NT:20-21 hcp bal:20-21 hp och jämn hand
2NT-P-P:hcp<5:0-4 hp
2NT-P-3NT:5-11 hcp:5-11 hp
2NT-P-6NT:13-15 hcp:13-15 hp
2NT-P-7NT:hcp>16:17-20 hp

""")
}
