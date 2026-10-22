*------------------------------------------------------------*;
* Neural: Create decision matrix;
*------------------------------------------------------------*;
data WORK.diagnosis;
  length   diagnosis                        $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="M"
           DECISION2="B"
           ;
  format   COUNT 10.
           ;
diagnosis="M"; COUNT=212; DATAPRIOR=0.3725834797891; TRAINPRIOR=0.3725834797891; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
diagnosis="B"; COUNT=357; DATAPRIOR=0.62741652021089; TRAINPRIOR=0.62741652021089; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify diagnosis(type=PROFIT label=diagnosis);
label DECISION1= 'M';
label DECISION2= 'B';
run;
quit;
data EM_Neural;
set EMWS1.Part_TRAIN(keep=
area_mean area_se area_worst compactness_mean compactness_se compactness_worst
concave_points_mean concave_points_se concave_points_worst concavity_mean
concavity_se concavity_worst diagnosis fractal_dimension_mean
fractal_dimension_se fractal_dimension_worst perimeter_mean perimeter_se
perimeter_worst radius_mean radius_se radius_worst smoothness_mean
smoothness_se smoothness_worst symmetry_mean symmetry_se symmetry_worst );
run;
*------------------------------------------------------------* ;
* Neural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    diagnosis(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    area_mean area_se area_worst compactness_mean compactness_se compactness_worst
   concave_points_mean concave_points_se concave_points_worst concavity_mean
   concavity_se concavity_worst fractal_dimension_mean fractal_dimension_se
   fractal_dimension_worst perimeter_mean perimeter_se perimeter_worst radius_mean
   radius_se radius_worst smoothness_mean smoothness_se smoothness_worst
   symmetry_mean symmetry_se symmetry_worst
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural
dmdbcat=WORK.Neural_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
diagnosis
;
run;
quit;
*------------------------------------------------------------* ;
* Neural: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    area_mean area_se area_worst compactness_mean compactness_se compactness_worst
   concave_points_mean concave_points_se concave_points_worst concavity_mean
   concavity_se concavity_worst fractal_dimension_mean fractal_dimension_se
   fractal_dimension_worst perimeter_mean perimeter_se perimeter_worst radius_mean
   radius_se radius_worst smoothness_mean smoothness_se smoothness_worst
   symmetry_mean symmetry_se symmetry_worst
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;

%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS1.Part_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
target diagnosis / level=NOMINAL id=diagnosis
bias
;
arch MLP
Hidden=3
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural_PRELIM_OUTEST
;
save network=EMWS1.Neural_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS1.Neural_outest estiter=1
Outfit=EMWS1.Neural_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural_INITIAL;
set EMWS1.Neural_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS1.Part_VALIDATE
network = EMWS1.Neural_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS1.Neural_INITIAL;
train tech=NONE;
code file="C:\Users\student\OneDrive - Bryant University\Documents\GitHub\Projects_in_R\Assignments\Assignment_5\Workspaces\EMWS1\Neural\SCORECODE.sas"
group=Neural
;
;
code file="C:\Users\student\OneDrive - Bryant University\Documents\GitHub\Projects_in_R\Assignments\Assignment_5\Workspaces\EMWS1\Neural\RESIDUALSCORECODE.sas"
group=Neural
residual
;
;
score data=EMWS1.Part_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural_OUTKEY;
score data=EMWS1.Part_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS1.Neural_OUTKEY;
run;
quit;
data EMWS1.Neural_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS1.Neural_EMESTIMATE;
set EMWS1.Neural_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural;
run;
quit;
