%macro em_hpfst_score;
 
  %if %sysfunc(exist(work._score_temp)) %then %do;
     proc delete data=work._score_temp;
     run;
  %end;
 
  %if %symexist(hpfst_score_input)=0 %then %let hpfst_score_input=&em_score_output;
  %if %symexist(hpfst_score_output)=0 %then %let hpfst_score_output=&em_score_output;
 
%let hpvvn= %sysfunc(getoption(VALIDVARNAME));
options validvarname=V7;
  proc hp4score data=&hpfst_score_input(keep=
area_mean
area_se
area_worst
compactness_mean
compactness_se
compactness_worst
concave_points_mean
concave_points_se
concave_points_worst
concavity_mean
concavity_se
concavity_worst
fractal_dimension_mean
fractal_dimension_se
fractal_dimension_worst
perimeter_mean
perimeter_se
perimeter_worst
radius_mean
radius_se
radius_worst
smoothness_mean
smoothness_se
smoothness_worst
symmetry_mean
symmetry_se
symmetry_worst
  ); 
  %if %symexist(EM_USER_OUTMDLFILE)=0 %then %do;
    score file="C:\Users\student\OneDrive - Bryant University\Documents\GitHub\Projects_in_R\Assignments\Assignment 5\Workspaces\EMWS1\HPDMForest3\OUTMDLFILE.bin" out=work._outtemp;
  %end;
  %else %do;
    score file="&EM_USER_OUTMDLFILE" out=work._outtemp;
  %end;
    PERFORMANCE  DETAILS nthreads=1;
  run;
 
options validvarname=&hpvvn;
  data work._score_temp;
     merge &hpfst_score_input work._outtemp;
  run;
 
  proc delete data=work._outtemp;
  run;
 
  data &hpfst_score_output;
    set work._score_temp;
%mend;
 
%symdel hpfst_score_input hpfst_score_output EM_USER_OUTMDLFILE/nowarn;
%em_hpfst_score;
*------------------------------------------------------------*;
*Computing Classification Vars: diagnosis;
*------------------------------------------------------------*;
length _format200 $200;
drop _format200;
length F_diagnosis $1;
label  F_diagnosis = 'From: diagnosis';
_format200= PUT( diagnosis, $1. );
F_diagnosis=dmnorm(_format200,32); ;
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
*------------------------------------------------------------*;
*Computing Residual Vars: diagnosis;
*------------------------------------------------------------*;
Length R_diagnosisM 8;
Label R_diagnosisM='Residual: diagnosis=M';
Length R_diagnosisB 8;
Label R_diagnosisB='Residual: diagnosis=B';
if 
 F_diagnosis ne 'M'
and F_diagnosis ne 'B'
 then do;
R_diagnosisM=.;
R_diagnosisB=.;
end;
else do;
R_diagnosisM= - P_diagnosisM;
R_diagnosisB= - P_diagnosisB;
select(F_diagnosis);
when('M')R_diagnosisM= R_diagnosisM+1;
when('B')R_diagnosisB= R_diagnosisB+1;
otherwise;
end;
end;
