// dwarf in cemetary

BEGIN AC#MGDWC

CHAIN IF ~True()~ THEN AC#MGDWC hello_01
@4200
END
IF~~THEN REPLY @4201 EXTERN AC#MGDWC what_do_you_mean
IF~~THEN REPLY @4202 EXTERN AC#MGDWC end

	CHAIN AC#MGDWC what_do_you_mean
	@4203
	END
	IF~~THEN REPLY @4204 EXTERN AC#MGDWC know_wailing_dwarf
	IF~~THEN REPLY @4205 EXTERN AC#MGDWC end
	
		CHAIN AC#MGDWC know_wailing_dwarf
		@4206
		=
		@4207
		END
		IF~~THEN REPLY @4208 EXTERN AC#MGDWC 500_coins_too_much
		IF~PartyGoldGT(499)~THEN REPLY @4209 DO ~TakePartyGold(500)~ EXTERN AC#MGDWC 500_coins_yes
		IF~PartyGoldLT(500)~THEN REPLY @4210 EXTERN AC#MGDWC dont_have_500_coins
		IF~~THEN REPLY @4211 EXTERN AC#MGDWC end
		//IF~~THEN EXTERN AC#MGDWC know_wailing_dwarf_02
		
		CHAIN AC#MGDWC 500_coins_too_much
		@4212
		END
		IF~PartyGoldGT(499)~THEN REPLY @4213 DO ~TakePartyGold(500)~ EXTERN AC#MGDWC 500_coins_yes
		IF~PartyGoldLT(500)~THEN REPLY @4210 EXTERN AC#MGDWC dont_have_500_coins
		IF~~THEN REPLY @4211 EXTERN AC#MGDWC end
		
			CHAIN AC#MGDWC dont_have_500_coins
			@4214
			=
			@4215
			=
			@4216
			END
			IF~~THEN EXTERN AC#MGDWC know_wailing_dwarf_02
			
			CHAIN AC#MGDWC 500_coins_yes
			@4217
			== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @4218
			== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @4219
			== AC#MGDWC @4220
			END
			IF~~THEN EXTERN AC#MGDWC know_wailing_dwarf_02
		
		CHAIN AC#MGDWC know_wailing_dwarf_02
		@4221
		=
		@4222		
		END
		IF~~THEN EXTERN AC#MGDWC know_wailing_dwarf_03
		
			CHAIN AC#MGDWC know_wailing_dwarf_03
			@4223
			=
			@4224
			END
			IF~~THEN EXTERN AC#MGDWC bye

CHAIN AC#MGDWC bye
@4225
DO ~EscapeArea()~ EXIT
	
CHAIN AC#MGDWC end
@4226
DO ~EscapeArea()~ EXIT
/*
Darcia Lancameth, Bryam's widow in Athkatla's cemetary
*/
BEGIN ~AC#DARC1~

IF ~Global("AC#_LancamethPlot","GLOBAL",2)~ THEN BEGIN hello_again_02
SAY @4227
++ @4228 + pray_for_you
IF ~PartyHasItem("AC#HEAD1")~ THEN REPLY @4229 GOTO lancahead_vargouille
IF ~PartyHasItem("AC#MGLN2")~ THEN REPLY @4229 GOTO Lancahead_redeemed
IF ~OR(2)
PartyHasItem("AC#HEAD1")
PartyHasItem("AC#MGLN2")~ THEN REPLY @4230 GOTO Lancahead_head_look_eyes
END

		IF ~~ THEN BEGIN Lancahead_head_look_eyes
		SAY	@4231 
		IF ~~ THEN REPLY @4232 GOTO Lancahead_head_look_eyes_02
		END
		
		IF ~~ THEN BEGIN Lancahead_head_look_eyes_02
		SAY	@4233 
		IF ~PartyHasItem("AC#HEAD1")~ THEN GOTO lancahead_vargouille
		IF ~PartyHasItem("AC#MGLN2")~ THEN GOTO Lancahead_redeemed
		END
	IF ~~ THEN BEGIN Lancahead_redeemed
	SAY @4234
	   IF ~~ THEN DO ~TakePartyItem("AC#MGLN2")~ GOTO Lancahead_redeemed_cont 
	END
	
	IF ~~ THEN BEGIN Lancahead_redeemed_cont
	SAY @4235 
	=
	@4236
	=
	@4237
	   IF ~~ THEN GOTO Lancahead_redeemed_02 
	END
	
		IF ~~ THEN BEGIN Lancahead_redeemed_02
		SAY	@4238 
		++ @4239 + redeem_vargouille
		++ @4240 + redeem_vargouille
		++ @4241 + redeem_vargouille
		++ @4242 + husband_funeral
		++ @4243 + husband_funeral
		END
		
			IF ~~ THEN BEGIN redeem_vargouille
			SAY @4244
			IF ~~ THEN GOTO husband_funeral 
			END
			
			IF ~~ THEN BEGIN husband_funeral
			SAY @4245 
			IF ~~ THEN REPLY @4246 + husband_funeral_bye
			IF ~~ THEN REPLY @4247 + husband_funeral_bye
			IF ~~ THEN REPLY @4248 + husband_funeral_bye
			IF ~~ THEN REPLY @4249 + husband_funeral_bye
			END 
			
			
			IF ~~ THEN BEGIN husband_funeral_bye
			SAY @4250
			IF ~~ THEN DO ~SetGlobal("AC#_LancamethPlot","GLOBAL",50)
			AddexperienceParty(5000)
			ReputationInc(1)
			AddJournalEntry(@52010,QUEST_DONE)
			EscapeArea()~ EXIT
			END
	
	IF ~~ THEN BEGIN lancahead_vargouille
	SAY @4251
	   IF ~~ THEN DO ~TakePartyItem("AC#HEAD1")~ GOTO lancahead_vargouille_02 
	END

		IF ~~ THEN BEGIN lancahead_vargouille_02
		SAY	@4252 
		++ @4253 + dont_care_vargouille
		END
	
			IF ~~ THEN BEGIN dont_care_vargouille
			SAY @4254
			=
			@4255 
			IF ~~ THEN DO ~SetGlobal("AC#_LancamethPlot","GLOBAL",50)
			AddexperienceParty(1000)
			ReputationInc(-1)
			AddJournalEntry(@52009,QUEST_DONE)
			EscapeArea()~ EXIT
			END

	IF ~~ THEN BEGIN pray_for_you
	SAY @4256
	IF ~~ THEN EXIT
	END

