BEGIN ~AC#13RI1~

CHAIN IF ~True()~ THEN AC#13RI1 hello
@4850
=
@4851 
=
@4852
=
@4853
=
@4854
EXIT

BEGIN ~AC#13RI2~

CHAIN IF ~True()~ THEN AC#13RI2 hello
@4850
=
@4855 
=
@4856
=
@4857
EXIT

BEGIN ~AC#13RI3~

CHAIN IF ~True()~ THEN AC#13RI3 hello
@4850
=
@4858 
=
@4859
=
@4860
=
@4861
EXIT

BEGIN ~AC#13RI4~

CHAIN IF ~True()~ THEN AC#13RI4 hello
@4850
=
@4862 
=
@4863
=
@4864
=
@4865
EXIT



BEGIN ~AC#13DO1~

IF ~True()~ THEN BEGIN hello_01
SAY @4866
=
@4867
=
@4868
IF ~~ THEN REPLY @4869 GOTO 01
IF ~~ THEN REPLY @4870 GOTO go_on
IF ~~ THEN REPLY @4871 GOTO go_on
END

	IF ~~ THEN BEGIN 01
	SAY @4872
	IF ~~ THEN REPLY @4873 GOTO traps
	IF ~~ THEN REPLY @4874 GOTO decipher
	IF ~~ THEN REPLY @4870 GOTO go_on
	END
	
	IF ~~ THEN BEGIN traps
	SAY @4875
	IF ~~ THEN REPLY @4876 GOTO decipher
	IF ~~ THEN REPLY @4870 GOTO go_on
	END
	
		IF ~~ THEN BEGIN decipher
		SAY @4877
		IF ~~ THEN REPLY @4878 GOTO traps
		IF ~~ THEN REPLY @4870 GOTO go_on
		END
	
	IF ~~ THEN BEGIN go_on
	SAY @4879
	IF ~~ THEN DO ~SetGlobal("Door_Riddle_Intro","ACIL13",1)
	DestroySelf()~ EXIT 
	END


/*
**********The gem riddles*******************
*/
BEGIN ~AC#13GEM~

// __________________Statue 08_________________________________________________________

IF ~Global("AC#Gem","ACIL13",8)~ THEN BEGIN Give_Sword_01
  SAY @4880
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",9)~ EXIT
END

IF ~Global("AC#Response_right","ACIL13",8)~ THEN BEGIN Give_Sword_01
  SAY @4881
  IF ~~ THEN DO ~SetGlobal("AC#Response_right","ACIL13",9)
AddexperienceParty(20000)~ EXIT
END

// __________________Frage 01_________________________________________________________

IF ~Global("AC#Gem","ACIL13",0)~ THEN BEGIN QUESTION_1
  SAY @4882
=
  @4883
  IF ~~ THEN REPLY @4884  GOTO 1
  IF ~~ THEN REPLY @4885  GOTO yes
  IF ~~ THEN REPLY @4886  GOTO no
  IF ~~ THEN REPLY @4871  GOTO 1
  IF ~~ THEN REPLY @4887  GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @4888
  IF ~~ THEN REPLY @4889  GOTO 2
  IF ~~ THEN REPLY @4890  GOTO 2
  IF ~~ THEN REPLY @4891  GOTO no
END

IF ~~ THEN BEGIN 2
  SAY @4892
  IF ~~ THEN REPLY @4885  GOTO yes
  IF ~~ THEN REPLY @4886  GOTO no
END


IF ~~ THEN BEGIN no
  SAY @4893
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",1)
  CreateCreature("AC#BLAD1",[1024.409],6)~ EXIT
END

IF ~~ THEN BEGIN yes
  SAY @4894
  IF ~~ THEN REPLY @4895  GOTO false01
  IF ~~ THEN REPLY @4896  GOTO false01
  IF ~~ THEN REPLY @4897  GOTO false01
  IF ~~ THEN REPLY @4898  GOTO right01
  IF ~~ THEN REPLY @4899  GOTO false01
  IF ~~ THEN REPLY @4900  GOTO false01
END

IF ~~ THEN BEGIN false01
  SAY @4901
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",1)
  CreateCreature("AC#BLAD1",[1024.409],6)~ EXIT
END

IF ~~ THEN BEGIN right01
  SAY @4902
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",1)
  IncrementGlobal("AC#Response_right","ACIL13",1)
  AddexperienceParty(500)~ EXIT
END

// __________________Frage 02_________________________________________________________

IF ~Global("AC#Gem","ACIL13",1)~ THEN BEGIN QUESTION_2
  SAY @4903
