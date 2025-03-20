//Icetroll leader
BEGIN ~AC#MGTI3~

// Firetroll Leader
BEGIN ~AC#MGTF3~

// Narg the black - Ursummnogh welcoming dialogue # 1 first dialogue with other trolls: Black troll seneshal in service of Ursummnogh the unkillable, self-declared king of Stommheim)
BEGIN ~AC#TROB2~

// Narg the black - when confronting the players
BEGIN ~AC#TROB3~
CHAIN IF ~True()~ THEN AC#TROB3 hello_01
@5000
DO ~Enemy()
Shout(151)~ EXIT


// Ursummnogh dialogue # 2 before the fight (Ursummnogh the unkillable, self-declared king of Stommheim)
BEGIN ~AC#URSU1~

IF ~~ THEN BEGIN 1 
  SAY @5001 
  IF ~~ THEN REPLY @5002 GOTO no_god
  IF ~~ THEN REPLY @5003 + only_ursu
  IF ~~ THEN REPLY @5004 + only_ursu
END


IF ~~ THEN BEGIN no_god 
  SAY @5005 
IF ~~ GOTO only_ursu
END

IF ~~ THEN BEGIN only_ursu
SAY @5006 
  IF ~~ THEN REPLY @5007 GOTO little_ones
  IF ~~ THEN REPLY @5008 GOTO search_for_lancameth
  IF ~~ THEN REPLY @5009 + fight
END

	IF ~~ THEN BEGIN search_for_lancameth
	SAY @5010
	IF ~~ THEN REPLY @5011 GOTO search_for_lancameth_02
	IF ~~ THEN REPLY @5012 GOTO let_me_go
	END
	
	IF ~~ THEN BEGIN search_for_lancameth_02 
	SAY @5013
	IF ~~ THEN GOTO fight
	END
	
IF ~~ THEN BEGIN little_ones
  SAY @5014
  IF ~~ THEN REPLY @5015 GOTO how_to_achieve_that
  IF ~~ THEN REPLY @5016 GOTO go_to_little
  IF ~~ THEN REPLY @5017 GOTO go_to_little
END

	IF ~~ THEN BEGIN go_to_little 
	SAY @5018
	IF ~~ THEN GOTO fight
	END
	
	IF ~~ THEN BEGIN let_me_go 
	SAY @5019
	IF ~~ THEN GOTO fight
	END

IF ~~ THEN BEGIN final_fight 
  SAY @5020
  IF ~~ THEN DO ~Enemy()
SetGlobal("Fight_Ursu","ACIL14",1)~ EXIT
END

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#URSU1 hello_intruder 
@5021 
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @5022
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @5023
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @5024
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @5025
END
IF ~~ THEN REPLY @5026 EXTERN AC#URSU1 1 // ~Unkillable? Unlikely.~
IF ~~ THEN REPLY @5027 EXTERN AC#URSU1 1
IF ~~ THEN REPLY @5028 EXTERN AC#URSU1 1
IF ~~ THEN REPLY @5029 EXTERN AC#URSU1 1

CHAIN AC#URSU1 how_to_achieve_that 
@5030
END
  IF ~~ THEN REPLY @5031 GOTO fight
  IF ~~ THEN REPLY @5032 GOTO fight
  IF ~~ THEN REPLY @5033 GOTO fight
  
 CHAIN AC#URSU1 fight 
@5034
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @5035
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @5036
END
  IF ~~ THEN EXTERN AC#URSU1 final_fight




