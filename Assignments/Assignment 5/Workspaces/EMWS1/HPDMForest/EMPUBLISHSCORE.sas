%macro em_hpfst_score;
 
  %if %symexist(hpfst_score_input)=0 %then %let hpfst_score_input=&em_score_output;
  %if %symexist(hpfst_score_output)=0 %then %let hpfst_score_output=&em_score_output;
  %if %symexist(hpfst_id_vars)=0 %then %let hpfst_id_vars = _ALL_;
 
  %let hpvvn= %sysfunc(getoption(VALIDVARNAME));
  options validvarname=V7;
  proc hp4score data=&hpfst_score_input;
  id &hpfst_id_vars;
  %if %symexist(EM_USER_OUTMDLFILE)=0 %then %do;
      %let hpfinEM=1;
    score file="C:\Users\student\OneDrive - Bryant University\Documents\GitHub\Projects_in_R\Assignments\Assignment 5\Workspaces\EMWS1\HPDMForest\OUTMDLFILE.bin" out=&hpfst_score_output;
  %end;
  %else %do;
      %let hpfinEM=0;
      score file="&EM_USER_OUTMDLFILE" out=&hpfst_score_output;
  %end;
    PERFORMANCE  DETAILS;
  run;
 
  options validvarname=&hpvvn;
 
  data &hpfst_score_output;
     set &hpfst_score_output;
     %if &hpfinEM %then %do;
         %symdel hpfst_score_input hpfst_score_output  EM_USER_OUTMDLFILE  / nowarn; 
     %end;
%mend;
 
%em_hpfst_score;
*------------------------------------------------------------*;
*Computing Classification Vars: diagnosis;
*------------------------------------------------------------*;
length _format200 $200;
drop _format200;
_format200= ' ' ;
length _p_ 8;
_p_= 0 ;
drop _p_ ;
if P_diagnosisM - _p_ > 1E-8 then do ;
   _p_= P_diagnosisM ;
   _format200='M';
end;
if P_diagnosisB - _p_ > 1E-8 then do ;
   _p_= P_diagnosisB ;
   _format200='B';
end;
I_diagnosis=dmnorm(_format200,32); ;
length U_diagnosis $1;
label U_diagnosis = 'Unnormalized Into: diagnosis';
format U_diagnosis $1.;
if I_diagnosis='M' then
U_diagnosis='M';
if I_diagnosis='B' then
U_diagnosis='B';
