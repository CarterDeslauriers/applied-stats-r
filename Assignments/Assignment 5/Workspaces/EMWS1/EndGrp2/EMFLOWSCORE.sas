*------------------------------------------------------------*;
* EndGrp2: ;
* User: student;
* Date: 21OCT26: 21:52;
*------------------------------------------------------------* ;
* Ensemble Code;
*------------------------------------------------------------* ;
* Boosting: Loop=1;
* Temporary Variables;
drop EndGrp2_P_diagnosisM;
EndGrp2_P_diagnosisM = 0;
drop EndGrp2_P_diagnosisB;
EndGrp2_P_diagnosisB = 0;
*------------------------------------------------------------*;
* Grp2: StartGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=1;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Reg2: Regression;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=1;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;
 
length _WARN_ $4;
label _WARN_ = 'Warnings' ;
 
length I_diagnosis $ 1;
label I_diagnosis = 'Into: diagnosis' ;
*** Target Values;
array REG2_1DRF [2] $1 _temporary_ ('M' 'B' );
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
format U_diagnosis $1.;
length U_diagnosis $ 1;
*** Unnormalized target values;
array REG2_1DRU[2] $ 1 _temporary_ ('M'  'B' );
 
*** Generate dummy variables for diagnosis ;
drop _Y ;
label F_diagnosis = 'From: diagnosis' ;
length F_diagnosis $ 1;
F_diagnosis = put( diagnosis , $1. );
%DMNORMIP( F_diagnosis )
if missing( diagnosis ) then do;
   _Y = .;
end;
else do;
   if F_diagnosis = 'B'  then do;
      _Y = 1;
   end;
   else if F_diagnosis = 'M'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;
 
drop _DM_BAD;
_DM_BAD=0;
 