// CHAIN____________
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#TROB2 chain_hello_00
@5037 DO ~SetGlobal("Ursummnogh","ACIL14",1)~ 
== AC#MGTI3 @5038
== AC#MGTF3 @5039
== AC#MGTI3 @5040
== AC#MGTF3 @5041
== AC#TROB2 @5042
== AC#MGTF3 @5043
== AC#TROB2 @5044
== AC#MGTI3 @5045
== AC#TROB2 @5046
== AC#MGTF3 @5047
== AC#TROB2 @5048
== AC#MGTF3 @5049
== AC#MGTI3 @5050
== AC#TROB2 @5051 
== AC#MGTI3 @5052
== AC#TROB2 @5053
== AC#MGTI3 @5054
== AC#TROB2 @5055
== AC#MGTF3 @5056
== AC#TROB2 @5057 
== AC#MGTI3 @5058
== AC#TROB2 @5059
== AC#MGTF3 @5060
== AC#MGTI3 @5061
== AC#TROB2 @5062
END
IF ~~ THEN DO ~ActionOverride("cutspy",DestroySelf())
SetGlobal("Meet_Ursu","ACIL14",1)
EscapeAreaObject("TrACIL15")~ EXIT

// Fire Giant Leader

BEGIN AC#MGFGL

CHAIN IF ~True()~ THEN AC#MGFGL hello_01
@5063
=
@5064
EXIT

// Detonating slave

BEGIN AC#MG14S

CHAIN IF ~Global("SlaveBoom","ACIL14",1)~ THEN AC#MG14S hello_01
@5065
EXIT

CHAIN IF ~Global("SlaveBoom","ACIL14",2)~ THEN AC#MG14S hello_02
@5066
END
IF~~THEN REPLY @5067 EXTERN AC#MG14S end
IF~~THEN REPLY @5068 EXTERN AC#MG14S why_imprisoned

CHAIN AC#MG14S why_imprisoned
@5069
END
IF~~THEN EXTERN AC#MG14S end

CHAIN AC#MG14S end
@5070
DO ~SetGlobal("SlaveBoom","ACIL14",10)
ForceSpellRES("AC#MGVC",Myself)~ EXIT

//Horn creature (disguised Derro) in area ACIL14

BEGIN AC#MG14H

CHAIN IF ~Global("TalkHorn","ACIL14",2)~ THEN AC#MG14H hello_01
@5071
END
IF~~THEN REPLY @5072 EXTERN AC#MG14H you_are_the_god
IF~~THEN REPLY @5073 EXTERN AC#MG14H vaprak_obey
IF~~THEN REPLY @5074 EXTERN AC#MG14H vaprak_obey_false
IF~~THEN REPLY @5075 EXTERN AC#MG14H no_troll
IF~~THEN REPLY @5076 EXTERN AC#MG14H end
IF~~THEN REPLY @5077 EXTERN AC#MG14H leave

	CHAIN AC#MG14H vaprak_obey_false
	@5078
	EXTERN AC#MG14H who_are_you

CHAIN AC#MG14H vaprak_obey
@5079
END
IF~~THEN REPLY @5080 EXTERN AC#MG14H no_troll
IF~~THEN REPLY @5081 EXTERN AC#MG14H where_slaves_to
IF~~THEN REPLY @5082 EXTERN AC#MG14H vaprak_obey_false

CHAIN AC#MG14H where_slaves_to
@5083
END
IF~~THEN REPLY @5080 EXTERN AC#MG14H no_troll
IF~~THEN REPLY @5084 EXTERN AC#MG14H idiot
IF~~THEN REPLY @5085 EXTERN AC#MG14H speak_louder
IF~~THEN REPLY @5086 EXTERN AC#MG14H where_slaves_to

	CHAIN AC#MG14H speak_louder
	@5087
	END
	IF~~THEN REPLY @5088 EXTERN AC#MG14H go_look_for_yourself
	IF~~THEN REPLY @5080 EXTERN AC#MG14H no_troll
	IF~~THEN REPLY @5089 EXTERN AC#MG14H no_troll

CHAIN AC#MG14H you_are_the_god
@5090
==KELDORJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @5091
==AC#MG14H @5092
END
IF~~THEN REPLY @5080 EXTERN AC#MG14H no_troll
IF~~THEN REPLY @5074 EXTERN AC#MG14H vaprak_obey
IF~~THEN REPLY @5093 EXTERN AC#MG14H no_troll

