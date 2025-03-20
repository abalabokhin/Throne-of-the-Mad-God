/***********************************************************
// Dialogues in ACIL 15
************************************************************/

BEGIN ~AC#MGFGK~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#MGFGK hello_01
@5250
END
IF~~THEN REPLY @5251 EXTERN AC#MGFGK done_for_you
IF~~THEN REPLY @5252 EXTERN AC#MGFGK you_are_the_king
IF~~THEN REPLY @5253 EXTERN AC#MGFGK fight

	CHAIN AC#MGFGK done_for_you
	@5254
	END
	IF~~THEN REPLY @5255 EXTERN AC#MGFGK fight 
	IF~~THEN REPLY @5256 EXTERN AC#MGFGK you_are_the_king
	IF~~THEN REPLY @5257 EXTERN AC#MGFGK seek_lancameth
	IF~~THEN REPLY @5258 EXTERN AC#MGFGK fight

	CHAIN AC#MGFGK you_are_the_king
	@5259
	END
	IF~~THEN REPLY @5260 EXTERN AC#MGFGK pleased_to_meet_you
	IF~~THEN REPLY @5261 EXTERN AC#MGFGK fight	
	
		CHAIN AC#MGFGK pleased_to_meet_you
		@5262
		END
		IF~~THEN REPLY @5257 EXTERN AC#MGFGK seek_lancameth		
		IF~~THEN REPLY @5263 EXTERN AC#MGFGK let_me_pass		
		IF~~THEN REPLY @5264 EXTERN AC#MGFGK fight	
		
		CHAIN AC#MGFGK let_me_pass
		@5265
		END
		IF~~THEN EXTERN AC#MGFGK fight_02
		
		CHAIN AC#MGFGK seek_lancameth
		@5266
		END
		IF~~THEN EXTERN AC#MGFGK fight_02

	CHAIN AC#MGFGK fight
	@5267
	END
	IF~~THEN EXTERN AC#MGFGK fight_02

CHAIN AC#MGFGK fight_02
@5268
END
  IF ~~ THEN DO ~SetGlobal("TalkedToMadugg","ACIL15",1)
SetGlobal("MaduggFight","ACIL15",1)
Enemy()
~ EXIT




// Dwarven statue

BEGIN AC#MG15D

CHAIN IF ~GlobalGT("PlantedItems","ACIL15",0)~ THEN AC#MG15D hello_02
@5269
EXIT

CHAIN IF ~True()~ THEN AC#MG15D hello_01
@5270
=
@5271 
EXIT

// Iremar's ghost

BEGIN AC#IREM1

CHAIN IF ~True()~ THEN AC#IREM1 hello_01
@5272
= 
@5273
END
IF~~THEN REPLY @5274 EXTERN AC#IREM1 youre_one_of_lancameths
IF~~THEN REPLY @5275 EXTERN AC#IREM1 youre_one_of_lancameths
IF~~THEN REPLY @5435 EXTERN AC#IREM1 how_next_level
IF~~THEN REPLY @5276 EXTERN AC#IREM1 leave

	CHAIN AC#IREM1 how_next_level
	@5436
	END
	IF~~THEN REPLY @5274 EXTERN AC#IREM1 youre_one_of_lancameths
	IF~~THEN REPLY @5275 EXTERN AC#IREM1 youre_one_of_lancameths
	IF~~THEN REPLY @5279 EXTERN AC#IREM1 leave
	
	CHAIN AC#IREM1 youre_one_of_lancameths
	@5277
	END
	IF~~THEN REPLY @5278 EXTERN AC#IREM1 what_happened
	IF~~THEN REPLY @5435 EXTERN AC#IREM1 how_next_level
	IF~~THEN REPLY @5279 EXTERN AC#IREM1 leave
	
		CHAIN AC#IREM1 what_happened
		@5280
		=
		@5281
		=
		@5282
		END
		IF~~THEN REPLY @5283 EXTERN AC#IREM1 redemption
		IF~~THEN REPLY @5435 EXTERN AC#IREM1 how_next_level
		IF~~THEN REPLY @5279 EXTERN AC#IREM1 leave
		
			CHAIN AC#IREM1 redemption
			@5284
			=
			@5285
			END
			IF~~THEN REPLY @5286 EXTERN AC#IREM1 leave
			IF~~THEN REPLY @5279 EXTERN AC#IREM1 leave

