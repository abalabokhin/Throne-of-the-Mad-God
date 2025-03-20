// Dialogues with the 3 remaining party members of Lancameth's last expedition
BEGIN ~AC#MGNH2~
BEGIN ~AC#MGLD2~
BEGIN ~AC#MGIR2~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MGIR2 hello_00
@5580
== AC#MGLD2 @5581
== AC#MGNH2 @5582
== AC#MGIR2 @5583
DO ~AddexperienceParty(1000)
SetGlobal("LancamethsParty","ACIL18",10)~ EXIT

// Dialogue Clangeddin statue
BEGIN ~AC#MG18C~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MG18C hello_01
@5584
DO ~SetGlobal("DogWizDead","ACIL18",10)
AddJournalEntry(@19000,QUEST)
AddJournalEntry(@51000,QUEST)
ActionOverride("CUTSPY",DestroySelf())
DestroySelf()~ EXIT

// Dialogue Dog Wizard

BEGIN ~AC#MG18S~

BEGIN ~AC#DOGWI~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#DOGWI hello_00
@5585
== AC#MG18S @5586
== AC#DOGWI @5587
== AC#MG18S @5588
== AC#DOGWI @5589
DO ~ClearAllActions()
StartCutSceneMode()
SetGlobal("KillSlave","ACIL18",1)
ReallyForceSpell("AC#MG18S",WIZARD_FLAME_ARROW)
Wait(1)
ActionOverride("AC#MG18S",Kill(Myself))
SetGlobal("KillSlave","ACIL18",2)
EndCutSceneMode()~ EXIT

