
/****************************
// Dialogue Cromwell: upgrade mithral plate mail
*****************************/
EXTEND_BOTTOM WSMITH01 13
  IF ~OR(3)
  PartyHasItem("AC#MGKY1")
  PartyHasItem("AC#MGKY2")
  PartyHasItem("AC#MGKY3")~ THEN GOTO have_MG_Mithral_armor
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN have_MG_Mithral_armor 
  SAY @6200
  =
  @6201
    IF ~PartyHasItem("AC#MGKY1")
  PartyHasItem("AC#MGKY2")
  PartyHasItem("AC#MGKY3")~ THEN GOTO have_MG_Mithral_armor_02
     IF ~OR(3)
	!PartyHasItem("AC#MGKY1")
	!PartyHasItem("AC#MGKY2")
	!PartyHasItem("AC#MGKY3")~ THEN GOTO not_have_all_MG_Mithral_armor
  END
    
  IF ~~ THEN BEGIN have_MG_Mithral_armor_02 
  SAY @6202
	IF ~PartyGoldLT(10000)~ THEN REPLY #66900 GOTO NoThanks
    IF ~PartyGoldGT(9999)~ THEN REPLY #66901 DO ~SetGlobal("AC#MG_Mithral_armor","ar0334",1)
												SetGlobal("ForgeStuff","GLOBAL",1)
                                                TakePartyGold(10000)
                                                TakePartyItem("AC#MGKY1")
                                                DestroyItem("AC#MGKY1")
												TakePartyItem("AC#MGKY2")
                                                DestroyItem("AC#MGKY2")
											    TakePartyItem("AC#MGKY3")
                                                DestroyItem("AC#MGKY3")						
                                                DestroyGold(10000)~ GOTO 56
	IF ~~ THEN REPLY #66802 GOTO NoThanks
	END 

  IF ~~ THEN BEGIN not_have_all_MG_Mithral_armor 
  SAY @6203
   COPY_TRANS WSMITH01 13
  END
  
  IF ~~ THEN BEGIN NoThanks 
  SAY @6204
   COPY_TRANS WSMITH01 13
  END
END
