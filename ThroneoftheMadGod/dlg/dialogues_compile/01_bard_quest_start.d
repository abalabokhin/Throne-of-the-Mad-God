// Bard singing ballad scene in Athkatla's Waukeen's Promenade; story start

// create peasant's blank dialogue files for CHAIN
BEGIN ~AC#MGPS1~

IF ~True()~ THEN BEGIN listener1
SAY @4000
IF ~~ THEN EXIT
END

BEGIN ~AC#MGPS2~

IF ~True()~ THEN BEGIN listener2
SAY @4001
IF ~~ THEN EXIT
END

BEGIN ~AC#MGPS3~

IF ~True()~ THEN BEGIN listener3
SAY @4002
IF ~~ THEN EXIT
END

BEGIN ~AC#MGPS4~

IF ~True()~ THEN BEGIN listener4
SAY @4003
IF ~~ THEN EXIT
END

BEGIN ~AC#MGPS5~

IF ~True()~ THEN BEGIN listener5
SAY @4004
IF ~~ THEN EXIT
END

BEGIN ~AC#MGPS6~

IF ~True()~ THEN BEGIN listener6
SAY @4005
IF ~~ THEN EXIT
END

BEGIN ~AC#MGPS7~

IF ~True()~ THEN BEGIN listener10
SAY @4006
IF ~~ THEN EXIT
END

// Gisbert the bard
BEGIN ~AC#BARD1~
/*
IF ~Global("AC#MG_Ballad_told","AR0709",1)~ THEN BEGIN hello_again
SAY ~Oh, Hallo! Wollt Ihr die Ballade noch einmal hören?~
IF ~~ THEN REPLY ~Ja, singt sie mir Bitte noch einmal vor.~ GOTO sing_again
IF ~~ THEN REPLY ~Könnt Ihr mir mehr über den Hintergrund Eurer Geschichte erzählen?~ GOTO background_01
IF ~~ THEN REPLY ~Alles, nur das nicht. Lebt wohl.~ + thanks_again_bye
IF ~~ THEN REPLY ~Wollte nur kurz vorbeischauen und bin jetzt wieder weg.~ + thanks_again_bye
END

	IF ~~ THEN BEGIN sing_again
	SAY ~He, das ist das erste Mal, dass mich jemand darum bittet, dieses Lied erneut zu singen!~
	IF ~~ THEN GOTO ballad_really_begins
	END
	
		IF ~~ THEN BEGIN ballad_end_again
		SAY ~Das ist das Ende der Ballade über "Lancameths letzte Expedition"!~ 
		IF ~~ THEN REPLY ~Könnt Ihr mir mehr über den Hintergrund Eurer Geschichte erzählen?~ GOTO background_01
				IF ~~ THEN REPLY ~Danke, dass Ihr sie mir erneut gesungen habt. Lebt wohl.~ + thanks_again_bye
		END
		
			IF ~~ THEN BEGIN thanks_again_bye
			SAY ~Ihr wisst, wo ich zu finden bin, wenn Ihr meine Ballade noch einmal hören wollt!~
			IF ~~ THEN EXIT 
			END
*/

	IF ~~ THEN BEGIN listen
	SAY @4007
	IF ~~ THEN GOTO ballad_begins
	END
	
	
	IF ~~ THEN BEGIN ballad_begins
	  SAY @4008
	  IF ~~ THEN GOTO ballad_really_begins
	END

		IF ~~ THEN BEGIN ballad_really_begins
		SAY @4009
		=
		@4010
		=
		@4011
		IF ~~ THEN DO ~~ GOTO ballad_really_begins_02
		END

		IF ~~ THEN BEGIN ballad_really_begins_02
		SAY @4012
		=
		@4013
		=
		@4014
		=
		@4015
		//IF ~~ THEN GOTO ballad_continues
		IF ~~ THEN EXTERN AC#MGPS4 chain_02
		IF ~GlobalGT("AC#MG_Ballad_told","AR0709",0)~ THEN GOTO ballad_continues
		END

		
			IF ~~ THEN BEGIN ballad_interrupt_01
			SAY @4016
			=
			@4017
			IF ~~ THEN DO ~~ GOTO ballad_continues
			END
		
		IF ~~ THEN BEGIN ballad_continues
		SAY @4018		
		=
		@4019
		=
		@4020
		=
		@4021		
		IF ~Global("AC#MG_Ballad_told","AR0709",0)~ THEN DO ~SetGlobal("AC#HeardLancaBallad","GLOBAL",1)~ GOTO ballad_end
		//IF ~GlobalGT("AC#MG_Ballad_told","AR0709",0)~ THEN GOTO ballad_end_again
		END

			IF ~~ THEN BEGIN ballad_end
			SAY @4022
			=
			@4023
			=
			@4024 
			IF ~~ THEN EXTERN AC#MGPS6 chain_03
			END
			
			IF ~~ THEN BEGIN some_money_mayhaps
			SAY @4025
			=
			@4026
			IF ~~ THEN DO ~AddJournalEntry(@50000,QUEST)~ EXIT
			END