CHAIN AC#IREM1 leave
@5287
END
IF~Global("MetIremar","ACIL15",0)~THEN EXTERN AC#IREM1 leave_01
IF~Global("MetIremar","ACIL15",1)~THEN EXTERN AC#IREM1 leave_02

CHAIN AC#IREM1 leave_01
@5288 
DO ~AddJournalEntry(@52051,QUEST)
SetGlobal("MetIremar","ACIL15",1)~ EXIT

CHAIN AC#IREM1 leave_02
@5288 
DO ~~ EXIT

//Horn creature (disguised Derro) in area ACIL15

BEGIN AC#MG15H

CHAIN IF ~Global("TalkHorn","ACIL15",2)~ THEN AC#MG15H hello_01
@5289
END
IF~~THEN REPLY @5290 EXTERN AC#MG15H leave
IF~~THEN REPLY @5291 EXTERN AC#MG15H you_are_the_god
IF~~THEN REPLY @5292 EXTERN AC#MG15H voice_fomorian_01
IF~~THEN REPLY @5293 EXTERN AC#MG15H you_again
IF~~THEN REPLY @5294 EXTERN AC#MG15H go_look_for_yourself

	CHAIN AC#MG15H voice_fomorian_01
	@5295
	END
	IF~~THEN REPLY @5296 EXTERN AC#MG15H voice_fomorian_02
	IF~~THEN REPLY @5297 EXTERN AC#MG15H no_giant_01
	
		CHAIN AC#MG15H no_giant_01
		@5298
		EXTERN AC#MG15H end
		
		CHAIN AC#MG15H voice_fomorian_02
		@5299
		END
		IF~~THEN REPLY @5300 EXTERN AC#MG15H no_giant_01
		IF~~THEN REPLY @5301 EXTERN AC#MG15H no_giant_01

CHAIN AC#MG15H leave
@5302
DO ~~ EXIT

CHAIN AC#MG15H you_again
@5303
END
IF~~THEN REPLY @5304 EXTERN AC#MG15H go_look_for_yourself
IF~~THEN REPLY @5305 EXTERN AC#MG15H go_look_for_yourself
IF~~THEN REPLY @5306 EXTERN AC#MG15H go_look_for_yourself

CHAIN AC#MG15H you_are_the_god
@5307
==KELDORJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @5308
==AC#MG15H @5309
END
IF~~THEN REPLY @5310 EXTERN AC#MG15H no_troll
IF~~THEN REPLY @5311 EXTERN AC#MG15H go_look_for_yourself
IF~~THEN REPLY @5312 EXTERN AC#MG15H no_troll

CHAIN AC#MG15H no_troll
@5313
END
IF~~THEN REPLY @5306 EXTERN AC#MG15H go_look_for_yourself

CHAIN AC#MG15H go_look_for_yourself
@5314
EXTERN AC#MG15H end

CHAIN AC#MG15H end
@5315
DO ~SetGlobal("TalkHorn","ACIL15",10)
DestroySelf()~ EXIT

// Cranium Rat Swarm
BEGIN ~AC#15RAT~

IF ~Global("Rats_Cheese","ACIL15",10)~ THEN BEGIN hello_again_brought_cheese
SAY @5316
IF ~~ THEN REPLY @5317 GOTO questions_already
IF ~~ THEN REPLY @5318 GOTO bye_got_cheese 
END

		IF ~~ THEN BEGIN questions_already
		SAY @5319
		IF ~~ THEN GOTO questions
		END

IF ~Global("No_cranium_job","ACIL15",1)~ THEN BEGIN hello_no_cranium_job
SAY @5320
IF ~~ THEN REPLY @5321 DO ~SetGlobal("No_cranium_job","ACIL15",10)~ + cranium_job
IF ~~ THEN REPLY @5322 GOTO no_cranium_job 
END

