// Hammer Golem
// Dwarven statue

BEGIN AC#MGGOH

CHAIN IF ~True()~ THEN AC#MGGOH hello_01
@5800
DO ~Enemy()~ EXIT

// Avatar Diinkarazans

BEGIN ~AC#DIIN2~

/*
CHAIN IF ~Global("DiinDeath","ACIL19",1)~ THEN AC#DIIN2 hello_die
~Nein! Nein! Nicht zurück in die Abyss! Neeein!~ 
END
IF ~~ THEN DO ~SetGlobal("DiinDeath","ACIL19",10)
DestroyItem("MINHP1")
AddJournalEntry(@19010,QUEST_DONE)
Kill(Myself)~ EXIT	
*/

CHAIN IF ~Global("DiinAmbush","ACIL19",2)~ THEN AC#DIIN2 hello_ambush
@5801
END
IF ~~ THEN DO ~SetGlobal("DiinAmbush","ACIL19",0)~EXIT	
			
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#DIIN2 hello_01
@5802
=
@5803
END
IF~~THEN REPLY @5804 EXTERN AC#DIIN2 not_alone
IF~~THEN REPLY @5805 EXTERN AC#DIIN2 not_alone
IF~~THEN REPLY @5806 EXTERN AC#DIIN2 fight_02
IF~~THEN REPLY @5807 EXTERN AC#DIIN2 fight_02


CHAIN AC#DIIN2 not_alone
@5808
END
IF~Gender(Player1,FEMALE)~THEN EXTERN AC#DIIN2 mother_01
IF~Gender(Player1,MALE)~THEN EXTERN AC#DIIN2 father_01

	CHAIN IF ~~ THEN AC#DIIN2 mother_01
	@5809
	END
	IF~~THEN EXTERN AC#DIIN2 mother_02
	
		CHAIN IF ~~ THEN AC#DIIN2 mother_02
		@5810
		END
		IF~~THEN EXTERN AC#DIIN2 brother
		
	CHAIN IF ~~ THEN AC#DIIN2 father_01
	@5811
	END
	IF~~THEN EXTERN AC#DIIN2 father_02
	
		CHAIN IF ~~ THEN AC#DIIN2 father_02
		@5812 /*Moradin, forger of fate*/
		END
		IF~~THEN EXTERN AC#DIIN2 brother		

	CHAIN IF ~~ THEN AC#DIIN2 brother
	@5813
	END
	IF~~THEN EXTERN AC#DIIN2 treason

		CHAIN IF ~~ THEN AC#DIIN2 treason
		@5814
		END
		IF~~THEN EXTERN AC#DIIN2 throne

			CHAIN IF ~~ THEN AC#DIIN2 throne
			@5815
			END
			IF~~THEN EXTERN AC#DIIN2 miserable

			CHAIN IF ~~ THEN AC#DIIN2 miserable
			@5816
			END
			IF~~THEN EXTERN AC#DIIN2 fight

			CHAIN IF ~~ THEN AC#DIIN2 fight
			@5817
			END
			IF ~~ THEN DO ~SetGlobal("AC#DIINAttacks","ACIL19",1)
			Enemy()~EXIT	

			CHAIN IF ~~ THEN AC#DIIN2 fight_02
			@5818
			END
			IF ~~ THEN DO ~SetGlobal("AC#DIINAttacks","ACIL19",1)
			Enemy()~EXIT				