CHAIN AC#MG14H no_troll
@5094 
EXTERN AC#MG14H who_are_you

CHAIN AC#MG14H who_are_you
@5095
END
IF~~THEN REPLY @5096 EXTERN AC#MG14H go_look_for_yourself
IF~~THEN REPLY @5097 EXTERN AC#MG14H go_look_for_yourself
IF~~THEN REPLY @5098 EXTERN AC#MG14H go_look_for_yourself
IF~~THEN REPLY @5099 EXTERN AC#MG14H go_look_for_yourself

CHAIN AC#MG14H idiot
@5100
EXTERN AC#MG14H end_ursummnogh

CHAIN AC#MG14H go_look_for_yourself
@5101
EXTERN AC#MG14H end

CHAIN AC#MG14H end
@5102 
EXTERN AC#MG14H end_ursummnogh

CHAIN AC#MG14H end_ursummnogh
@5103
DO ~SetGlobal("TalkHorn","ACIL14",10)
DestroySelf()~ EXIT

CHAIN AC#MG14H leave
@5104
DO ~~ EXIT


// Nhair Ebendar

BEGIN ~AC#NHAIR~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#NHAIR hello_01
@5105
END
IF~~THEN DO ~AddJournalEntry(@52050,QUEST)~ EXTERN AC#NHAIR seek_bryam_intro


CHAIN IF ~True()~ THEN AC#NHAIR hello_02
@5106
EXIT

	CHAIN AC#NHAIR seek_bryam_intro
	@5107
	END
	IF~~THEN REPLY @5108 EXTERN AC#NHAIR what_happened
	IF~~THEN REPLY @5109 EXTERN AC#NHAIR what_happened
	IF~~THEN REPLY @5110 EXTERN AC#NHAIR ghost
	IF~~THEN REPLY @5111 EXTERN AC#NHAIR end

		CHAIN AC#NHAIR what_happened
		@5112
		END
		IF~~THEN REPLY @5113 EXTERN AC#NHAIR what_happened_02
		IF~~THEN REPLY @5114 EXTERN AC#NHAIR what_happened_02
		IF~~THEN REPLY @5115 EXTERN AC#NHAIR what_happened_to_the_others
		IF~~THEN REPLY @5116 EXTERN AC#NHAIR end
		
			CHAIN AC#NHAIR what_happened_02
			@5117 
			== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @5118
			== AC#NHAIR @5119
			END
			IF~~THEN REPLY @5120 EXTERN AC#NHAIR who_traitor
			IF~~THEN REPLY @5121 EXTERN AC#NHAIR who_traitor
			IF~~THEN REPLY @5122 EXTERN AC#NHAIR end
			
			CHAIN AC#NHAIR who_traitor
			@5123
			END
			IF~~THEN REPLY @5124 EXTERN AC#NHAIR who_traitor_02
			IF~~THEN REPLY @5125 EXTERN AC#NHAIR what_happened_to_the_others
			IF~~THEN REPLY @5111 EXTERN AC#NHAIR end
			
				CHAIN AC#NHAIR what_happened_to_the_others
				@5126
				== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @5127			
				== AC#NHAIR @5128
				END
				IF~~THEN REPLY @5129 EXTERN AC#NHAIR who_traitor_02
				IF~~THEN REPLY @5130 EXTERN AC#NHAIR send_party_member
				IF~~THEN REPLY @5131 EXTERN AC#NHAIR end
				
					CHAIN AC#NHAIR send_party_member
					@5132
					END
					IF~~THEN REPLY @5133 EXTERN AC#NHAIR bye
					IF~~THEN REPLY @5134 EXTERN AC#NHAIR gold_and_gems
					IF~~THEN REPLY @5135 EXTERN AC#NHAIR bye
			
				CHAIN AC#NHAIR ghost
				@5136
				== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @5137
				== AC#NHAIR @5138
				END
				IF~~THEN REPLY @5139 EXTERN AC#NHAIR what_happened
				IF~~THEN REPLY @5108 EXTERN AC#NHAIR what_happened
				IF~~THEN REPLY @5140 EXTERN AC#NHAIR end
				
				CHAIN AC#NHAIR who_traitor_02
				@5141
				END
				IF~~THEN REPLY @5142 EXTERN AC#NHAIR bye
				IF~~THEN REPLY @5143 EXTERN AC#NHAIR gold_and_gems
				IF~~THEN REPLY @5135 EXTERN AC#NHAIR bye
				
					CHAIN AC#NHAIR gold_and_gems
					@5144
					END
					IF~~THEN EXTERN AC#NHAIR bye

