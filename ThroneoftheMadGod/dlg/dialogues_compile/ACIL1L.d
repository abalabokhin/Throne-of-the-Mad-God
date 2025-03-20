// Dialogue Lady Starthorn

BEGIN ~AC#MGLDS~

CHAIN IF ~Global("StarthornChange","ACIL1L",4)~ THEN AC#MGLDS hello_after_banshee
@4600
DO ~SetGlobal("StarthornChange","ACIL1L",10)~
EXIT

CHAIN IF ~Global("StarthornCorpse","ACIL1L",1)~ THEN AC#MGLDS hello_desecrated
@4601
END
IF~NumTimesTalkedTo(0)~THEN REPLY @4602 EXTERN AC#MGLDS desecrated_who_are_you
IF~~THEN REPLY @4603 EXTERN AC#MGLDS desecrated_02
IF~~THEN REPLY @4604 EXTERN AC#MGLDS desecrated_02
IF~~THEN REPLY @4605 EXTERN AC#MGLDS fight_bye

	CHAIN AC#MGLDS desecrated_who_are_you
	@4606
	END
	IF~~THEN REPLY @4603 EXTERN AC#MGLDS desecrated_02
	IF~~THEN REPLY @4604 EXTERN AC#MGLDS desecrated_02
	IF~~THEN REPLY @4607 EXTERN AC#MGLDS desecrated_lancameth_party
	IF~~THEN REPLY @4608 EXTERN AC#MGLDS fight_bye
	
		CHAIN AC#MGLDS desecrated_lancameth_party
		@4609
		END
		IF~~THEN REPLY @4603 EXTERN AC#MGLDS desecrated_02
		IF~~THEN REPLY @4604 EXTERN AC#MGLDS desecrated_02
		IF~~THEN REPLY @4605 EXTERN AC#MGLDS fight_bye

	CHAIN AC#MGLDS desecrated_02
	@4610
	== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @4611
	== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @4612
	== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @4613
	== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @4614
	== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN @4615
	== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @4616
	END
	IF~~THEN REPLY @4617 EXTERN AC#MGLDS desecrated_ok_bye
	IF~~THEN REPLY @4618 EXTERN AC#MGLDS desecrated_ok_bye
	IF~~THEN REPLY @4604 EXTERN AC#MGLDS fight_bye
	IF~~THEN REPLY @4619 EXTERN AC#MGLDS fight_bye
	IF~~THEN REPLY @4620 EXTERN AC#MGLDS fight_bye

		CHAIN AC#MGLDS desecrated_fight
		@4621
		END
		IF~~THEN EXTERN AC#MGLDS fight_bye

		CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MGLDS hello_firsttime
		@4622
		END
		IF~~THEN REPLY @4602 EXTERN AC#MGLDS who_are_you
		IF~~THEN REPLY @4623 EXTERN AC#MGLDS understand_past
		IF~~THEN REPLY @4624 EXTERN AC#MGLDS about_this_place
		IF~~THEN REPLY @4625 EXTERN AC#MGLDS fight
		IF~~THEN REPLY @4626 EXTERN AC#MGLDS bye
		
		CHAIN AC#MGLDS who_are_you
		@4627
		END
		IF~~THEN REPLY @4628 EXTERN AC#MGLDS lancameth_party
		IF~~THEN REPLY @4623 EXTERN AC#MGLDS understand_past
		IF~~THEN REPLY @4624 EXTERN AC#MGLDS about_this_place
		IF~~THEN REPLY @4629 EXTERN AC#MGLDS fight
		IF~~THEN REPLY @4626 EXTERN AC#MGLDS bye
		
		CHAIN IF ~True()~ THEN AC#MGLDS hello_01
		@4630
		END		
		IF~~THEN REPLY @4631 EXTERN AC#MGLDS lancameth_party
		IF~~THEN REPLY @4623 EXTERN AC#MGLDS understand_past
		IF~~THEN REPLY @4624 EXTERN AC#MGLDS about_this_place
		IF~~THEN REPLY @4629 EXTERN AC#MGLDS fight
		IF~~THEN REPLY @4626 EXTERN AC#MGLDS bye


	CHAIN AC#MGLDS lancameth_party
	@4632
	END
	IF~~THEN REPLY @4633 EXTERN AC#MGLDS understand_past
	IF~~THEN REPLY @4634 EXTERN AC#MGLDS fight
	IF~~THEN REPLY @4635 EXTERN AC#MGLDS bye
	
	CHAIN AC#MGLDS understand_past
	@4636
	END
	IF~~THEN REPLY @4637 EXTERN AC#MGLDS who_traitor
	IF~~THEN REPLY @4635 EXTERN AC#MGLDS bye
	
	CHAIN AC#MGLDS about_this_place
	@4638
	END
	IF~~THEN REPLY @4639 EXTERN AC#MGLDS lancameth_party
	IF~~THEN REPLY @4623 EXTERN AC#MGLDS understand_past
	IF~~THEN REPLY @4635 EXTERN AC#MGLDS bye
	
	CHAIN AC#MGLDS who_traitor
	@4640
	END
	IF~~THEN REPLY @4641 EXTERN AC#MGLDS how_redeem
	IF~~THEN REPLY @4642 EXTERN AC#MGLDS bye
	
	CHAIN AC#MGLDS how_redeem
	@4643
	END
	IF~~THEN REPLY @4644 EXTERN AC#MGLDS bye
	IF~~THEN REPLY @4645 EXTERN AC#MGLDS bye
	IF~~THEN REPLY @4646 EXTERN AC#MGLDS bye
	IF~~THEN REPLY @4647 EXTERN AC#MGLDS fight
	IF~~THEN REPLY @4648 EXTERN AC#MGLDS bye


CHAIN AC#MGLDS bye
@4649
END
IF~Global("MetStarthorn","ACIL1L",0)~THEN EXTERN AC#MGLDS leave_01
IF~Global("MetStarthorn","ACIL1L",1)~THEN EXTERN AC#MGLDS leave_02

CHAIN AC#MGLDS leave_01
@4650 
DO ~AddJournalEntry(@52052,QUEST)
SetGlobal("MetStarthorn","ACIL1L",1)~ EXIT

CHAIN AC#MGLDS leave_02
@4650  
DO ~~ EXIT

CHAIN AC#MGLDS fight
@4651
EXTERN AC#MGLDS fight_bye

CHAIN AC#MGLDS desecrated_ok_bye
@4652
DO ~SetGlobal("StarthornCorpse","ACIL1L",10)~ EXIT

CHAIN AC#MGLDS fight_bye
@4653
DO ~SetGlobal("StarthornChange","ACIL1L",1)
SetGlobal("StarthornCorpse","ACIL1L",10)~ EXIT