IF ~Global("AC#HeardLancaBallad","GLOBAL",1)~ THEN BEGIN 1
SAY @4027
IF ~~ THEN REPLY @4028 + liked_ballad
IF ~~ THEN REPLY @4029 + did_not_like_ballad
IF ~~ THEN REPLY @4030 + ballad_not_bad
IF ~~ THEN REPLY @4031 + leave
END

	IF ~~ THEN BEGIN ballad_not_bad
	SAY @4032
	IF ~~ THEN REPLY @4033 GOTO true_story
	IF ~~ THEN REPLY @4034 GOTO true_story
	IF ~~ THEN REPLY @4031 + leave
	END

	IF ~~ THEN BEGIN did_not_like_ballad
	SAY @4035
	IF ~~ THEN REPLY @4036 GOTO what_inspired
	IF ~~ THEN REPLY @4031 + leave
	END
	
		IF ~~ THEN BEGIN what_inspired
		SAY @4037
		IF ~~ THEN REPLY @4038 GOTO why_true_story
		IF ~~ THEN REPLY @4039 GOTO why_true_story
		END

	IF ~~ THEN BEGIN liked_ballad
	SAY @4040
	IF ~~ THEN REPLY @4033 GOTO true_story
	IF ~~ THEN REPLY @4031 + leave
	END
	
		IF ~~ THEN BEGIN leave
		SAY @4041
		IF ~~ THEN EXIT 
		END
	
		IF ~~ THEN BEGIN true_story
		SAY @4042
		IF ~~ THEN REPLY @4043 GOTO why_true_story
		IF ~~ THEN REPLY @4039 GOTO why_true_story
		END
		
			IF ~~ THEN BEGIN why_true_story
			SAY @4044
			IF ~~ THEN REPLY @4045 GOTO background_01
			IF ~~ THEN REPLY @4046 GOTO adventures_life_end
			IF ~~ THEN REPLY @4047 GOTO story_start_02
			END

				IF ~~ THEN BEGIN background_01
				SAY @4048
				IF ~~ THEN GOTO story_start_02
				END
				
				IF ~~ THEN BEGIN adventures_life_end
				SAY @4049
				IF ~~ THEN GOTO story_start_02
				END
/*			
IF ~~ THEN BEGIN story_start_02
SAY ~Vor einigen Jahren lebte hier in Amn ein Hauptmann der amnischen Armee, der sich auch als Abenteurer einen Namen gemacht hatte. Sein Name war Bryam Lancameth, und er war wegen seines Mutes und seiner ehrhaften Art in der Bevölkerung und gleichwohl bei seinen Soldaten sehr beliebt.~
IF ~~ THEN GOTO chain_trollmountains_01
IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID) Global("AC#MG_Yosh_Lanca","AR0709",0)~ THEN EXTERN YoshJ yoshimo_lancameth
END
*/