CHAIN AC#NHAIR bye
@5145
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @5146
EXIT


CHAIN AC#NHAIR end
@5106
EXIT

// gnome alchimist

BEGIN ~AC#JAM01~

IF ~NumberOfTimesTalkedTo(0)
!CombatCounter(0)
~ THEN BEGIN 0 
  SAY @5147 
  IF ~~ THEN EXIT
END

IF ~!CombatCounter(0)
~ THEN BEGIN 1
  SAY @5148 
  IF ~~ THEN EXIT
END

IF ~Global("AC#TalkedToJamrry","GLOBAL",1)
~ THEN BEGIN 2
  SAY @5149 
  IF ~~ THEN REPLY @5150GOTO 18
  IF ~~ THEN REPLY @5151 GOTO 19
  IF ~~ THEN REPLY @5152 GOTO 21
END

IF ~CombatCounter(0)
Global("AC#TalkedToJamrry","GLOBAL",0)
~ THEN BEGIN 3 
  SAY @5153 
  IF ~~ THEN REPLY @5154 GOTO 4
  IF ~~ THEN REPLY @5155 GOTO 4
END

IF ~~ THEN BEGIN 4 
  SAY @5156 
  IF ~~ THEN REPLY @5157  GOTO 5
  IF ~~ THEN REPLY @5158  GOTO 5
END

IF ~~ THEN BEGIN 5 
  SAY @5159 
  IF ~~ THEN REPLY @5160  GOTO 6
  IF ~~ THEN REPLY @5161  GOTO 7
  IF ~~ THEN REPLY @5162  GOTO met_justice
END

	IF ~~ THEN BEGIN met_justice
	SAY @5163
	IF ~~ THEN GOTO 7
	END

IF ~~ THEN BEGIN 6 
  SAY @5164 
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 7 
  SAY @5165 
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8 
  SAY @5166 
  IF ~~ THEN REPLY @5167  GOTO 15
  IF ~~ THEN REPLY @5168  GOTO 9
  IF ~~ THEN REPLY @5169  GOTO 10
  IF ~~ THEN REPLY @5170  GOTO 11
END

IF ~~ THEN BEGIN 9 
  SAY @5171 
  IF ~~ THEN REPLY @5172 GOTO 14
END

IF ~~ THEN BEGIN 10 
  SAY @5173 
  IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 11 
  SAY @5174 
  IF ~~ THEN JOURNAL @80000 DO ~GiveItemCreate("POTN52",Player1,5,0,0)~ GOTO 12
END

IF ~~ THEN BEGIN 12 
  SAY @5175 
  IF ~~ THEN REPLY @5176  GOTO 16
  IF ~~ THEN REPLY @5177  GOTO 13
END

IF ~~ THEN BEGIN 13 
  SAY @5178 
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 14 
  SAY @5179 
  IF ~~ THEN REPLY @5167 GOTO 15
  IF ~~ THEN REPLY @5169  GOTO 10
END

IF ~~ THEN BEGIN 15 
  SAY @5180 
  IF ~~ THEN REPLY @5168  GOTO 9
  IF ~~ THEN REPLY @5169 GOTO 10
END