IF ~GlobalGT("Rats_Cheese","ACIL15",0)
GlobalLT("Rats_Cheese","ACIL15",10)~ THEN BEGIN hello_again
SAY @5323
IF ~PartyHasItem("AC#CHEE1")~ THEN REPLY @5324 DO ~TakePartyItem("AC#CHEE1")~ + have_cheese
IF ~~ THEN REPLY @5322 GOTO no_cheese 
END

	IF ~~ THEN BEGIN have_cheese
	SAY @5325
	IF ~~ THEN DO ~SetGlobal("Rats_Cheese","ACIL15",10)
	AddJournalEntry(@15002,QUEST_DONE)~ GOTO have_cheese_02
	END
	
		IF ~~ THEN BEGIN have_cheese_02
		SAY @5326
		IF ~~ THEN REPLY @5317 GOTO questions
		END
		
			IF ~~ THEN BEGIN questions
			SAY @5327
			IF ~~ THEN REPLY @5328 GOTO what_do_you_have_to_tell
			IF ~~ THEN REPLY @5329 GOTO about_giants
			IF ~~ THEN REPLY @5330 GOTO about_dwarves
			IF ~~ THEN REPLY @5331 GOTO about_lancameth
			IF ~~ THEN REPLY @5332 + tell_about_you
			IF ~Global("Rats_Help_Giants","ACIL15",0)~ THEN REPLY @5333 DO ~SetGlobal("Rats_Help_Giants","ACIL15",1)~ + help_against_giants
			IF ~Global("Rats_Help_Giants","ACIL15",1)~ THEN REPLY @5334 DO ~SetGlobal("Rats_Help_Giants","ACIL15",2)~ GOTO giants_fight_deal
			IF ~~ THEN REPLY @5438 GOTO store_01
			IF ~~ THEN REPLY @5335 GOTO bye_02
			END
			
				IF ~~ THEN BEGIN store_01
				SAY @5437
				IF ~~ THEN DO ~StartStore("AC#MGRST",LastTalkedToBy)~ EXIT 
				END
			
				IF ~~ THEN BEGIN what_do_you_have_to_tell
				SAY @5336
				IF ~~ THEN REPLY @5329 GOTO about_giants
				IF ~~ THEN REPLY @5330 GOTO about_dwarves
				IF ~~ THEN REPLY @5331 GOTO about_lancameth
				IF ~~ THEN REPLY @5337 GOTO questions
				IF ~~ THEN REPLY @5338 GOTO bye_02
				END
				
					IF ~~ THEN BEGIN about_lancameth
					SAY @5339
					IF ~~ THEN REPLY @5340 GOTO about_lancameth_02
					IF ~~ THEN REPLY @5337 GOTO questions
					IF ~~ THEN REPLY @5338 GOTO bye_02
					END
					
						IF ~~ THEN BEGIN about_lancameth_02
						SAY @5341
						IF ~~ THEN REPLY @5342 GOTO about_lancameth_03
						IF ~~ THEN REPLY @5337 GOTO questions
						IF ~~ THEN REPLY @5338 GOTO bye_02
						END
						
							IF ~~ THEN BEGIN about_lancameth_03
							SAY @5343
							IF ~~ THEN REPLY @5337 GOTO questions
							IF ~~ THEN REPLY @5338 GOTO bye_02
							END
					
					IF ~~ THEN BEGIN about_dwarves
					SAY @5344
					IF ~~ THEN REPLY @5345 GOTO about_dwarves_02
					IF ~~ THEN REPLY @5337 GOTO questions
					IF ~~ THEN REPLY @5338 GOTO bye_02
					END
					
						IF ~~ THEN BEGIN about_dwarves_02
						SAY @5346
						IF ~~ THEN REPLY @5347 GOTO about_dwarves_03
						IF ~~ THEN REPLY @5337 GOTO questions
						IF ~~ THEN REPLY @5338 GOTO bye_02
						END
						
							IF ~~ THEN BEGIN about_dwarves_03
							SAY @5348
							IF ~~ THEN REPLY @5349 GOTO about_creatures
							IF ~~ THEN REPLY @5337 GOTO questions
							IF ~~ THEN REPLY @5338 GOTO bye_02
							END
							
								IF ~~ THEN BEGIN about_creatures
								SAY @5350
								IF ~~ THEN REPLY @5337 GOTO questions
								IF ~~ THEN REPLY @5338 GOTO bye_02
								END
				
					IF ~~ THEN BEGIN about_giants
					SAY @5351
					IF ~~ THEN REPLY @5352 GOTO about_giants_02
					IF ~~ THEN REPLY @5353 GOTO about_karontor
					IF ~~ THEN REPLY @5337 GOTO questions
					IF ~~ THEN REPLY @5338 GOTO bye_02
					END
					
						IF ~~ THEN BEGIN about_giants_02
						SAY @5354
						IF ~~ THEN REPLY @5353 GOTO about_karontor
						IF ~~ THEN REPLY @5337 GOTO questions
						IF ~~ THEN REPLY @5338 GOTO bye_02
						END
						
							IF ~~ THEN BEGIN about_karontor
							SAY @5355
							IF ~~ THEN REPLY @5352 GOTO about_giants_02
							IF ~~ THEN REPLY @5356 GOTO about_giants_finish
							IF ~~ THEN REPLY @5337 GOTO questions
							IF ~~ THEN REPLY @5338 GOTO bye_02
							END
							
								IF ~~ THEN BEGIN about_giants_finish
								SAY @5357
								IF ~~ THEN REPLY @5337 GOTO questions
								IF ~~ THEN REPLY @5338 GOTO bye_02
								END

				
				IF ~~ THEN BEGIN tell_about_you
				SAY @5358
				IF ~~ THEN REPLY @5337 GOTO questions
				IF ~~ THEN REPLY @5338 GOTO bye_02
				END
				
				IF ~~ THEN BEGIN help_against_giants
				SAY @5359
				IF ~~ THEN REPLY @5360 DO ~SetGlobal("Rats_Help_Giants","ACIL15",2)~ GOTO giants_fight_deal
				IF ~Dead("ac#fom01")~ THEN REPLY @5361 GOTO giants_already_dead
				IF ~~ THEN REPLY @5362 + wait_giants_fight_deal
				END
				
					IF ~~ THEN BEGIN giants_already_dead
					SAY @5363
					IF ~!Dead("AC#MGFGK")~ THEN REPLY @5364 GOTO about_giants
					IF ~~ THEN REPLY @5337 GOTO questions
					IF ~~ THEN REPLY @5338 GOTO bye_02
					END
					
					IF ~~ THEN BEGIN wait_giants_fight_deal
					SAY @5365
					IF ~~ THEN REPLY @5337 GOTO questions
					IF ~~ THEN REPLY @5338 GOTO bye_02
					END
					
					IF ~~ THEN BEGIN giants_fight_deal
					SAY @5366
					IF ~~ THEN REPLY @5337 GOTO questions
					IF ~~ THEN REPLY @5338 GOTO bye_02
					END
					
	IF ~~ THEN BEGIN bye_02
	SAY @5367
	IF ~~ THEN EXIT
	END				

	IF ~~ THEN BEGIN no_cheese
	SAY @5368
	IF ~~ THEN EXIT
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
SAY @5369
IF ~~ THEN REPLY @5370 GOTO what_where
IF ~~ THEN REPLY @5371 + what_where
IF ~~ THEN REPLY @5372 + what_where
END

