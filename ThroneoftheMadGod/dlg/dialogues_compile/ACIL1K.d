// Dialogue mad derro scout

BEGIN ~AC#MG1KF~ 
CHAIN IF ~True()~ THEN AC#MG1KF intruders
@4500
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @4501
== ViconiJ IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @4502
== AC#MG1KF @4503
END
IF ~~ THEN DO ~CreateVisualEffectObject("SPFLESHS",Myself)
Wait(1)
ApplySpell(Myself,SWOOSH_GONE)  
DestroySelf()~
EXIT

// dialogue derro troll master
BEGIN ~AC#MGTRZ~
 
CHAIN IF ~True()~ THEN AC#MGTRZ hello_01
@4504 
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @4505
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @4506
== AC#MGTRZ @4507
DO ~SetGlobal("TrollLaboratory","ACIL1K",1)
Enemy()~ EXIT
		
// Dialogue Slaves

BEGIN ~AC#MG1KS~
 
CHAIN IF ~True()~ THEN AC#MG1KS hello_01
@4508
END
IF~~THEN REPLY @4509 EXTERN AC#MG1KS free_02
IF~~THEN REPLY @4510 EXTERN AC#MG1KS free_02
IF~~THEN REPLY @4511 EXTERN AC#MG1KS behave_like_slaves_bye

		CHAIN AC#MG1KS behave_like_slaves_bye
		@4512
		EXIT

	CHAIN AC#MG1KS free_02
	@4513
	END
	IF~~THEN REPLY @4514 EXTERN AC#MG1KS what_do_you_do_here
	IF~~THEN REPLY @4515 EXTERN AC#MG1KS slaves_bye
	IF~~THEN REPLY @4516 EXTERN AC#MG1KS slaves_bye

	CHAIN AC#MG1KS what_do_you_do_here
	@4517
	END
	IF~~THEN REPLY @4518 EXTERN AC#MG1KS what_are_derro
	IF~~THEN REPLY @4519 EXTERN AC#MG1KS derro_masterminds
	IF~~THEN REPLY @4520 EXTERN AC#MG1KS why_derro_slaves
	
		CHAIN AC#MG1KS what_are_derro
		@4521
		END
		IF~~THEN REPLY @4519 EXTERN AC#MG1KS derro_masterminds
		IF~~THEN REPLY @4520 EXTERN AC#MG1KS why_derro_slaves
	
		CHAIN AC#MG1KS derro_masterminds
		@4522
		END
		IF~~THEN REPLY @4523 EXTERN AC#MG1KS dog_slaves_why
		IF~~THEN REPLY @4524 EXTERN AC#MG1KS slaves_go_alone
		IF~~THEN REPLY @4525 EXTERN AC#MG1KS slaves_bye
		
		CHAIN AC#MG1KS why_derro_slaves
		@4526
		END
		IF~~THEN REPLY @4527 EXTERN AC#MG1KS slaves_go_alone
		IF~~THEN REPLY @4528 EXTERN AC#MG1KS slaves_bye
		
		CHAIN AC#MG1KS dog_slaves_why
		@4529
		END
		IF~~THEN EXTERN AC#MG1KS slaves_let_us_go
		
		CHAIN AC#MG1KS slaves_let_us_go
		@4530
		END
		IF~~THEN REPLY @4531 EXTERN AC#MG1KS slaves_go_alone
		IF~~THEN REPLY @4532 EXTERN AC#MG1KS slaves_go_alone
		IF~~THEN REPLY @4533 EXTERN AC#MG1KS slaves_go_alone
		
			CHAIN AC#MG1KS slaves_go_alone
			@4534
			END
			IF~~THEN REPLY @4535 EXTERN AC#MG1KS slaves_bye
			IF~~THEN REPLY @4536 EXTERN AC#MG1KS slaves_bye
	
CHAIN AC#MG1KS slaves_bye
@4537
=
@4538
DO ~ReputationInc(1)
SetGlobal("SlavesFree","ACIL1K",1)
EscapeArea()~ EXIT

// other slaves

BEGIN ~AC#MG1KU~
 
CHAIN IF ~True()~ THEN AC#MG1KU hello_01
@4539
EXIT