=
  @4883
  IF ~~ THEN REPLY @4885  GOTO yes_02
  IF ~~ THEN REPLY @4886  GOTO no_02
  IF ~~ THEN REPLY @4871  GOTO 3
  IF ~~ THEN REPLY @4904  GOTO 3
  IF ~~ THEN REPLY @4887  GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @4905
  IF ~~ THEN REPLY @4885  GOTO yes_02
  IF ~~ THEN REPLY @4886  GOTO no_02
END

IF ~~ THEN BEGIN no_02
  SAY @4893
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",2)
  CreateCreature("AC#BLAD1",[939.416],6)~ EXIT
END

IF ~~ THEN BEGIN yes_02
  SAY @4906
  IF ~~ THEN REPLY @4907  GOTO false02
  IF ~~ THEN REPLY @4908  GOTO right02
  IF ~~ THEN REPLY @4909  GOTO false02
  IF ~~ THEN REPLY @4910  GOTO false02
  IF ~~ THEN REPLY @4911  GOTO false02
  IF ~~ THEN REPLY @4912  GOTO false02
END

IF ~~ THEN BEGIN false02
  SAY @4913
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",2)
  CreateCreature("AC#BLAD1",[939.416],6)~ EXIT
END

IF ~~ THEN BEGIN right02
  SAY @4914
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",2)
  IncrementGlobal("AC#Response_right","ACIL13",1)
  AddexperienceParty(500)~ EXIT
END

// __________________Frage 03_________________________________________________________

IF ~Global("AC#Gem","ACIL13",2)~ THEN BEGIN QUESTION_3
  SAY @4903
=
  @4883
  IF ~~ THEN REPLY @4885  GOTO yes_03
  IF ~~ THEN REPLY @4886  GOTO no_03
  IF ~~ THEN REPLY @4915  GOTO 4
  IF ~~ THEN REPLY @4916  GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @4905
  IF ~~ THEN REPLY @4885  GOTO yes_03
  IF ~~ THEN REPLY @4886  GOTO no_03
END

IF ~~ THEN BEGIN no_03
  SAY @4893
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",3)
  CreateCreature("AC#BLAD1",[813.363],6)~ EXIT
END

IF ~~ THEN BEGIN yes_03
  SAY @4917
  IF ~~ THEN REPLY @4918  GOTO false03
  IF ~~ THEN REPLY @4919  GOTO false03
  IF ~~ THEN REPLY @4920  GOTO false03
  IF ~~ THEN REPLY @4921  GOTO false03
  IF ~~ THEN REPLY @4922  GOTO false03
  IF ~~ THEN REPLY @4923  GOTO right03
END

IF ~~ THEN BEGIN false03
  SAY @4924
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",3)
  CreateCreature("AC#BLAD1",[813.363],6)~ EXIT
END

IF ~~ THEN BEGIN right03
  SAY @4925
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",3)
  IncrementGlobal("AC#Response_right","ACIL13",1)
  AddexperienceParty(500)~ EXIT
END

// __________________Frage 04_________________________________________________________

IF ~Global("AC#Gem","ACIL13",3)~ THEN BEGIN QUESTION_4
  SAY @4926
=
  @4883
  IF ~~ THEN REPLY @4885  GOTO yes_04
  IF ~~ THEN REPLY @4886  GOTO no_04
  IF ~~ THEN REPLY @4927  GOTO Part_4
  IF ~~ THEN REPLY @4928 GOTO Part_4
END

IF ~~ THEN BEGIN Part_4
  SAY @4905
  IF ~~ THEN REPLY @4885  GOTO yes_04
  IF ~~ THEN REPLY @4886  GOTO no_04
END

IF ~~ THEN BEGIN no_04
  SAY @4929
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",4)
  CreateCreature("AC#BLAD1",[803.321],6)~ EXIT
END

IF ~~ THEN BEGIN yes_04
  SAY @4930
  IF ~~ THEN REPLY @4931  GOTO false04
  IF ~~ THEN REPLY @4932  GOTO false04
  IF ~~ THEN REPLY @4933  GOTO false04
  IF ~~ THEN REPLY @4934  GOTO false04
  IF ~~ THEN REPLY @4935  GOTO right04
  IF ~~ THEN REPLY @4936  GOTO false04
END

/*
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Hier noch andere Kreatur, Schattenscheusal?
*/
IF ~~ THEN BEGIN false04
  SAY @4937
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",4)
  CreateCreature("AC#BLAD1",[803.321],6)~ EXIT
END

IF ~~ THEN BEGIN right04
  SAY @4938
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",4)
  IncrementGlobal("AC#Response_right","ACIL13",1)
  AddexperienceParty(500)~ EXIT
END

// __________________Frage 05_________________________________________________________

IF ~Global("AC#Gem","ACIL13",4)~ THEN BEGIN QUESTION_5
  SAY @4939