/*
IF ~~ THEN BEGIN 16 
  SAY @5181 
  IF ~~ THEN REPLY @5182 GOTO 13
  IF ~CheckStatGT(LastTalkedToBy(Myself),14,CHR)~ THEN REPLY @5183  GOTO 17
  IF ~CheckStatLT(LastTalkedToBy(Myself),15,CHR)~ THEN REPLY @5184  GOTO 22
END
*/

/*
IF ~~ THEN BEGIN 16 
  SAY @5181 
  IF ~~ THEN REPLY @5182 GOTO 13
  IF ~~ THEN REPLY @5183  GOTO 17
  IF ~!IsValidForPartyDialog("Jaheira")
!IsValidForPartyDialog("Korgan")~ THEN REPLY @5184  GOTO 17
IF ~IsValidForPartyDialog("Jaheira")
!IsValidForPartyDialog("Korgan")~ THEN REPLY @5184 EXTERN ~JAHEIRAJ~ Jaheira_Comment_Jamrry
IF ~IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Jaheira")~ THEN REPLY @5184 EXTERN ~KORGANJ~ Korgan_Comment_Jamrry
END
*/

IF ~~ THEN BEGIN 16 
  SAY @5181 
  IF ~~ THEN REPLY @5182 GOTO 13
  IF ~~ THEN REPLY @5183  GOTO 17
END

IF ~~ THEN BEGIN 17 
  SAY @5185 
  IF ~~ THEN DO ~SetGlobal("AC#TalkedToJamrry","GLOBAL",1)
~ GOTO 23
END

IF ~~ THEN BEGIN 18 
  SAY @5186
  IF ~~ THEN DO ~StartStore("ac#jamst",LastTalkedToBy)
~ EXIT
END

IF ~~ THEN BEGIN 19 
  SAY @5187 
  IF ~~ THEN REPLY @5150  GOTO 18
  IF ~~ THEN REPLY @5188  GOTO 20
END

IF ~~ THEN BEGIN 20 
  SAY @5189 
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 21
  SAY @5190
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 22
  SAY @5191 
  IF ~!IsValidForPartyDialog("Jaheira")
!IsValidForPartyDialog("Korgan")~ THEN REPLY @5177 GOTO 13
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Jamrry
IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Comment_Jamrry
END

IF ~~ THEN BEGIN 23
  SAY @5192
  IF ~~ THEN JOURNAL @80001 EXIT
END

IF ~~ THEN BEGIN 24
  SAY @5193
  IF ~~ THEN EXTERN ~KORGANJ~ Korgan_Comment_Jamrry_02
END

IF ~~ THEN BEGIN 25
  SAY @5194
  IF ~~ THEN EXTERN ~KORGANJ~ Korgan_Comment_Jamrry_03
END

IF ~~ THEN BEGIN 26
  SAY @5195
IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Comment_Korgan
IF ~!IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~KORGANJ~ Korgan_Comment_Jamrry_04
END
						
/*******************************************************************************************************
NPC-Dialoge
*******************************************************************************************************/

APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN Jaheira_Comment_Jamrry
   SAY @5196
   IF ~~ THEN EXTERN ~AC#JAM01~ 17
END

IF ~~ THEN BEGIN Jaheira_Comment_Korgan
   SAY @5197
   IF ~~ THEN EXTERN ~KORGANJ~ Korgan_Comment_Jamrry_04
END
END

APPEND ~KORGANJ~
IF ~~ THEN BEGIN Korgan_Comment_Jamrry
   SAY @5198
   IF ~~ THEN EXTERN ~AC#JAM01~ 24
END

IF ~~ THEN BEGIN Korgan_Comment_Jamrry_02
   SAY @5199
   IF ~~ THEN EXTERN ~AC#JAM01~ 25
END

IF ~~ THEN BEGIN Korgan_Comment_Jamrry_03
   SAY @5200
   IF ~~ THEN EXTERN ~AC#JAM01~ 26
END

IF ~~ THEN BEGIN Korgan_Comment_Jamrry_04
   SAY @5201
   IF ~~ THEN EXTERN ~AC#JAM01~ 17
END
END

	