*** Check area_mean for missing values ;
if missing( area_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check area_se for missing values ;
if missing( area_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check area_worst for missing values ;
if missing( area_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_mean for missing values ;
if missing( compactness_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_se for missing values ;
if missing( compactness_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_worst for missing values ;
if missing( compactness_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_mean for missing values ;
if missing( concave_points_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_se for missing values ;
if missing( concave_points_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_worst for missing values ;
if missing( concave_points_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_mean for missing values ;
if missing( concavity_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_se for missing values ;
if missing( concavity_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_worst for missing values ;
if missing( concavity_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_mean for missing values ;
if missing( fractal_dimension_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_se for missing values ;
if missing( fractal_dimension_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_worst for missing values ;
if missing( fractal_dimension_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_mean for missing values ;
if missing( perimeter_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_se for missing values ;
if missing( perimeter_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_worst for missing values ;
if missing( perimeter_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_mean for missing values ;
if missing( radius_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_se for missing values ;
if missing( radius_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_worst for missing values ;
if missing( radius_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_mean for missing values ;
if missing( smoothness_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_se for missing values ;
if missing( smoothness_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_worst for missing values ;
if missing( smoothness_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_mean for missing values ;
if missing( symmetry_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_se for missing values ;
if missing( symmetry_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_worst for missing values ;
if missing( symmetry_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.3712121212;
   _P1 = 0.6287878788;
   goto REG2_1DR1;
end;
 
*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;
 
***  Effect: area_mean ;
_TEMP = area_mean ;
_LP0 = _LP0 + (    1.19732382581434 * _TEMP);
 
***  Effect: area_se ;
_TEMP = area_se ;
_LP0 = _LP0 + (   -0.09732383569849 * _TEMP);
 
***  Effect: area_worst ;
_TEMP = area_worst ;
_LP0 = _LP0 + (   -0.04158598332551 * _TEMP);
 
***  Effect: compactness_mean ;
_TEMP = compactness_mean ;
_LP0 = _LP0 + (   -665.259139333744 * _TEMP);
 
***  Effect: compactness_se ;
_TEMP = compactness_se ;
_LP0 = _LP0 + (   -1212.18009582732 * _TEMP);
 
***  Effect: compactness_worst ;
_TEMP = compactness_worst ;
_LP0 = _LP0 + (   -228.250857311031 * _TEMP);
 
***  Effect: concave_points_mean ;
_TEMP = concave_points_mean ;
_LP0 = _LP0 + (    2104.83612339332 * _TEMP);
 
***  Effect: concave_points_se ;
_TEMP = concave_points_se ;
_LP0 = _LP0 + (    5692.93777275704 * _TEMP);
 
***  Effect: concave_points_worst ;
_TEMP = concave_points_worst ;
_LP0 = _LP0 + (   -418.513740335603 * _TEMP);
 
***  Effect: concavity_mean ;
_TEMP = concavity_mean ;
_LP0 = _LP0 + (    285.945571665868 * _TEMP);
 
***  Effect: concavity_se ;
_TEMP = concavity_se ;
_LP0 = _LP0 + (   -1151.84974870707 * _TEMP);
 
***  Effect: concavity_worst ;
_TEMP = concavity_worst ;
_LP0 = _LP0 + (     288.51057672911 * _TEMP);
 
***  Effect: fractal_dimension_mean ;
_TEMP = fractal_dimension_mean ;
_LP0 = _LP0 + (     1881.3973294501 * _TEMP);
 
***  Effect: fractal_dimension_se ;
_TEMP = fractal_dimension_se ;
_LP0 = _LP0 + (   -10365.9521507599 * _TEMP);
 
***  Effect: fractal_dimension_worst ;
_TEMP = fractal_dimension_worst ;
_LP0 = _LP0 + (      2260.168996093 * _TEMP);
 
***  Effect: perimeter_mean ;
_TEMP = perimeter_mean ;
_LP0 = _LP0 + (    12.6555034649052 * _TEMP);
 
***  Effect: perimeter_se ;
_TEMP = perimeter_se ;
_LP0 = _LP0 + (   -46.4281554814431 * _TEMP);
 
***  Effect: perimeter_worst ;
_TEMP = perimeter_worst ;
_LP0 = _LP0 + (    3.78970976514252 * _TEMP);
 
***  Effect: radius_mean ;
_TEMP = radius_mean ;
_LP0 = _LP0 + (   -192.543344019586 * _TEMP);
 
***  Effect: radius_se ;
_TEMP = radius_se ;
_LP0 = _LP0 + (    484.358950155994 * _TEMP);
 
***  Effect: radius_worst ;
_TEMP = radius_worst ;
_LP0 = _LP0 + (   -6.35708730821204 * _TEMP);
 
***  Effect: smoothness_mean ;
_TEMP = smoothness_mean ;
_LP0 = _LP0 + (   -1480.98358646814 * _TEMP);
 
***  Effect: smoothness_se ;
_TEMP = smoothness_se ;
_LP0 = _LP0 + (    7840.25089134688 * _TEMP);
 
***  Effect: smoothness_worst ;
_TEMP = smoothness_worst ;
_LP0 = _LP0 + (   -934.955582717609 * _TEMP);
 
***  Effect: symmetry_mean ;
_TEMP = symmetry_mean ;
_LP0 = _LP0 + (    179.354483291215 * _TEMP);
 
***  Effect: symmetry_se ;
_TEMP = symmetry_se ;
_LP0 = _LP0 + (   -5533.54536542254 * _TEMP);
 
***  Effect: symmetry_worst ;
_TEMP = symmetry_worst ;
_LP0 = _LP0 + (    539.118459242061 * _TEMP);
 
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     323.152401149218 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;
 
REG2_1DR1:
 
*** Residuals;
if (_Y = .) then do;
   R_diagnosisM = .;
   R_diagnosisB = .;
end;
else do;
    label R_diagnosisM = 'Residual: diagnosis=M' ;
    label R_diagnosisB = 'Residual: diagnosis=B' ;
   R_diagnosisM = - _P0;
   R_diagnosisB = - _P1;
   select( _Y );
      when (0)  R_diagnosisM = R_diagnosisM + 1;
      when (1)  R_diagnosisB = R_diagnosisB + 1;
   end;
end;
 
*** Posterior Probabilities and Predicted Level;
label P_diagnosisM = 'Predicted: diagnosis=M' ;
label P_diagnosisB = 'Predicted: diagnosis=B' ;
P_diagnosisM = _P0;
_MAXP = _P0;
_IY = 1;
P_diagnosisB = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_diagnosis = REG2_1DRF[_IY];
U_diagnosis = REG2_1DRU[_IY];
 
*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* EndGrp2: EndGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=1;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Boosting: Saving Probabilities for Next Iteration;
*------------------------------------------------------------*;
EndGrp2_P_diagnosisM = P_diagnosisM;
EndGrp2_P_diagnosisB = P_diagnosisB;
*------------------------------------------------------------*;
* Grp2: StartGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Reg2: Regression;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=2;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;
 
length _WARN_ $4;
label _WARN_ = 'Warnings' ;
 
length I_diagnosis $ 1;
label I_diagnosis = 'Into: diagnosis' ;
*** Target Values;
array REG2_2DRF [2] $1 _temporary_ ('M' 'B' );
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
format U_diagnosis $1.;
length U_diagnosis $ 1;
*** Unnormalized target values;
array REG2_2DRU[2] $ 1 _temporary_ ('M'  'B' );
 
*** Generate dummy variables for diagnosis ;
drop _Y ;
label F_diagnosis = 'From: diagnosis' ;
length F_diagnosis $ 1;
F_diagnosis = put( diagnosis , $1. );
%DMNORMIP( F_diagnosis )
if missing( diagnosis ) then do;
   _Y = .;
end;
else do;
   if F_diagnosis = 'B'  then do;
      _Y = 1;
   end;
   else if F_diagnosis = 'M'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;
 
drop _DM_BAD;
_DM_BAD=0;
 
*** Check area_mean for missing values ;
if missing( area_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check area_se for missing values ;
if missing( area_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check area_worst for missing values ;
if missing( area_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_mean for missing values ;
if missing( compactness_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_se for missing values ;
if missing( compactness_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_worst for missing values ;
if missing( compactness_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_mean for missing values ;
if missing( concave_points_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_se for missing values ;
if missing( concave_points_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_worst for missing values ;
if missing( concave_points_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_mean for missing values ;
if missing( concavity_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_se for missing values ;
if missing( concavity_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_worst for missing values ;
if missing( concavity_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_mean for missing values ;
if missing( fractal_dimension_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_se for missing values ;
if missing( fractal_dimension_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_worst for missing values ;
if missing( fractal_dimension_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_mean for missing values ;
if missing( perimeter_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_se for missing values ;
if missing( perimeter_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_worst for missing values ;
if missing( perimeter_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_mean for missing values ;
if missing( radius_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_se for missing values ;
if missing( radius_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_worst for missing values ;
if missing( radius_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_mean for missing values ;
if missing( smoothness_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_se for missing values ;
if missing( smoothness_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_worst for missing values ;
if missing( smoothness_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_mean for missing values ;
if missing( symmetry_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_se for missing values ;
if missing( symmetry_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_worst for missing values ;
if missing( symmetry_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.3712121212;
   _P1 = 0.6287878788;
   goto REG2_2DR1;
end;
 
*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;
 
***  Effect: area_mean ;
_TEMP = area_mean ;
_LP0 = _LP0 + (    1.19732382581434 * _TEMP);
 
***  Effect: area_se ;
_TEMP = area_se ;
_LP0 = _LP0 + (   -0.09732383569849 * _TEMP);
 
***  Effect: area_worst ;
_TEMP = area_worst ;
_LP0 = _LP0 + (   -0.04158598332551 * _TEMP);
 
***  Effect: compactness_mean ;
_TEMP = compactness_mean ;
_LP0 = _LP0 + (   -665.259139333744 * _TEMP);
 
***  Effect: compactness_se ;
_TEMP = compactness_se ;
_LP0 = _LP0 + (   -1212.18009582732 * _TEMP);
 
***  Effect: compactness_worst ;
_TEMP = compactness_worst ;
_LP0 = _LP0 + (   -228.250857311031 * _TEMP);
 
***  Effect: concave_points_mean ;
_TEMP = concave_points_mean ;
_LP0 = _LP0 + (    2104.83612339332 * _TEMP);
 
***  Effect: concave_points_se ;
_TEMP = concave_points_se ;
_LP0 = _LP0 + (    5692.93777275704 * _TEMP);
 
***  Effect: concave_points_worst ;
_TEMP = concave_points_worst ;
_LP0 = _LP0 + (   -418.513740335603 * _TEMP);
 
***  Effect: concavity_mean ;
_TEMP = concavity_mean ;
_LP0 = _LP0 + (    285.945571665868 * _TEMP);
 
***  Effect: concavity_se ;
_TEMP = concavity_se ;
_LP0 = _LP0 + (   -1151.84974870707 * _TEMP);
 
***  Effect: concavity_worst ;
_TEMP = concavity_worst ;
_LP0 = _LP0 + (     288.51057672911 * _TEMP);
 
***  Effect: fractal_dimension_mean ;
_TEMP = fractal_dimension_mean ;
_LP0 = _LP0 + (     1881.3973294501 * _TEMP);
 
***  Effect: fractal_dimension_se ;
_TEMP = fractal_dimension_se ;
_LP0 = _LP0 + (   -10365.9521507599 * _TEMP);
 
***  Effect: fractal_dimension_worst ;
_TEMP = fractal_dimension_worst ;
_LP0 = _LP0 + (      2260.168996093 * _TEMP);
 
***  Effect: perimeter_mean ;
_TEMP = perimeter_mean ;
_LP0 = _LP0 + (    12.6555034649052 * _TEMP);
 
***  Effect: perimeter_se ;
_TEMP = perimeter_se ;
_LP0 = _LP0 + (   -46.4281554814431 * _TEMP);
 
***  Effect: perimeter_worst ;
_TEMP = perimeter_worst ;
_LP0 = _LP0 + (    3.78970976514252 * _TEMP);
 
***  Effect: radius_mean ;
_TEMP = radius_mean ;
_LP0 = _LP0 + (   -192.543344019586 * _TEMP);
 
***  Effect: radius_se ;
_TEMP = radius_se ;
_LP0 = _LP0 + (    484.358950155994 * _TEMP);
 
***  Effect: radius_worst ;
_TEMP = radius_worst ;
_LP0 = _LP0 + (   -6.35708730821204 * _TEMP);
 
***  Effect: smoothness_mean ;
_TEMP = smoothness_mean ;
_LP0 = _LP0 + (   -1480.98358646814 * _TEMP);
 
***  Effect: smoothness_se ;
_TEMP = smoothness_se ;
_LP0 = _LP0 + (    7840.25089134688 * _TEMP);
 
***  Effect: smoothness_worst ;
_TEMP = smoothness_worst ;
_LP0 = _LP0 + (   -934.955582717609 * _TEMP);
 
***  Effect: symmetry_mean ;
_TEMP = symmetry_mean ;
_LP0 = _LP0 + (    179.354483291215 * _TEMP);
 
***  Effect: symmetry_se ;
_TEMP = symmetry_se ;
_LP0 = _LP0 + (   -5533.54536542254 * _TEMP);
 
***  Effect: symmetry_worst ;
_TEMP = symmetry_worst ;
_LP0 = _LP0 + (    539.118459242061 * _TEMP);
 
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     323.152401149218 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;
 
REG2_2DR1:
 
*** Residuals;
if (_Y = .) then do;
   R_diagnosisM = .;
   R_diagnosisB = .;
end;
else do;
    label R_diagnosisM = 'Residual: diagnosis=M' ;
    label R_diagnosisB = 'Residual: diagnosis=B' ;
   R_diagnosisM = - _P0;
   R_diagnosisB = - _P1;
   select( _Y );
      when (0)  R_diagnosisM = R_diagnosisM + 1;
      when (1)  R_diagnosisB = R_diagnosisB + 1;
   end;
end;
 
*** Posterior Probabilities and Predicted Level;
label P_diagnosisM = 'Predicted: diagnosis=M' ;
label P_diagnosisB = 'Predicted: diagnosis=B' ;
P_diagnosisM = _P0;
_MAXP = _P0;
_IY = 1;
P_diagnosisB = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_diagnosis = REG2_2DRF[_IY];
U_diagnosis = REG2_2DRU[_IY];
 
*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* EndGrp2: EndGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Boosting: accumulate probabilities for iteration: 2;
*------------------------------------------------------------*;
_sum =0;
P_diagnosisM = EndGrp2_P_diagnosisM*(1/2) + P_diagnosisM*(1/2);
_sum = _sum + P_diagnosisM ;
P_diagnosisB = EndGrp2_P_diagnosisB*(1/2) + P_diagnosisB*(1/2);
_sum = _sum + P_diagnosisB ;
if _sum > 1E-8 then do;
   P_diagnosisM = P_diagnosisM/_sum;
   P_diagnosisB = P_diagnosisB/_sum;
end;
*------------------------------------------------------------*;
* Boosting: Saving Probabilities for Next Iteration;
*------------------------------------------------------------*;
EndGrp2_P_diagnosisM = P_diagnosisM;
EndGrp2_P_diagnosisB = P_diagnosisB;
*------------------------------------------------------------*;
* Grp2: StartGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Reg2: Regression;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=3;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;
 
length _WARN_ $4;
label _WARN_ = 'Warnings' ;
 
length I_diagnosis $ 1;
label I_diagnosis = 'Into: diagnosis' ;
*** Target Values;
array REG2_3DRF [2] $1 _temporary_ ('M' 'B' );
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
format U_diagnosis $1.;
length U_diagnosis $ 1;
*** Unnormalized target values;
array REG2_3DRU[2] $ 1 _temporary_ ('M'  'B' );
 
*** Generate dummy variables for diagnosis ;
drop _Y ;
label F_diagnosis = 'From: diagnosis' ;
length F_diagnosis $ 1;
F_diagnosis = put( diagnosis , $1. );
%DMNORMIP( F_diagnosis )
if missing( diagnosis ) then do;
   _Y = .;
end;
else do;
   if F_diagnosis = 'B'  then do;
      _Y = 1;
   end;
   else if F_diagnosis = 'M'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;
 
drop _DM_BAD;
_DM_BAD=0;
 
*** Check area_mean for missing values ;
if missing( area_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check area_se for missing values ;
if missing( area_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check area_worst for missing values ;
if missing( area_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_mean for missing values ;
if missing( compactness_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_se for missing values ;
if missing( compactness_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_worst for missing values ;
if missing( compactness_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_mean for missing values ;
if missing( concave_points_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_se for missing values ;
if missing( concave_points_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_worst for missing values ;
if missing( concave_points_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_mean for missing values ;
if missing( concavity_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_se for missing values ;
if missing( concavity_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_worst for missing values ;
if missing( concavity_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_mean for missing values ;
if missing( fractal_dimension_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_se for missing values ;
if missing( fractal_dimension_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_worst for missing values ;
if missing( fractal_dimension_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_mean for missing values ;
if missing( perimeter_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_se for missing values ;
if missing( perimeter_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_worst for missing values ;
if missing( perimeter_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_mean for missing values ;
if missing( radius_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_se for missing values ;
if missing( radius_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_worst for missing values ;
if missing( radius_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_mean for missing values ;
if missing( smoothness_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_se for missing values ;
if missing( smoothness_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_worst for missing values ;
if missing( smoothness_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_mean for missing values ;
if missing( symmetry_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_se for missing values ;
if missing( symmetry_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_worst for missing values ;
if missing( symmetry_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.3712121212;
   _P1 = 0.6287878788;
   goto REG2_3DR1;
end;
 
*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;
 
***  Effect: area_mean ;
_TEMP = area_mean ;
_LP0 = _LP0 + (    1.19732382581434 * _TEMP);
 
***  Effect: area_se ;
_TEMP = area_se ;
_LP0 = _LP0 + (   -0.09732383569849 * _TEMP);
 
***  Effect: area_worst ;
_TEMP = area_worst ;
_LP0 = _LP0 + (   -0.04158598332551 * _TEMP);
 
***  Effect: compactness_mean ;
_TEMP = compactness_mean ;
_LP0 = _LP0 + (   -665.259139333744 * _TEMP);
 
***  Effect: compactness_se ;
_TEMP = compactness_se ;
_LP0 = _LP0 + (   -1212.18009582732 * _TEMP);
 
***  Effect: compactness_worst ;
_TEMP = compactness_worst ;
_LP0 = _LP0 + (   -228.250857311031 * _TEMP);
 
***  Effect: concave_points_mean ;
_TEMP = concave_points_mean ;
_LP0 = _LP0 + (    2104.83612339332 * _TEMP);
 
***  Effect: concave_points_se ;
_TEMP = concave_points_se ;
_LP0 = _LP0 + (    5692.93777275704 * _TEMP);
 
***  Effect: concave_points_worst ;
_TEMP = concave_points_worst ;
_LP0 = _LP0 + (   -418.513740335603 * _TEMP);
 
***  Effect: concavity_mean ;
_TEMP = concavity_mean ;
_LP0 = _LP0 + (    285.945571665868 * _TEMP);
 
***  Effect: concavity_se ;
_TEMP = concavity_se ;
_LP0 = _LP0 + (   -1151.84974870707 * _TEMP);
 
***  Effect: concavity_worst ;
_TEMP = concavity_worst ;
_LP0 = _LP0 + (     288.51057672911 * _TEMP);
 
***  Effect: fractal_dimension_mean ;
_TEMP = fractal_dimension_mean ;
_LP0 = _LP0 + (     1881.3973294501 * _TEMP);
 
***  Effect: fractal_dimension_se ;
_TEMP = fractal_dimension_se ;
_LP0 = _LP0 + (   -10365.9521507599 * _TEMP);
 
***  Effect: fractal_dimension_worst ;
_TEMP = fractal_dimension_worst ;
_LP0 = _LP0 + (      2260.168996093 * _TEMP);
 
***  Effect: perimeter_mean ;
_TEMP = perimeter_mean ;
_LP0 = _LP0 + (    12.6555034649052 * _TEMP);
 
***  Effect: perimeter_se ;
_TEMP = perimeter_se ;
_LP0 = _LP0 + (   -46.4281554814431 * _TEMP);
 
***  Effect: perimeter_worst ;
_TEMP = perimeter_worst ;
_LP0 = _LP0 + (    3.78970976514252 * _TEMP);
 
***  Effect: radius_mean ;
_TEMP = radius_mean ;
_LP0 = _LP0 + (   -192.543344019586 * _TEMP);
 
***  Effect: radius_se ;
_TEMP = radius_se ;
_LP0 = _LP0 + (    484.358950155994 * _TEMP);
 
***  Effect: radius_worst ;
_TEMP = radius_worst ;
_LP0 = _LP0 + (   -6.35708730821204 * _TEMP);
 
***  Effect: smoothness_mean ;
_TEMP = smoothness_mean ;
_LP0 = _LP0 + (   -1480.98358646814 * _TEMP);
 
***  Effect: smoothness_se ;
_TEMP = smoothness_se ;
_LP0 = _LP0 + (    7840.25089134688 * _TEMP);
 
***  Effect: smoothness_worst ;
_TEMP = smoothness_worst ;
_LP0 = _LP0 + (   -934.955582717609 * _TEMP);
 
***  Effect: symmetry_mean ;
_TEMP = symmetry_mean ;
_LP0 = _LP0 + (    179.354483291215 * _TEMP);
 
***  Effect: symmetry_se ;
_TEMP = symmetry_se ;
_LP0 = _LP0 + (   -5533.54536542254 * _TEMP);
 
***  Effect: symmetry_worst ;
_TEMP = symmetry_worst ;
_LP0 = _LP0 + (    539.118459242061 * _TEMP);
 
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     323.152401149218 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;
 
REG2_3DR1:
 
*** Residuals;
if (_Y = .) then do;
   R_diagnosisM = .;
   R_diagnosisB = .;
end;
else do;
    label R_diagnosisM = 'Residual: diagnosis=M' ;
    label R_diagnosisB = 'Residual: diagnosis=B' ;
   R_diagnosisM = - _P0;
   R_diagnosisB = - _P1;
   select( _Y );
      when (0)  R_diagnosisM = R_diagnosisM + 1;
      when (1)  R_diagnosisB = R_diagnosisB + 1;
   end;
end;
 
*** Posterior Probabilities and Predicted Level;
label P_diagnosisM = 'Predicted: diagnosis=M' ;
label P_diagnosisB = 'Predicted: diagnosis=B' ;
P_diagnosisM = _P0;
_MAXP = _P0;
_IY = 1;
P_diagnosisB = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_diagnosis = REG2_3DRF[_IY];
U_diagnosis = REG2_3DRU[_IY];
 
*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* EndGrp2: EndGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Boosting: accumulate probabilities for iteration: 3;
*------------------------------------------------------------*;
_sum =0;
P_diagnosisM = EndGrp2_P_diagnosisM*(2/3) + P_diagnosisM*(1/3);
_sum = _sum + P_diagnosisM ;
P_diagnosisB = EndGrp2_P_diagnosisB*(2/3) + P_diagnosisB*(1/3);
_sum = _sum + P_diagnosisB ;
if _sum > 1E-8 then do;
   P_diagnosisM = P_diagnosisM/_sum;
   P_diagnosisB = P_diagnosisB/_sum;
end;
*------------------------------------------------------------*;
* Boosting: Saving Probabilities for Next Iteration;
*------------------------------------------------------------*;
EndGrp2_P_diagnosisM = P_diagnosisM;
EndGrp2_P_diagnosisB = P_diagnosisB;
*------------------------------------------------------------*;
* Grp2: StartGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Reg2: Regression;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=4;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;
 
length _WARN_ $4;
label _WARN_ = 'Warnings' ;
 
length I_diagnosis $ 1;
label I_diagnosis = 'Into: diagnosis' ;
*** Target Values;
array REG2_4DRF [2] $1 _temporary_ ('M' 'B' );
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
format U_diagnosis $1.;
length U_diagnosis $ 1;
*** Unnormalized target values;
array REG2_4DRU[2] $ 1 _temporary_ ('M'  'B' );
 
*** Generate dummy variables for diagnosis ;
drop _Y ;
label F_diagnosis = 'From: diagnosis' ;
length F_diagnosis $ 1;
F_diagnosis = put( diagnosis , $1. );
%DMNORMIP( F_diagnosis )
if missing( diagnosis ) then do;
   _Y = .;
end;
else do;
   if F_diagnosis = 'B'  then do;
      _Y = 1;
   end;
   else if F_diagnosis = 'M'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;
 
drop _DM_BAD;
_DM_BAD=0;
 
*** Check area_mean for missing values ;
if missing( area_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check area_se for missing values ;
if missing( area_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check area_worst for missing values ;
if missing( area_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_mean for missing values ;
if missing( compactness_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_se for missing values ;
if missing( compactness_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_worst for missing values ;
if missing( compactness_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_mean for missing values ;
if missing( concave_points_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_se for missing values ;
if missing( concave_points_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_worst for missing values ;
if missing( concave_points_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_mean for missing values ;
if missing( concavity_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_se for missing values ;
if missing( concavity_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_worst for missing values ;
if missing( concavity_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_mean for missing values ;
if missing( fractal_dimension_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_se for missing values ;
if missing( fractal_dimension_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_worst for missing values ;
if missing( fractal_dimension_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_mean for missing values ;
if missing( perimeter_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_se for missing values ;
if missing( perimeter_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_worst for missing values ;
if missing( perimeter_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_mean for missing values ;
if missing( radius_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_se for missing values ;
if missing( radius_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_worst for missing values ;
if missing( radius_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_mean for missing values ;
if missing( smoothness_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_se for missing values ;
if missing( smoothness_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_worst for missing values ;
if missing( smoothness_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_mean for missing values ;
if missing( symmetry_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_se for missing values ;
if missing( symmetry_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_worst for missing values ;
if missing( symmetry_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.3712121212;
   _P1 = 0.6287878788;
   goto REG2_4DR1;
end;
 
*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;
 
***  Effect: area_mean ;
_TEMP = area_mean ;
_LP0 = _LP0 + (    1.19732382581434 * _TEMP);
 
***  Effect: area_se ;
_TEMP = area_se ;
_LP0 = _LP0 + (   -0.09732383569849 * _TEMP);
 
***  Effect: area_worst ;
_TEMP = area_worst ;
_LP0 = _LP0 + (   -0.04158598332551 * _TEMP);
 
***  Effect: compactness_mean ;
_TEMP = compactness_mean ;
_LP0 = _LP0 + (   -665.259139333744 * _TEMP);
 
***  Effect: compactness_se ;
_TEMP = compactness_se ;
_LP0 = _LP0 + (   -1212.18009582732 * _TEMP);
 
***  Effect: compactness_worst ;
_TEMP = compactness_worst ;
_LP0 = _LP0 + (   -228.250857311031 * _TEMP);
 
***  Effect: concave_points_mean ;
_TEMP = concave_points_mean ;
_LP0 = _LP0 + (    2104.83612339332 * _TEMP);
 
***  Effect: concave_points_se ;
_TEMP = concave_points_se ;
_LP0 = _LP0 + (    5692.93777275704 * _TEMP);
 
***  Effect: concave_points_worst ;
_TEMP = concave_points_worst ;
_LP0 = _LP0 + (   -418.513740335603 * _TEMP);
 
***  Effect: concavity_mean ;
_TEMP = concavity_mean ;
_LP0 = _LP0 + (    285.945571665868 * _TEMP);
 
***  Effect: concavity_se ;
_TEMP = concavity_se ;
_LP0 = _LP0 + (   -1151.84974870707 * _TEMP);
 
***  Effect: concavity_worst ;
_TEMP = concavity_worst ;
_LP0 = _LP0 + (     288.51057672911 * _TEMP);
 
***  Effect: fractal_dimension_mean ;
_TEMP = fractal_dimension_mean ;
_LP0 = _LP0 + (     1881.3973294501 * _TEMP);
 
***  Effect: fractal_dimension_se ;
_TEMP = fractal_dimension_se ;
_LP0 = _LP0 + (   -10365.9521507599 * _TEMP);
 
***  Effect: fractal_dimension_worst ;
_TEMP = fractal_dimension_worst ;
_LP0 = _LP0 + (      2260.168996093 * _TEMP);
 
***  Effect: perimeter_mean ;
_TEMP = perimeter_mean ;
_LP0 = _LP0 + (    12.6555034649052 * _TEMP);
 
***  Effect: perimeter_se ;
_TEMP = perimeter_se ;
_LP0 = _LP0 + (   -46.4281554814431 * _TEMP);
 
***  Effect: perimeter_worst ;
_TEMP = perimeter_worst ;
_LP0 = _LP0 + (    3.78970976514252 * _TEMP);
 
***  Effect: radius_mean ;
_TEMP = radius_mean ;
_LP0 = _LP0 + (   -192.543344019586 * _TEMP);
 
***  Effect: radius_se ;
_TEMP = radius_se ;
_LP0 = _LP0 + (    484.358950155994 * _TEMP);
 
***  Effect: radius_worst ;
_TEMP = radius_worst ;
_LP0 = _LP0 + (   -6.35708730821204 * _TEMP);
 
***  Effect: smoothness_mean ;
_TEMP = smoothness_mean ;
_LP0 = _LP0 + (   -1480.98358646814 * _TEMP);
 
***  Effect: smoothness_se ;
_TEMP = smoothness_se ;
_LP0 = _LP0 + (    7840.25089134688 * _TEMP);
 
***  Effect: smoothness_worst ;
_TEMP = smoothness_worst ;
_LP0 = _LP0 + (   -934.955582717609 * _TEMP);
 
***  Effect: symmetry_mean ;
_TEMP = symmetry_mean ;
_LP0 = _LP0 + (    179.354483291215 * _TEMP);
 
***  Effect: symmetry_se ;
_TEMP = symmetry_se ;
_LP0 = _LP0 + (   -5533.54536542254 * _TEMP);
 
***  Effect: symmetry_worst ;
_TEMP = symmetry_worst ;
_LP0 = _LP0 + (    539.118459242061 * _TEMP);
 
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     323.152401149218 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;
 
REG2_4DR1:
 
*** Residuals;
if (_Y = .) then do;
   R_diagnosisM = .;
   R_diagnosisB = .;
end;
else do;
    label R_diagnosisM = 'Residual: diagnosis=M' ;
    label R_diagnosisB = 'Residual: diagnosis=B' ;
   R_diagnosisM = - _P0;
   R_diagnosisB = - _P1;
   select( _Y );
      when (0)  R_diagnosisM = R_diagnosisM + 1;
      when (1)  R_diagnosisB = R_diagnosisB + 1;
   end;
end;
 
*** Posterior Probabilities and Predicted Level;
label P_diagnosisM = 'Predicted: diagnosis=M' ;
label P_diagnosisB = 'Predicted: diagnosis=B' ;
P_diagnosisM = _P0;
_MAXP = _P0;
_IY = 1;
P_diagnosisB = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_diagnosis = REG2_4DRF[_IY];
U_diagnosis = REG2_4DRU[_IY];
 
*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* EndGrp2: EndGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Boosting: accumulate probabilities for iteration: 4;
*------------------------------------------------------------*;
_sum =0;
P_diagnosisM = EndGrp2_P_diagnosisM*(3/4) + P_diagnosisM*(1/4);
_sum = _sum + P_diagnosisM ;
P_diagnosisB = EndGrp2_P_diagnosisB*(3/4) + P_diagnosisB*(1/4);
_sum = _sum + P_diagnosisB ;
if _sum > 1E-8 then do;
   P_diagnosisM = P_diagnosisM/_sum;
   P_diagnosisB = P_diagnosisB/_sum;
end;
*------------------------------------------------------------*;
* Boosting: Saving Probabilities for Next Iteration;
*------------------------------------------------------------*;
EndGrp2_P_diagnosisM = P_diagnosisM;
EndGrp2_P_diagnosisB = P_diagnosisB;
*------------------------------------------------------------*;
* Grp2: StartGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Reg2: Regression;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=5;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;
 
length _WARN_ $4;
label _WARN_ = 'Warnings' ;
 
length I_diagnosis $ 1;
label I_diagnosis = 'Into: diagnosis' ;
*** Target Values;
array REG2_5DRF [2] $1 _temporary_ ('M' 'B' );
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
format U_diagnosis $1.;
length U_diagnosis $ 1;
*** Unnormalized target values;
array REG2_5DRU[2] $ 1 _temporary_ ('M'  'B' );
 
*** Generate dummy variables for diagnosis ;
drop _Y ;
label F_diagnosis = 'From: diagnosis' ;
length F_diagnosis $ 1;
F_diagnosis = put( diagnosis , $1. );
%DMNORMIP( F_diagnosis )
if missing( diagnosis ) then do;
   _Y = .;
end;
else do;
   if F_diagnosis = 'B'  then do;
      _Y = 1;
   end;
   else if F_diagnosis = 'M'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;
 
drop _DM_BAD;
_DM_BAD=0;
 
*** Check area_mean for missing values ;
if missing( area_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check area_se for missing values ;
if missing( area_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check area_worst for missing values ;
if missing( area_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_mean for missing values ;
if missing( compactness_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_se for missing values ;
if missing( compactness_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check compactness_worst for missing values ;
if missing( compactness_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_mean for missing values ;
if missing( concave_points_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_se for missing values ;
if missing( concave_points_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concave_points_worst for missing values ;
if missing( concave_points_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_mean for missing values ;
if missing( concavity_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_se for missing values ;
if missing( concavity_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check concavity_worst for missing values ;
if missing( concavity_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_mean for missing values ;
if missing( fractal_dimension_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_se for missing values ;
if missing( fractal_dimension_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check fractal_dimension_worst for missing values ;
if missing( fractal_dimension_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_mean for missing values ;
if missing( perimeter_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_se for missing values ;
if missing( perimeter_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check perimeter_worst for missing values ;
if missing( perimeter_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_mean for missing values ;
if missing( radius_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_se for missing values ;
if missing( radius_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check radius_worst for missing values ;
if missing( radius_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_mean for missing values ;
if missing( smoothness_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_se for missing values ;
if missing( smoothness_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check smoothness_worst for missing values ;
if missing( smoothness_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_mean for missing values ;
if missing( symmetry_mean ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_se for missing values ;
if missing( symmetry_se ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
 
*** Check symmetry_worst for missing values ;
if missing( symmetry_worst ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.3712121212;
   _P1 = 0.6287878788;
   goto REG2_5DR1;
end;
 
*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;
 
***  Effect: area_mean ;
_TEMP = area_mean ;
_LP0 = _LP0 + (    1.19732382581434 * _TEMP);
 
***  Effect: area_se ;
_TEMP = area_se ;
_LP0 = _LP0 + (   -0.09732383569849 * _TEMP);
 
***  Effect: area_worst ;
_TEMP = area_worst ;
_LP0 = _LP0 + (   -0.04158598332551 * _TEMP);
 
***  Effect: compactness_mean ;
_TEMP = compactness_mean ;
_LP0 = _LP0 + (   -665.259139333744 * _TEMP);
 
***  Effect: compactness_se ;
_TEMP = compactness_se ;
_LP0 = _LP0 + (   -1212.18009582732 * _TEMP);
 
***  Effect: compactness_worst ;
_TEMP = compactness_worst ;
_LP0 = _LP0 + (   -228.250857311031 * _TEMP);
 
***  Effect: concave_points_mean ;
_TEMP = concave_points_mean ;
_LP0 = _LP0 + (    2104.83612339332 * _TEMP);
 
***  Effect: concave_points_se ;
_TEMP = concave_points_se ;
_LP0 = _LP0 + (    5692.93777275704 * _TEMP);
 
***  Effect: concave_points_worst ;
_TEMP = concave_points_worst ;
_LP0 = _LP0 + (   -418.513740335603 * _TEMP);
 
***  Effect: concavity_mean ;
_TEMP = concavity_mean ;
_LP0 = _LP0 + (    285.945571665868 * _TEMP);
 
***  Effect: concavity_se ;
_TEMP = concavity_se ;
_LP0 = _LP0 + (   -1151.84974870707 * _TEMP);
 
***  Effect: concavity_worst ;
_TEMP = concavity_worst ;
_LP0 = _LP0 + (     288.51057672911 * _TEMP);
 
***  Effect: fractal_dimension_mean ;
_TEMP = fractal_dimension_mean ;
_LP0 = _LP0 + (     1881.3973294501 * _TEMP);
 
***  Effect: fractal_dimension_se ;
_TEMP = fractal_dimension_se ;
_LP0 = _LP0 + (   -10365.9521507599 * _TEMP);
 
***  Effect: fractal_dimension_worst ;
_TEMP = fractal_dimension_worst ;
_LP0 = _LP0 + (      2260.168996093 * _TEMP);
 
***  Effect: perimeter_mean ;
_TEMP = perimeter_mean ;
_LP0 = _LP0 + (    12.6555034649052 * _TEMP);
 
***  Effect: perimeter_se ;
_TEMP = perimeter_se ;
_LP0 = _LP0 + (   -46.4281554814431 * _TEMP);
 
***  Effect: perimeter_worst ;
_TEMP = perimeter_worst ;
_LP0 = _LP0 + (    3.78970976514252 * _TEMP);
 
***  Effect: radius_mean ;
_TEMP = radius_mean ;
_LP0 = _LP0 + (   -192.543344019586 * _TEMP);
 
***  Effect: radius_se ;
_TEMP = radius_se ;
_LP0 = _LP0 + (    484.358950155994 * _TEMP);
 
***  Effect: radius_worst ;
_TEMP = radius_worst ;
_LP0 = _LP0 + (   -6.35708730821204 * _TEMP);
 
***  Effect: smoothness_mean ;
_TEMP = smoothness_mean ;
_LP0 = _LP0 + (   -1480.98358646814 * _TEMP);
 
***  Effect: smoothness_se ;
_TEMP = smoothness_se ;
_LP0 = _LP0 + (    7840.25089134688 * _TEMP);
 
***  Effect: smoothness_worst ;
_TEMP = smoothness_worst ;
_LP0 = _LP0 + (   -934.955582717609 * _TEMP);
 
***  Effect: symmetry_mean ;
_TEMP = symmetry_mean ;
_LP0 = _LP0 + (    179.354483291215 * _TEMP);
 
***  Effect: symmetry_se ;
_TEMP = symmetry_se ;
_LP0 = _LP0 + (   -5533.54536542254 * _TEMP);
 
***  Effect: symmetry_worst ;
_TEMP = symmetry_worst ;
_LP0 = _LP0 + (    539.118459242061 * _TEMP);
 
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     323.152401149218 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;
 
REG2_5DR1:
 
*** Residuals;
if (_Y = .) then do;
   R_diagnosisM = .;
   R_diagnosisB = .;
end;
else do;
    label R_diagnosisM = 'Residual: diagnosis=M' ;
    label R_diagnosisB = 'Residual: diagnosis=B' ;
   R_diagnosisM = - _P0;
   R_diagnosisB = - _P1;
   select( _Y );
      when (0)  R_diagnosisM = R_diagnosisM + 1;
      when (1)  R_diagnosisB = R_diagnosisB + 1;
   end;
end;
 
*** Posterior Probabilities and Predicted Level;
label P_diagnosisM = 'Predicted: diagnosis=M' ;
label P_diagnosisB = 'Predicted: diagnosis=B' ;
P_diagnosisM = _P0;
_MAXP = _P0;
_IY = 1;
P_diagnosisB = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_diagnosis = REG2_5DRF[_IY];
U_diagnosis = REG2_5DRU[_IY];
 
*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* EndGrp2: EndGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Boosting: Loop=5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Boosting: accumulate final probabilities;
*------------------------------------------------------------*;
_sum =0;
P_diagnosisM = EndGrp2_P_diagnosisM*(4/5) + P_diagnosisM*(1/5);
_sum = _sum + P_diagnosisM ;
P_diagnosisB = EndGrp2_P_diagnosisB*(4/5) + P_diagnosisB*(1/5);
_sum = _sum + P_diagnosisB ;
if _sum > 1E-8 then do;
   P_diagnosisM = P_diagnosisM/_sum;
   P_diagnosisB = P_diagnosisB/_sum;
end;
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
if I_diagnosis='M' then
U_diagnosis='M';
if I_diagnosis='B' then
U_diagnosis='B';