=
  @4883
  IF ~~ THEN REPLY @4885  GOTO yes_05
  IF ~~ THEN REPLY @4886  GOTO no_05
  IF ~~ THEN REPLY @4940  GOTO Part_5
  IF ~~ THEN REPLY @4941  GOTO Part_5
END

IF ~~ THEN BEGIN Part_5
  SAY @4905
  IF ~~ THEN REPLY @4885  GOTO yes_05
  IF ~~ THEN REPLY @4886  GOTO no_05
END

IF ~~ THEN BEGIN no_05
  SAY @4942
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",5)
  CreateCreature("AC#BLAD1",[875.232],6)~ EXIT
END

IF ~~ THEN BEGIN yes_05
  SAY @4943
  IF ~~ THEN REPLY @4944  GOTO right05
  IF ~~ THEN REPLY @4945  GOTO false05
  IF ~~ THEN REPLY @4946  GOTO false05
  IF ~~ THEN REPLY @4947  GOTO false05
  IF ~~ THEN REPLY @4948  GOTO false05
  IF ~~ THEN REPLY @4949  GOTO false05
END

IF ~~ THEN BEGIN false05
  SAY @4950
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",5)
  CreateCreature("AC#BLAD1",[875.232],6)~ EXIT
END

IF ~~ THEN BEGIN right05
  SAY @4951
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",5)
  IncrementGlobal("AC#Response_right","ACIL13",1)
  AddexperienceParty(500)~ EXIT
END

// __________________Frage 06_________________________________________________________

IF ~Global("AC#Gem","ACIL13",5)~ THEN BEGIN QUESTION_6
  SAY @4952
=
  @4883
  IF ~~ THEN REPLY @4885  GOTO yes_06
  IF ~~ THEN REPLY @4886  GOTO no_06
  IF ~~ THEN REPLY @4953  GOTO Part_6
END

IF ~~ THEN BEGIN Part_6
  SAY @4905
  IF ~~ THEN REPLY @4885  GOTO yes_06
  IF ~~ THEN REPLY @4886  GOTO no_06
END

IF ~~ THEN BEGIN no_06
  SAY @4954
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",6)
CreateVisualEffect("SPPLANAR",[941.321])
Wait(2)
  CreateCreature("AC#MGTSN",[941.321],6)~ EXIT
END

IF ~~ THEN BEGIN yes_06
  SAY @4955
  IF ~~ THEN REPLY @4956  GOTO false06
  IF ~~ THEN REPLY @4957  GOTO false06
  IF ~~ THEN REPLY @4958  GOTO false06
  IF ~~ THEN REPLY @4959  GOTO right06
  IF ~~ THEN REPLY @4960  GOTO false06
  IF ~~ THEN REPLY @4961  GOTO false06
END

IF ~~ THEN BEGIN false06
  SAY @4962
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",6)
CreateVisualEffect("SPPLANAR",[941.321])
Wait(2)
CreateCreature("AC#MGTSN",[941.321],6)~ EXIT
END

IF ~~ THEN BEGIN right06
  SAY @4963
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",6)
  IncrementGlobal("AC#Response_right","ACIL13",1)
  AddexperienceParty(500)~ EXIT
END

// __________________Frage 07_________________________________________________________

IF ~Global("AC#Gem","ACIL13",6)~ THEN BEGIN QUESTION_7
  SAY @4964
=
  @4965
  IF ~~ THEN REPLY @4885  GOTO yes_07
  IF ~~ THEN REPLY @4886  GOTO no_07  
  IF ~~ THEN REPLY @4966  GOTO Part_7
END

IF ~~ THEN BEGIN Part_7
  SAY @4967
  IF ~~ THEN REPLY @4885  GOTO yes_07
  IF ~~ THEN REPLY @4886  GOTO no_07
END

IF ~~ THEN BEGIN no_07
  SAY @4968
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",7)
SetGlobal("Summon_Emeraldgolem","ACIL13",1)~ EXIT
END

IF ~~ THEN BEGIN yes_07
  SAY @4969
  IF ~~ THEN REPLY @4970  GOTO false07
  IF ~~ THEN REPLY @4971  GOTO false07
  IF ~~ THEN REPLY @4972  GOTO false07
  IF ~~ THEN REPLY @4973  GOTO right07
  IF ~~ THEN REPLY @4974  GOTO false07
  IF ~~ THEN REPLY @4975  GOTO false07
END

IF ~~ THEN BEGIN false07
  SAY @4976
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",7)
SetGlobal("Summon_Emeraldgolem","ACIL13",1)~ EXIT
END

IF ~~ THEN BEGIN right07
  SAY @4977
  IF ~~ THEN DO ~SetGlobal("AC#Gem","ACIL13",7)
  IncrementGlobal("AC#Response_right","ACIL13",1)
  SetGlobal("Last_Response_right","ACIL13",1)
  AddexperienceParty(500)~ EXIT
END
