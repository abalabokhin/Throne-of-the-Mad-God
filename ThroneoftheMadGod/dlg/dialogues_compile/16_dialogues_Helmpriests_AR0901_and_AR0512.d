// Oisig

APPEND BHOISIG

IF ~~ THEN BEGIN lancahead_1
   SAY @4400
     IF ~~ THEN DO ~~ EXIT
END
END

EXTEND_BOTTOM BHOISIG 23
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4401 GOTO lancahead_1
END
EXTEND_BOTTOM BHOISIG 24
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4401 GOTO lancahead_1
END
EXTEND_BOTTOM BHOISIG 42
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4401 GOTO lancahead_1
END
EXTEND_BOTTOM BHOISIG 43
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4401 GOTO lancahead_1
END
EXTEND_BOTTOM BHOISIG 59
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4401 GOTO lancahead_1
END
EXTEND_BOTTOM BHOISIG 65
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4401 GOTO lancahead_1
END
EXTEND_BOTTOM BHOISIG 71
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4401 GOTO lancahead_1
END
EXTEND_BOTTOM BHOISIG 72
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4401 GOTO lancahead_1
END
EXTEND_BOTTOM BHOISIG 73
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4401 GOTO lancahead_1
END

// Wächter Vottnar

APPEND BHELM

IF ~~ THEN BEGIN lancahead_1
   SAY @4402
     IF ~~ THEN DO ~~ EXIT
END
END
EXTEND_BOTTOM BHELM 0
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4403 GOTO lancahead_1
END

// Sir Lothtyran

APPEND HELMPR

IF ~~ THEN BEGIN lancahead_1
   SAY @4404
     IF ~~ THEN REPLY @4405 GOTO lancahead_2
END

IF ~~ THEN BEGIN lancahead_2
   SAY @4406
   IF ~~ THEN REPLY @4407 GOTO lancahead_3
END

IF ~~ THEN BEGIN lancahead_3
   SAY @4408
   IF ~~ THEN REPLY @4409 GOTO vargouille
END

IF ~~ THEN BEGIN vargouille
   SAY @4410
   IF ~~ THEN REPLY @4411 GOTO redemption
END

IF ~~ THEN BEGIN redemption
   SAY @4412
   =
   @4413
   IF ~~ THEN DO ~SetGlobal("AC#Lancameth_Helm","AR0901",1)~ EXIT
END

IF ~~ THEN BEGIN look_at_this_head
   SAY @4414
   IF ~~ THEN EXTERN ~AC#S#HPR~ look_at_this_head_02
END
END

EXTEND_BOTTOM HELMPR 0
        IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4415 GOTO lancahead_1
END

// Sir Kandelar

BEGIN ~AC#S#HPR~

IF ~Global("AC#Lancameth_Helm","AR0901",5)~ THEN BEGIN job_done
SAY @4416
=
@4417
IF ~~ THEN REPLY @4418 GOTO lanca_widow_01
IF ~~ THEN REPLY @4419 GOTO Ossuary_01
END

	IF ~~ THEN BEGIN Ossuary_01
	SAY @4420
	   IF ~~ THEN DO ~EraseJournalEntry(@52001)
	   AddJournalEntry(@52008,QUEST_DONE)
	   EscapeArea()~ EXIT 
	END
	
	IF ~~ THEN BEGIN lanca_widow_01
	SAY @4421
	   IF ~~ THEN DO ~GiveItemCreate("AC#MGLN2",Player1,1,0,0)
	   AddJournalEntry(@52004,QUEST)
	   EscapeArea()~ EXIT 
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY @4422
IF ~~ THEN EXTERN ~HELMPR~ look_at_this_head
END

IF ~~ THEN BEGIN look_at_this_head_02
SAY @4423
   IF ~~ THEN REPLY @4424 GOTO redemption_kandelar
   IF ~~ THEN REPLY @4425 GOTO redemption_kandelar
   IF ~~ THEN REPLY @4426 GOTO redemption_kandelar
END

	IF ~~ THEN BEGIN redemption_kandelar
	SAY @4427
	   IF ~~ THEN DO ~TakePartyItem("AC#HEAD1")~ GOTO redemption_kandelar_02 
	END
	
	IF ~~ THEN BEGIN redemption_kandelar_02
	SAY @4428
	=
	@4429
	= 
	@4430
	   IF ~~ THEN DO ~StartCutSceneMode()
	   CreateVisualEffectObject("SPDEATH3",Myself)
	   Wait(1)
	   PlaySound("EFF_P31")
	   CreateVisualEffectObject("SPWHIRL",Myself)
	   Wait(2)
	   SetGlobal("AC#Lancameth_Helm","AR0901",5)
	   Dialogue([PC])~ EXIT 
	END