IF ~~ THEN BEGIN story_continue
SAY @4050
=
@4051
++ @4052 + story_things
++ @4053 + story_things
++ @4054 + story_things
END

IF ~~ THEN BEGIN story_things
SAY @4055
++ @4056 + story_continue02
++ @4057 + story_continue02
++ @4054 + story_continue02
END

IF ~~ THEN BEGIN story_continue02
SAY @4058
IF ~~ THEN REPLY @4059 GOTO story_continue03
IF ~~ THEN REPLY @4060 GOTO story_continue03
IF ~~ THEN REPLY @4061 GOTO story_continue04
END

IF ~~ THEN BEGIN story_continue03
SAY @4062
IF ~~ THEN REPLY @4063 GOTO story_nhair
IF ~~ THEN REPLY @4043 GOTO story_source
IF ~~ THEN REPLY @4064 GOTO story_continue04
END

/*
IF ~~ THEN BEGIN story_continue03
SAY ~Neben Lancameth gingen noch vier weitere Helden mit ihm in die Trollberge: Nhair Ebendar, ein Halblingsdieb hier aus Athkatla, Maid Sternendorn, eine elfische Bogenschützin, die Priesterin Iremar, und ein seltsamer Magier, dessen Gesicht man nie sehen konnte, weil er es ständig hinter seinem langen Magierrock verbarg.~
IF ~~ THEN REPLY ~Erzählt mir von dem Halblingsdieb.~ GOTO story_nhair
IF ~~ THEN REPLY ~Erzählt mir von der Elfin.~ GOTO story_starthorn
IF ~~ THEN REPLY ~Erzählt mir von der Priesterin.~ GOTO story_iremar
IF ~~ THEN REPLY ~Erzählt mir von dem Magier.~ GOTO story_dogwizard
IF ~~ THEN REPLY @4043 GOTO story_source
IF ~~ THEN REPLY @4061 GOTO story_continue04
END


IF ~~ THEN BEGIN story_nhair
SAY ~Der Halbling hieß Nhair Ebendar. Er war ein bekanntes Gesicht in Athkatla. Hatte ständig Ärger mit der Stadtwache und den Schattendieben. Erwischen konnte ihn keiner von beiden, weil ihm die hier ansässigen Halblinge immer sicheren Unterschlupf gewährten.~ 
=
~Er soll einem Adeligen einen mächtigen Dolch entwendet haben, welchen er seitdem bei sich trug - und deshalb vor den Schergen des Edelmannes immerwährend auf der Flucht war. Deshalb sah er wohl das Abenteuer mit Bryam Lancameth als willkommene Gelegenheit, Gras über die Sache wachsen zu lassen.~
IF ~~ THEN GOTO story_whatelse01
IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID) Global("AC#MG_Mazzy_Nhair","AR0709",0)~ THEN EXTERN MazzyJ mazzy_nhair
END
*/