IF ~Global("Rats_Cheese","ACIL15",0)~ THEN BEGIN hello_job
SAY @5373
IF ~~ THEN REPLY @5321 GOTO cranium_job
IF ~~ THEN REPLY @5322 + no_01
END

	IF ~~ THEN BEGIN what_where
	SAY @5374
	IF ~~ THEN REPLY @5375 GOTO mice
	IF ~~ THEN REPLY @5376 + who_is_it
	END
	
		IF ~~ THEN BEGIN who_is_it
		SAY @5377
		IF ~~ THEN REPLY @5378 GOTO rats_talk
		END
	
		IF ~~ THEN BEGIN mice
		SAY @5379
		IF ~~ THEN REPLY @5380 GOTO rats_talk
		END
		
			IF ~~ THEN BEGIN rats_talk
			SAY @5381
			IF ~~ THEN REPLY @5382 GOTO how_many
			IF ~~ THEN REPLY @5383 GOTO what_do_you_want
			END
			
				IF ~~ THEN BEGIN how_many
				SAY @5384
				IF ~~ THEN REPLY @5383 GOTO what_do_you_want
				END
				
					IF ~~ THEN BEGIN what_do_you_want
					SAY @5385
					IF ~~ THEN REPLY @5386 GOTO cranium_job
					IF ~~ THEN REPLY @5387 GOTO cranium_job
					IF ~~ THEN REPLY @5388 GOTO no_cranium_job
					END
					
						IF ~~ THEN BEGIN cranium_job
						SAY @5389
						IF ~~ THEN REPLY @5390 GOTO not_too_difficult
						IF ~~ THEN REPLY @5391 + why_should_i
						END
						
							IF ~~ THEN BEGIN why_should_i
							SAY @5392
							IF ~~ THEN REPLY @5393 GOTO what_kind_giants
							IF ~~ THEN REPLY @5394 + risk_fight_giants
							IF ~~ THEN REPLY @5395 + what_do_i_get
							IF ~~ THEN REPLY @5396 + forget_about_it
							END
						
							IF ~~ THEN BEGIN not_too_difficult
							SAY @5397
							IF ~~ THEN REPLY @5398 GOTO what_kind_giants
							IF ~~ THEN REPLY @5394 + risk_fight_giants
							IF ~~ THEN REPLY @5399 + no_prob_fight_giants
							END
							
									IF ~~ THEN BEGIN no_prob_fight_giants
									SAY @5400
									IF ~~ THEN GOTO risk_fight_giants
									END
								
								IF ~~ THEN BEGIN risk_fight_giants
								SAY @5401
								IF ~~ THEN REPLY @5402 GOTO what_kind_giants
								IF ~~ THEN REPLY @5395 + what_do_i_get
								IF ~~ THEN REPLY @5396 + forget_about_it
								END
							
								IF ~~ THEN BEGIN what_kind_giants
								SAY @5403
								IF ~~ THEN REPLY @5395 + what_do_i_get
								IF ~~ THEN REPLY @5396 + forget_about_it
								END
								
									IF ~~ THEN BEGIN forget_about_it
									SAY @5404
									IF ~~ THEN REPLY @5395 + what_do_i_get
									IF ~~ THEN REPLY @5405 GOTO agree_01
									IF ~~ THEN REPLY @5406 + no_01
									END
								
									IF ~~ THEN BEGIN what_do_i_get
									SAY @5407
									IF ~~ THEN REPLY @5405 GOTO agree_01 
									IF ~~ THEN REPLY @5408 + search_lancameth
									IF ~~ THEN REPLY @5396 + no_01
									END
									
											IF ~~ THEN BEGIN search_lancameth
											SAY @5409
											IF ~~ THEN GOTO agree_01
											END
									
										IF ~~ THEN BEGIN agree_01
										SAY @5410
										IF ~~ THEN REPLY @5411 GOTO help_fight
										IF ~~ THEN REPLY @5412 GOTO help_fight
										IF ~~ THEN REPLY @5413 + silently										
										END
										
											IF ~~ THEN BEGIN help_fight
											SAY @5414
											IF ~~ THEN REPLY @5415 GOTO check_on_my_own
											IF ~~ THEN REPLY @5416 + silently
											END
											
												IF ~~ THEN BEGIN silently
												SAY @5417
												IF ~~ THEN REPLY @5418 GOTO good_plan
												IF ~~ THEN REPLY @5419 GOTO stealthy_cheese
												IF ~~ THEN REPLY @5415 GOTO check_on_my_own
												END																								
											
												IF ~~ THEN BEGIN check_on_my_own
												SAY @5420
												IF ~~ THEN GOTO away_with_you
												END
																							
													IF ~~ THEN BEGIN bye
													SAY @5421
													IF ~~ THEN DO ~SetGlobal("Rats_Cheese","ACIL15",1)
													AddJournalEntry(@15000,QUEST)~ EXIT 
													END
													
													IF ~~ THEN BEGIN no_cranium_job
													SAY @5422
													IF ~~ THEN DO ~SetGlobal("No_cranium_job","ACIL15",1)~ EXIT 
													END
													
													IF ~~ THEN BEGIN no_01
													SAY @5423
													IF ~~ THEN EXIT
													END
													
													IF ~~ THEN BEGIN bye_got_cheese
													SAY @5424
													IF ~~ THEN EXIT
													END
												
												CHAIN AC#15RAT stealthy_cheese
												@5425 
												END
												IF ~~ THEN EXTERN AC#15RAT away_with_you
												
												CHAIN AC#15RAT good_plan
												@5426 
												END
												IF ~~ THEN EXTERN AC#15RAT away_with_you
												
												CHAIN AC#15RAT away_with_you
												@5431  
												END
												IF ~~ THEN REPLY @5432 EXTERN AC#15RAT search_books
												
												CHAIN AC#15RAT search_books
												@5433  
												END
												IF ~~ THEN EXTERN AC#15RAT search_books_02
												
												CHAIN AC#15RAT search_books_02
												@5434
												END
												IF ~~ THEN EXTERN AC#15RAT away_with_you_02
																								
												CHAIN AC#15RAT away_with_you_02
												@5427
												== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @5428
												== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @5429
												== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @5430
												END
												IF ~~ THEN EXTERN AC#15RAT bye

