601,100
602,"Process_Kill_Thread"
562,"NULL"
586,
585,
564,
565,"boa_3tI`a_1BidMrh`roPT7h;9oO@fnt4F38SP@k=WF@IaR>vh]4aMs57`V@fA4aQhr6f0Ru^oqqV31ki`qQp[4O<9um7b0UOxjesdzu_NmEb2^c:nTI0444jiP[c_[\3e`fF2sFX]\Ey4q`Y<oODIn7Wi><^9C9uLZpTXA:h^f_7WAdO016r?J:m;:n8WPzwI6WS@UH"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,","
568,""""
570,
571,
569,0
592,0
599,1000
560,2
pThread
pAciklama
561,2
2
2
590,2
pThread,""
pAciklama,""
637,2
pThread,"Thread ID'ler arasına virgül koyularak ya da tek girilebilir."
pAciklama,"Açıklama giriniz, zorunludur!"
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,61

#****Begin: Generated Statements***
#****End: Generated Statements****


IF(pAciklama@='');
    ProcessError;
ENDIF;

#==================== Operators
Dash = '-';
x='''';
p= '|';
s= '_';

# ==================================== Intialize logging
cProcess = GetProcessName( );
cTimeStamp = TimSt( Now, '\Y\m\d\h\i\s' );
cProcessReference = cProcess |'_'| cTimeStamp;
cParameterValues = pThread | p | pAciklama;
ExecuteProcess('SYS_Process_Logs_Start','ProcessName',cProcess,'ElementName',cProcessReference, 'ParameterValues', cParameterValues);

vMessage = 'Starting Process with parameters: ' | cParameterValues ;
vLogLevel = 'INFO';
ExecuteProcess('SYS_Process_Logs_Log_Message','ProcessNameWithTimeStamp',cProcessReference,'loglevel', vLogLevel,'message',vMessage);

vTimeStart = NOW;

Recordcount = 0;
Errorcount = 0;
# ================



vBatPath = 'D:\TM1\FRS\TM1Code\Process_Kill_Thread.bat';

nDelimiterIndex = 1;
sStringDelimited = pThread;
pDelimiter = ',';

While(nDelimiterIndex <> 0);
  nDelimiterIndex = Scan(pDelimiter, sStringDelimited);
  If(nDelimiterIndex = 0);
    sStringChopped = sStringDelimited;
  Else;
    sStringChopped = Trim(SubSt(sStringDelimited, 1, nDelimiterIndex - 1));
    sStringDelimited = Trim(Subst(sStringDelimited, nDelimiterIndex + Long(pDelimiter), Long(sStringDelimited)));
  EndIf;
  # Don't do anything if chopped string is blank (trailing delimiter or 2 delims next to each other)
  If(sStringChopped @<> '');
    vCmd = vBatPath | ' ' | sStringChopped;
    ExecuteCommand(vCmd, 0);
    vMessage = 'Thread ' | sStringChopped | ' is killed with the explanation of " ' | pAciklama | ' ".';
    vLogLevel = 'INFO';
    ExecuteProcess('SYS_Process_Logs_Log_Message','ProcessNameWithTimeStamp',cProcessReference,'loglevel', vLogLevel,'message',vMessage);

  EndIf;
End;


ExecuteCommand(vCmd, 0);
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,0
900,
901,
902,
938,0
937,
936,
935,
934,
932,0
933,0
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