IF ~~ THEN BEGIN story_nhair
SAY @4065 
=
@4066
IF ~~ THEN GOTO story_continue04
IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID) Global("AC#MG_Mazzy_Nhair","AR0709",0)~ THEN EXTERN MazzyJ mazzy_nhair
END
/*
IF ~~ THEN BEGIN story_starthorn
SAY ~Oh, die Elfin soll eine schöne Frau gewesen sein. Nannte sich Maid Sternendorn. Wie passend - ein Stern mit Dornen? Hatte wohl eine genauso spitze Zunge wie ihre Pfeile, die sie bei sich trug. Wenn Ihr jemand krumm kam, hat sie ihm schon mal eine Salve hinterhergeschickt. Sie soll einen legendären Bogen besessen haben, der einen Regen von Pfeilen auf alle Feinde niederregnen lassen konnte...~
IF ~~ THEN GOTO story_whatelse01
END

IF ~~ THEN BEGIN story_iremar
SAY ~Die Priesterin stammte aus Eshpurta, von einem Tempel Oghmas, soweit ich weiß. Mehr kann ich Euch nicht sagen, bedaure.~
IF ~~ THEN DO ~~ GOTO story_whatelse01
END

IF ~~ THEN BEGIN story_dogwizard
SAY ~Nach allem, was ich weiß, war der ein komischer Kauz. Klein, verschlagen, geheimnisvoll. Keiner hat ihn je ein Sterbenswörtchen sagen hören. Man munkelt, dass er unter der Kapuze sein wahres Antlitz verbergen wollte. Ein Tiefling soll er gewesen sein, aber das glaube ich nicht. Für so eine Höllenbrut soll er viel zu klein und schmächtig gewesen sein - eine Art Gnom, aber viel mieser.~ 
=
~Hatte einen mächtigen Stab bei sich, mit einer Dämonenfratze als Knauf. Möchte gar nicht wissen, was man damit alles anstellen konnte. Dieser kleine Kerl nannte sich der "Hundehexer". Er war derjenige, der am Meisten über das Bauwerk wusste, weshalb Lancameth trotz des zwielichtigen Charakters auf ihn angewiesen war. Zumindest ist es das, was man sich erzählt.~
IF ~~ THEN GOTO story_whatelse01
END

IF ~~ THEN BEGIN story_whatelse01
SAY ~Wollt Ihr sonst noch etwas wissen?~
IF ~~ THEN REPLY ~Erzählt mir von dem Halblingsdieb.~ GOTO story_nhair
IF ~~ THEN REPLY ~Erzählt mir von der Elfin.~ GOTO story_starthorn
IF ~~ THEN REPLY ~Erzählt mir von der Priesterin.~ GOTO story_iremar
IF ~~ THEN REPLY ~Erzählt mir von dem Magier.~ GOTO story_dogwizard
IF ~~ THEN REPLY @4043 GOTO story_source
IF ~~ THEN REPLY ~Das wäre alles. Fahrt mit der Geschichte fort.~ GOTO story_continue04
END
*/

IF ~~ THEN BEGIN story_source
SAY @4067= 
@4068
IF ~~ THEN GOTO story_continue04
END

IF ~~ THEN BEGIN story_continue04
SAY @4069
IF ~~ THEN REPLY @4070 GOTO story_continue05
IF ~~ THEN REPLY @4071 GOTO story_continue05
IF ~~ THEN REPLY @4072 GOTO story_continue05
IF ~~ THEN REPLY @4073 GOTO story_continue05
END

IF ~~ THEN BEGIN story_continue05
SAY @4074
IF ~~ THEN REPLY @4043 GOTO story_source_02
IF ~Global("AC#MG_Ballad_told","AR0709",0)~ THEN REPLY @4075 + story_location
IF ~GlobalGT("AC#MG_Ballad_told","AR0709",0)~ THEN REPLY @4076 + story_location
IF ~~ THEN REPLY @4077 GOTO story_ballad
IF ~~ THEN REPLY @4078 GOTO story_end_01
END

IF ~~ THEN BEGIN story_ballad
SAY @4079
IF ~~ THEN REPLY @4043 GOTO story_source_02
IF ~Global("AC#MG_Ballad_told","AR0709",0)~ THEN REPLY @4075 + story_location
IF ~GlobalGT("AC#MG_Ballad_told","AR0709",0)~ THEN REPLY @4076 + story_location
IF ~~ THEN REPLY @4078 GOTO story_end_01
END

IF ~~ THEN BEGIN story_source_02
SAY @4080
IF ~Global("AC#MG_Ballad_told","AR0709",0)~ THEN REPLY @4075 + story_location
IF ~GlobalGT("AC#MG_Ballad_told","AR0709",0)~ THEN REPLY @4076 + story_location
IF ~~ THEN REPLY @4078 GOTO story_end_01
IF ~~ THEN REPLY @4081 GOTO story_ballad
END

IF ~~ THEN BEGIN story_end_01
SAY @4082
IF ~Global("AC#MG_Ballad_told","AR0709",0)~ THEN REPLY @4075 + story_location
IF ~GlobalGT("AC#MG_Ballad_told","AR0709",0)~ THEN REPLY @4076 + story_location
IF ~~ THEN REPLY @4083 + story_location 
END