/*
IF ~Global("AC#_TalkedToDarciaOnce","LOCALS",1)~ THEN BEGIN hello_again
SAY @4258
++ @4259 + 2
END
*/

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY @4257
IF ~~ THEN DO ~SetGlobal("AC#_TalkedToDarciaOnce","LOCALS",1)~ EXIT
END

IF ~Global("AC#_TalkedToDarciaOnce","LOCALS",1)~ THEN BEGIN hello_again
SAY @4258
++ @4259 + 2
++ @4260 + 2
++ @4261 + 2
++ @4262 + bye_no_quest
END

	IF ~~ THEN BEGIN 2
	SAY @4263
	++ @4264 + 3
	++ @4265 + no_grave
	++ @4266 + no_grave
	END

		IF ~~ THEN BEGIN 3
		SAY @4267
		++ @4268 + no_grave
		++ @4269 + no_grave
		++ @4270 + no_grave
		END

			IF ~~ THEN BEGIN no_grave			
			SAY @4271
			=
			@4272
			++ @4273 + kelemvor
			++ @4274 + kelemvor
			END

				IF ~~ THEN BEGIN kelemvor
				SAY @4275
				=
				@4276
				++ @4277 + hint
				++ @4278 + hint
				++ @4279 + hint
				++ @4280 + hint
				END

					IF ~~ THEN BEGIN hint
					SAY @4281
					++ @4282 + live_life
					++ @4283 + live_life
					++ @4284 + live_life
					++ @4285 + live_life
					END

						IF ~~ THEN BEGIN live_life
						SAY @4286
						IF ~~ THEN DO ~~ GOTO location01
						END

							IF ~~ THEN BEGIN location01
							SAY @4287
							IF ~~ THEN DO ~~ GOTO location02
							END

								IF ~~ THEN BEGIN location02
								SAY @4288
								=
								@4289
								++ @4290 + promise02
								++ @4291 + promise02
								++ @4292 + promise02
								++ @4293 + promise02
								++ @4294 + promise02
								END

									IF ~~ THEN BEGIN promise02
									SAY @4295
									++ @4296 + bard_quest
									++ @4297 + bard_quest
									++ @4298 + bard_quest
									++ @4299 + bard_quest
									END
									
									IF ~~ THEN BEGIN bard_quest
									SAY @4300
									IF ~~ THEN REPLY @4301 DO ~SetGlobal("AC#S#BardPlot","GLOBAL",1)~ + give_journal
									IF ~~ THEN REPLY @4302 DO ~SetGlobal("AC#S#BardPlot","GLOBAL",1)~ + give_journal
									IF ~~ THEN REPLY @4303 DO ~SetGlobal("AC#S#BardPlot","GLOBAL",1)~ + give_journal
									IF ~~ THEN REPLY @4304 DO ~SetGlobal("AC#S#BardPlot","GLOBAL",1)~ + tell_more_about_fellows
									END
									
										IF ~~ THEN BEGIN tell_more_about_fellows
										SAY @4305
										IF ~~ THEN REPLY @4306 + chain_about_dogwizard
										IF ~~ THEN REPLY @4307 + give_journal
										IF ~~ THEN REPLY @4308 + give_journal
										END																			

									IF ~~ THEN BEGIN give_journal
									SAY @4309 
									=
									@4310
									IF ~~ THEN DO ~SetGlobal("AC#_LancamethPlot","GLOBAL",2)
									GiveItemCreate("ac#bookl",Player1,1,0,0)
									//EraseJournalEntry(@50001)
									AddJournalEntry(@52001,QUEST)
									RevealAreaOnMap("ACIL10")~ EXIT
									END
									
									IF ~~ THEN BEGIN bye_no_quest
									SAY @4311
									IF ~~ THEN EXIT
									END

// CHAIN
CHAIN IF ~~ THEN AC#DARC1 chain_about_dogwizard
@4312
== NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @4313
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @4314
== ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN @4315
END
IF ~~ THEN REPLY @4316  EXTERN AC#DARC1 chain_about_dogwizard_02
IF ~~ THEN REPLY @4317  EXTERN AC#DARC1 chain_about_dogwizard_02
IF ~~ THEN REPLY @4307  EXTERN AC#DARC1 give_journal

CHAIN IF ~~ THEN AC#DARC1 chain_about_dogwizard_02
@4318
END
IF ~~ THEN REPLY @4319  EXTERN AC#DARC1 give_journal
IF ~~ THEN REPLY @4308 + give_journal
