// ---------------------------------------------
// ACIL12-Troll-Dialoge
// ---------------------------------------------

// ---------------------------------------------
// Troll #1
// ---------------------------------------------

BEGIN AC#TRO71  // Troll #1

// ---------------------------------------------
// Troll #2
// ---------------------------------------------

BEGIN AC#TRO72  // Troll # 2


IF ~~ THEN BEGIN detect_pc
SAY @5209
IF ~~ THEN DO ~Enemy()
ActionOverride("AC#TRO71",Enemy())~
EXIT
END

IF ~~ THEN BEGIN not_detect_pc
SAY @5210
IF ~~ THEN DO 
~Enemy()
/*Attack("AC#TRO71")*/
/*ActionOverride("AC#TRO71",Attack("AC#TRO71"))*/
ActionOverride("AC#TRO71",Enemy())
SetGlobal("AC#Troll_Tales","ACIL12",2)~
EXIT
END


// ---------------------------------------------
// CHAIN - Long Troll-Discussion
// ---------------------------------------------

CHAIN IF WEIGHT #-1 ~Global("AC#Troll_Tales","ACIL12",0)~ THEN AC#TRO71 1
@5202
DO ~SetGlobal("AC#Troll_Tales","ACIL12",1)~
== AC#TRO72 @5203
== AC#TRO71 @5204
== AC#TRO72 @5205
== AC#TRO71 @5206
== AC#TRO72 @5207
== AC#TRO71 @5208
END
IF ~See([PC])~ THEN EXTERN ~AC#TRO72~ detect_pc
IF ~!See([PC])~ THEN EXTERN ~AC#TRO72~ not_detect_pc