IF ~~ THEN BEGIN story_location
SAY @4084 
IF ~~ THEN GOTO lancameth_widow
END	

	IF ~~ THEN BEGIN story_end_give_gold
	SAY @4085
	IF ~~ THEN DO ~TakePartyGold(10)~ GOTO story_end_02
	END

IF ~~ THEN BEGIN story_end_02
SAY @4086
IF ~~ THEN DO ~SetGlobal("AC#MG_Ballad_told","AR0709",1)
EraseJournalEntry(@50000)
AddJournalEntry(@50001,QUEST)
SetGlobal("AC#_Lancameths_Widow","GLOBAL",1)
EscapeArea()~ EXIT
END

/******************************
CHAIN
************************/
// first Dialogue

CHAIN IF WEIGHT #-1 ~Global("AC#MG_listen_ballad","AR0709",0)~ THEN AC#BARD1 chain_01 //ballad start
@4087
END
IF ~~ THEN REPLY @4088 EXTERN AC#BARD1 ballad_continue
IF ~~ THEN REPLY @4089 EXTERN AC#BARD1 ballad_continue
IF ~~ THEN REPLY @4090 EXTERN AC#BARD1 ballad_later

	CHAIN IF ~~ THEN AC#BARD1 ballad_later 
	@4091
	DO ~AddJournalEntry(@70000,QUEST)~ EXIT
	
	CHAIN IF ~~ THEN AC#BARD1 ballad_continue 
	@4092
	== AC#MGPS7 @4093
	== AC#MGPS1 @4094
	== AC#MGPS2 @4095
	== AC#MGPS3 @4096
	== AC#BARD1 @4097
	END
	IF ~~ THEN DO ~SetGlobal("AC#MG_listen_ballad","AR0709",1)
	EraseJournalEntry(@70000)~ GOTO listen

CHAIN IF ~~ THEN AC#MGPS4 chain_02 // interrupting the ballad
@4098
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @4099
== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @4100
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @4101
== AC#MGPS5 @4102
== AC#MGPS2 @4103
END
IF ~~ THEN EXTERN AC#BARD1 ballad_interrupt_01

CHAIN IF ~~ THEN AC#MGPS6 chain_03 // ballad end
@4104
== AC#MGPS7 @4105
== AC#MGPS2 @4106
== AC#MGPS3 @4107
== AC#MGPS4 @4108
== AC#MGPS1 @4109 
END
IF ~~ THEN EXTERN AC#BARD1 some_money_mayhaps

CHAIN IF ~~ THEN AC#BARD1 story_start_02
@4110
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @4111
== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN @4112
== JanJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @4113
END
IF ~~ THEN EXTERN AC#BARD1 chain_trollmountains_01

CHAIN IF ~~ THEN AC#BARD1 chain_trollmountains_01
@4114
== NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @4115
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @4116
== AC#BARD1 @4117
END
IF ~~ THEN REPLY @4118 EXTERN AC#BARD1 story_continue
IF ~~ THEN REPLY @4119 EXTERN AC#BARD1 story_continue
IF ~~ THEN REPLY @4054  EXTERN AC#BARD1 story_continue

	CHAIN IF ~~ THEN AC#BARD1 lancameth_widow
	@4120
	== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @4121
	== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @4122
	== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @4123
	== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @4124
	== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN @4125
	== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @4126
	END
	IF ~PartyGoldGT(9)~ THEN REPLY @4127 EXTERN AC#BARD1 story_end_give_gold
	IF ~~ THEN REPLY @4128 EXTERN AC#BARD1 story_end_02

// NPC dialogues
APPEND MazzyJ
IF ~~ THEN BEGIN mazzy_nhair
SAY @4129
IF ~~ THEN DO ~SetGlobal("AC#MG_Mazzy_Nhair","AR0709",1)~ EXTERN AC#BARD1 story_continue04
END
END