CHAIN IF ~Global("KillSlave","ACIL18",2)~ THEN AC#DOGWI hello_01
@5590 
=
@5591
DO ~SetGlobal("KillSlave","ACIL18",10)~ EXTERN AC#DOGWI you_talked_horn

	CHAIN IF ~~ THEN AC#DOGWI you_talked_horn
	@5592
	END
	IF~~THEN REPLY @5593 EXTERN AC#DOGWI yes_thats_me
	IF~~THEN REPLY @5594 EXTERN AC#DOGWI who_are_you
	IF~~THEN REPLY @5595 EXTERN AC#DOGWI search_lancameth
	IF~~THEN REPLY @5596 EXTERN AC#DOGWI fight

		CHAIN IF ~~ THEN AC#DOGWI yes_thats_me
		@5597
		END
		IF~~THEN REPLY @5594 EXTERN AC#DOGWI who_are_you
		IF~~THEN REPLY @5598 EXTERN AC#DOGWI search_lancameth
		IF~~THEN REPLY @5599 EXTERN AC#DOGWI i_am_traitor
		IF~~THEN REPLY @5600 EXTERN AC#DOGWI fight
	
	CHAIN IF ~~ THEN AC#DOGWI search_lancameth
	@5601
	END
	IF~~THEN REPLY @5594 EXTERN AC#DOGWI who_are_you
	IF~~THEN REPLY @5599 EXTERN AC#DOGWI i_am_traitor
	IF~~THEN REPLY @5602 EXTERN AC#DOGWI search_lancameth_02
	IF~~THEN REPLY @5600 EXTERN AC#DOGWI fight
	
	CHAIN IF ~~ THEN AC#DOGWI search_lancameth_02
	@5603
	END
	IF~~THEN REPLY @5594 EXTERN AC#DOGWI who_are_you
	IF~~THEN REPLY @5599 EXTERN AC#DOGWI i_am_traitor
	IF~~THEN REPLY @5600 EXTERN AC#DOGWI fight
	
	CHAIN IF ~~ THEN AC#DOGWI who_are_you
	@5604
	== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @5605
	== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @5606
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @5607
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @5608
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN @5609
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @5610
//== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN @284
//== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @244
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @5611
== ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN @5612
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @5613
//== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @282
//== NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @283
//== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @280
//== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @281
//== IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @251
== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @5614
//== HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN @286
== RASAADJ IF ~InParty("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @5615
//== NEERAJ IF ~InParty("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @288
	END	
	IF~~THEN REPLY @5599 EXTERN AC#DOGWI i_am_traitor
	
	CHAIN IF ~~ THEN AC#DOGWI i_am_traitor
	@5616
	END	
	IF~~THEN REPLY @5617 EXTERN AC#DOGWI i_am_much_more
	IF~~THEN REPLY @5618 EXTERN AC#DOGWI i_am_much_more
	IF~~THEN REPLY @5619 EXTERN AC#DOGWI fight
	
	CHAIN IF ~~ THEN AC#DOGWI i_am_much_more
	@5620
	=
	@5621
	END
	IF~~THEN REPLY @5622 EXTERN AC#DOGWI open_door
	IF~~THEN REPLY @5623 EXTERN AC#DOGWI clever_plan
	IF~~THEN REPLY @5624 EXTERN AC#DOGWI open_door
	IF~~THEN REPLY @5625 EXTERN AC#DOGWI open_door
	IF~~THEN REPLY @5626 EXTERN AC#DOGWI fight
	
			CHAIN IF ~~ THEN AC#DOGWI clever_plan
			@5627
			END
			IF~~THEN EXTERN AC#DOGWI open_door
	
		CHAIN IF ~~ THEN AC#DOGWI open_door
		@5628
		END
		IF~~THEN REPLY @5629 EXTERN AC#DOGWI your_help
		IF~~THEN REPLY @5630 EXTERN AC#DOGWI your_help
		IF~~THEN REPLY @5631 EXTERN AC#DOGWI why_lancameth_left_you_alone
		IF~~THEN REPLY @5632 EXTERN AC#DOGWI fight
		
			CHAIN IF ~~ THEN AC#DOGWI why_lancameth_left_you_alone
			@5633
			END
			IF~~THEN EXTERN AC#DOGWI your_help
		
		CHAIN IF ~~ THEN AC#DOGWI your_help
		@5634
		END
		IF~~THEN REPLY @5635 EXTERN AC#DOGWI what_door
		IF~~THEN REPLY @5636 EXTERN AC#DOGWI why_not_open_on_your_own
		IF~~THEN REPLY @5600 EXTERN AC#DOGWI fight
		
			CHAIN IF ~~ THEN AC#DOGWI what_door
			@5637
			END
			IF~~THEN REPLY @5638 EXTERN AC#DOGWI why_help_you
			IF~~THEN REPLY @5636 EXTERN AC#DOGWI why_not_open_on_your_own
			IF~~THEN REPLY @5600 EXTERN AC#DOGWI fight
			
			CHAIN IF ~~ THEN AC#DOGWI why_not_open_on_your_own
			@5639
			END
			IF~~THEN EXTERN AC#DOGWI old_dwarves_sealed_door
			
				CHAIN IF ~~ THEN AC#DOGWI why_help_you
				@5640 
				END
				IF~~THEN EXTERN AC#DOGWI old_dwarves_sealed_door
				
				CHAIN IF ~~ THEN AC#DOGWI old_dwarves_sealed_door
				@5641
				=
				@5642
				== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @5643
				== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @5644
				== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @5645
				== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @5646
				== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @5647
				== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN @5648
				/*
				== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @244
				== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @246
				= @247
				== ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN @248
				== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @249
				= @250
				== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @282
				== NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @283
				== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @280
				== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @281
				== IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @251
				== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @285
				== HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN @286
				== RASAADJ IF ~InParty("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @287
				== NEERAJ IF ~InParty("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @288
*/				
				END
				IF~~THEN EXTERN AC#DOGWI you_open_door
				
				CHAIN IF ~~ THEN AC#DOGWI you_open_door
				@5649
				END
				IF~~THEN REPLY @5650 EXTERN AC#DOGWI crazy
				IF~~THEN REPLY @5651 EXTERN AC#DOGWI alright_help_you
				IF~~THEN REPLY @5600 EXTERN AC#DOGWI fight
				
					CHAIN IF ~~ THEN AC#DOGWI alright_help_you
					@5652
					END
					IF~~THEN REPLY @5650 EXTERN AC#DOGWI crazy
					IF~~THEN REPLY @5653 EXTERN AC#DOGWI fight
					IF~~THEN REPLY @5654 EXTERN AC#DOGWI fight
				
					CHAIN IF ~~ THEN AC#DOGWI crazy
					@5655
					END
					IF~~THEN REPLY @5656 EXTERN AC#DOGWI fight
					IF~~THEN REPLY @5657 EXTERN AC#DOGWI fight
					IF~~THEN REPLY @5658 EXTERN AC#DOGWI fight
					IF~~THEN REPLY @5600 EXTERN AC#DOGWI fight

CHAIN AC#DOGWI fight
@5659
END
IF~~THEN EXTERN AC#DOGWI fight_bye

CHAIN AC#DOGWI fight_bye
@5660 
DO ~SetGlobal("DogWizardFight","ACIL18",1)
Enemy()~ EXIT

// Dialogue Lancameth in Area ACIL18

BEGIN ~AC#LANCA~

	IF ~~ THEN BEGIN believe_me
	SAY @5661
	IF ~~ THEN GOTO 1
	END
	
	IF ~~ THEN BEGIN know_me
	SAY @5662
	IF ~~ THEN GOTO 1
	END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY @5663 
  IF ~~ THEN REPLY @5664 GOTO chain_what_happened
  IF ~~ THEN REPLY @5665 GOTO searched_4_ya
  IF ~~ THEN REPLY @5666 GOTO chain_what_happened
  IF ~~ THEN REPLY @5667 GOTO chain_what_happened
END

	IF ~~ THEN BEGIN searched_4_ya
	SAY @5668
	IF ~~ THEN REPLY @5669 GOTO wife_praying
	IF ~~ THEN REPLY @5670 GOTO bards_sing_ballads
	IF ~~ THEN REPLY @5671 GOTO chain_what_happened
	END
	
		IF ~~ THEN BEGIN wife_praying
		SAY @5672
		IF ~~ THEN GOTO chain_what_happened
		END
		
		IF ~~ THEN BEGIN bards_sing_ballads
		SAY @5673
		IF ~~ THEN GOTO chain_what_happened
		END

	IF ~~ THEN BEGIN believe_derro
	SAY @5674
	IF ~~ THEN REPLY @5675 GOTO 3
	IF ~~ THEN REPLY @5676 GOTO 3
	END

IF ~~ THEN BEGIN 3 
  SAY @5677 
  IF ~~ THEN REPLY @5678 GOTO 4
  IF ~~ THEN REPLY @5679 GOTO 4
  IF ~~ THEN REPLY @5680 GOTO 4
END

IF ~~ THEN BEGIN 4 
  SAY @5681 
  IF ~~ THEN GOTO 5
END

IF ~~ THEN BEGIN 5 
  SAY @5682 
  IF ~~ THEN REPLY @5683 GOTO 6
  IF ~~ THEN REPLY @5684 GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @5685 
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @5686 
  IF ~~ THEN GOTO 8
END

	IF ~~ THEN BEGIN not_interested_in_proceeding
	SAY @5687
	IF ~~ THEN REPLY @5688 GOTO 10
	IF ~~ THEN REPLY @5689 + 10
	END
	
	IF ~~ THEN BEGIN redeem_evil
	SAY @5690
	IF ~~ THEN GOTO 10
	END

IF ~~ THEN BEGIN 10 
  SAY @5691 
  IF ~~ THEN GOTO chain_take_my_head_to_helm_temple
END

CHAIN IF ~True()~ THEN AC#LANCA chain_hello_0
@5692
= 
@5693 
//== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN ~~
== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @5694
== NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @5695
== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN  @5696
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @5697
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @5698
== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @5699
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @5700
END
  IF ~~ THEN REPLY @5701 EXTERN AC#LANCA  know_me
  IF ~~ THEN REPLY @5702 EXTERN AC#LANCA  believe_me
  IF ~~ THEN REPLY @5703 EXTERN AC#LANCA  know_me
  IF ~~ THEN REPLY @5704 EXTERN AC#LANCA  searched_4_ya

CHAIN AC#LANCA chain_what_happened
@5705
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @5706
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @5707
== ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN @5708
END 
  IF ~~ THEN REPLY @5709 EXTERN AC#LANCA 3
  IF ~~ THEN REPLY @5710 EXTERN AC#LANCA believe_derro
  IF ~~ THEN REPLY @5711 EXTERN AC#LANCA 3

CHAIN AC#LANCA 8
@5712
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @5713
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @5714
// == CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN ~Die Natur lehrt uns, Gefahren zu meiden, doch manchmal müssen wir sie konfrontieren, um das Gleichgewicht zu wahren.~
== NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @5715
== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @5716 
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @5717
== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN @5718
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @5719
== ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN @5720
END 
 IF ~~ THEN REPLY @5721 EXTERN AC#LANCA not_interested_in_proceeding
  IF ~~ THEN REPLY @5722 EXTERN AC#LANCA redeem_evil
  IF ~~ THEN REPLY @5723 EXTERN AC#LANCA redeem_evil
  
CHAIN AC#LANCA chain_take_my_head_to_helm_temple 
@5724 
END
  IF ~~ THEN REPLY @5725 EXTERN AC#LANCA chain_bye_fight
  IF ~!Kit(Player1,GODHELM)~ THEN REPLY @5726 EXTERN AC#LANCA chain_bye_fight
  IF ~!Kit(Player1,GODHELM)~ THEN REPLY @5727 EXTERN AC#LANCA chain_bye_fight
  IF ~Kit(Player1,GODHELM)~ THEN REPLY @5728 EXTERN AC#LANCA chain_bye_fight
  IF ~!Kit(Player1,GODHELM)~ THEN REPLY @5729 EXTERN AC#LANCA chain_bye_fight


CHAIN AC#LANCA chain_bye_fight 
@5730
== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @5731
== AC#LANCA @5732
DO ~Enemy()~ EXIT

