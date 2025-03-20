// Dialogue hidden Troll

BEGIN ~AC#MG16T~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MG16T hello_01
@5500
END
IF~~THEN REPLY @5501 EXTERN AC#MG16T no_fight
IF~~THEN REPLY @5502 EXTERN AC#MG16T fight
IF~~THEN REPLY @5503 EXTERN AC#MG16T fight


CHAIN IF ~~ THEN AC#MG16T no_fight
@5504
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @5505
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @5506
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @5507
== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @5508
//== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN ~~
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN @5509
//== NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN ~~
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @5510
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @5511
== AC#MG16T @5512
END
IF~~THEN REPLY @5513 EXTERN AC#MG16T who_is_ursu
IF~~THEN REPLY @5514 EXTERN AC#MG16T what_do_you_want
IF~~THEN REPLY @5515 EXTERN AC#MG16T fight

CHAIN IF ~~ THEN AC#MG16T who_is_ursu
@5516
END
IF~~THEN REPLY @5514 EXTERN AC#MG16T what_do_you_want
IF~~THEN REPLY @5515 EXTERN AC#MG16T fight

	CHAIN IF ~~ THEN AC#MG16T what_do_you_want
	@5517
	END
	IF~~THEN REPLY @5518 EXTERN AC#MG16T how_change_trolls
	IF~~THEN REPLY @5519 EXTERN AC#MG16T give_hand
	IF~~THEN REPLY @5520 EXTERN AC#MG16T deal_bye
	IF~~THEN REPLY @5521 EXTERN AC#MG16T fight
	
	CHAIN IF ~~ THEN AC#MG16T how_change_trolls
	@5522
	END
	IF~~THEN EXTERN AC#MG16T give_hand
	
	CHAIN IF ~~ THEN AC#MG16T give_hand
	@5523
	END
	IF~~THEN REPLY @5524 EXTERN AC#MG16T more_than_handshake
	IF~~THEN REPLY @5525 EXTERN AC#MG16T hand_reward
	
		CHAIN IF ~~ THEN AC#MG16T more_than_handshake
		@5526
		END
		IF~~THEN REPLY @5525 EXTERN AC#MG16T hand_reward
		IF~~THEN REPLY @5527 EXTERN AC#MG16T deal
		IF~~THEN REPLY @5528 EXTERN AC#MG16T dont_want_hand
		IF~~THEN REPLY @5529 EXTERN AC#MG16T fight
		
		CHAIN IF ~~ THEN AC#MG16T hand_reward
		@5530
		END
		IF~~THEN REPLY @5527 EXTERN AC#MG16T deal
		IF~~THEN REPLY @5528 EXTERN AC#MG16T dont_want_hand
		IF~~THEN REPLY @5529 EXTERN AC#MG16T fight
		
		CHAIN IF ~~ THEN AC#MG16T dont_want_hand
		@5531
		END
		IF~~THEN EXTERN AC#MG16T deal_bye

CHAIN IF ~~ THEN AC#MG16T deal
@5532
DO ~SetGlobal("Give_Hand","ACIL16",1)
ApplySpellRES("AC#MGTR",Myself)
//ApplyDamage(Myself,30,SLASHING)
GiveItemCreate("AC#MGTRH",Player1,0,0,0) 
~ EXTERN AC#MG16T deal_bye

CHAIN IF ~~ THEN AC#MG16T deal_bye
@5533
DO ~EscapeArea()~ EXIT


CHAIN IF ~~ THEN AC#MG16T fight
@5534
DO ~SetGlobal("Fight_Grubnuk","ACIL16",1)
Enemy()~ EXIT

