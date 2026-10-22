*------------------------------------------------------------*;
* EndGrp: ;
* User: student;
* Date: 21OCT26: 21:52;
*------------------------------------------------------------* ;
* Ensemble Code;
*------------------------------------------------------------* ;
* Bagging: Loop=1;
* Temporary Variables;
drop EndGrp_P_diagnosisM;
EndGrp_P_diagnosisM = 0;
drop EndGrp_P_diagnosisB;
EndGrp_P_diagnosisB = 0;
*------------------------------------------------------------*;
* Grp: StartGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=1;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Reg: Regression;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=1;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;
 
length _WARN_ $4;
label _WARN_ = 'Warnings' ;
 
length I_diagnosis $ 1;
label I_diagnosis = 'Into: diagnosis' ;
*** Target Values;
array REG_1DRF [2] $1 _temporary_ ('M' 'B' );
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
format U_diagnosis $1.;
length U_diagnosis $ 1;
*** Unnormalized target values;
array REG_1DRU[2] $ 1 _temporary_ ('M'  'B' );
 
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
   _P0 = 0.275;
   _P1 = 0.725;
   goto REG_1DR1;
end;
 
*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;
 
***  Effect: area_mean ;
_TEMP = area_mean ;
_LP0 = _LP0 + (    0.07809588019941 * _TEMP);
 
***  Effect: area_se ;
_TEMP = area_se ;
_LP0 = _LP0 + (   -1.53913515776069 * _TEMP);
 
***  Effect: area_worst ;
_TEMP = area_worst ;
_LP0 = _LP0 + (    0.11539737981382 * _TEMP);
 
***  Effect: compactness_mean ;
_TEMP = compactness_mean ;
_LP0 = _LP0 + (    897.924703086768 * _TEMP);
 
***  Effect: compactness_se ;
_TEMP = compactness_se ;
_LP0 = _LP0 + (    1011.61202842024 * _TEMP);
 
***  Effect: compactness_worst ;
_TEMP = compactness_worst ;
_LP0 = _LP0 + (   -299.567601563256 * _TEMP);
 
***  Effect: concave_points_mean ;
_TEMP = concave_points_mean ;
_LP0 = _LP0 + (   -16.4820602192648 * _TEMP);
 
***  Effect: concave_points_se ;
_TEMP = concave_points_se ;
_LP0 = _LP0 + (   -369.780569118568 * _TEMP);
 
***  Effect: concave_points_worst ;
_TEMP = concave_points_worst ;
_LP0 = _LP0 + (     141.06256444926 * _TEMP);
 
***  Effect: concavity_mean ;
_TEMP = concavity_mean ;
_LP0 = _LP0 + (   -245.791749506368 * _TEMP);
 
***  Effect: concavity_se ;
_TEMP = concavity_se ;
_LP0 = _LP0 + (   -595.489989615031 * _TEMP);
 
***  Effect: concavity_worst ;
_TEMP = concavity_worst ;
_LP0 = _LP0 + (    160.931575305986 * _TEMP);
 
***  Effect: fractal_dimension_mean ;
_TEMP = fractal_dimension_mean ;
_LP0 = _LP0 + (   -771.282892352608 * _TEMP);
 
***  Effect: fractal_dimension_se ;
_TEMP = fractal_dimension_se ;
_LP0 = _LP0 + (   -6223.00291424781 * _TEMP);
 
***  Effect: fractal_dimension_worst ;
_TEMP = fractal_dimension_worst ;
_LP0 = _LP0 + (    1335.32516574708 * _TEMP);
 
***  Effect: perimeter_mean ;
_TEMP = perimeter_mean ;
_LP0 = _LP0 + (   -9.51513578174773 * _TEMP);
 
***  Effect: perimeter_se ;
_TEMP = perimeter_se ;
_LP0 = _LP0 + (    13.4182132003141 * _TEMP);
 
***  Effect: perimeter_worst ;
_TEMP = perimeter_worst ;
_LP0 = _LP0 + (   -2.39052397855882 * _TEMP);
 
***  Effect: radius_mean ;
_TEMP = radius_mean ;
_LP0 = _LP0 + (    64.7988334964078 * _TEMP);
 
***  Effect: radius_se ;
_TEMP = radius_se ;
_LP0 = _LP0 + (    55.3503279954122 * _TEMP);
 
***  Effect: radius_worst ;
_TEMP = radius_worst ;
_LP0 = _LP0 + (      2.163034379116 * _TEMP);
 
***  Effect: smoothness_mean ;
_TEMP = smoothness_mean ;
_LP0 = _LP0 + (   -505.270956425866 * _TEMP);
 
***  Effect: smoothness_se ;
_TEMP = smoothness_se ;
_LP0 = _LP0 + (    2435.98662713505 * _TEMP);
 
***  Effect: smoothness_worst ;
_TEMP = smoothness_worst ;
_LP0 = _LP0 + (   -246.946808069386 * _TEMP);
 
***  Effect: symmetry_mean ;
_TEMP = symmetry_mean ;
_LP0 = _LP0 + (    17.8436013537464 * _TEMP);
 
***  Effect: symmetry_se ;
_TEMP = symmetry_se ;
_LP0 = _LP0 + (   -129.332201297465 * _TEMP);
 
***  Effect: symmetry_worst ;
_TEMP = symmetry_worst ;
_LP0 = _LP0 + (    34.1568603893948 * _TEMP);
 
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -13.3821994931451 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;
 
REG_1DR1:
 
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
I_diagnosis = REG_1DRF[_IY];
U_diagnosis = REG_1DRU[_IY];
 
*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* EndGrp: EndGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=1;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Bagging: Saving Probabilities for Next Iteration;
*------------------------------------------------------------*;
EndGrp_P_diagnosisM = P_diagnosisM;
EndGrp_P_diagnosisB = P_diagnosisB;
*------------------------------------------------------------*;
* Grp: StartGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Reg: Regression;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=2;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;
 
length _WARN_ $4;
label _WARN_ = 'Warnings' ;
 
length I_diagnosis $ 1;
label I_diagnosis = 'Into: diagnosis' ;
*** Target Values;
array REG_2DRF [2] $1 _temporary_ ('M' 'B' );
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
format U_diagnosis $1.;
length U_diagnosis $ 1;
*** Unnormalized target values;
array REG_2DRU[2] $ 1 _temporary_ ('M'  'B' );
 
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
   _P0 = 0.375;
   _P1 = 0.625;
   goto REG_2DR1;
end;
 
*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;
 
***  Effect: area_mean ;
_TEMP = area_mean ;
_LP0 = _LP0 + (    0.16373600139526 * _TEMP);
 
***  Effect: area_se ;
_TEMP = area_se ;
_LP0 = _LP0 + (   -0.34829500531982 * _TEMP);
 
***  Effect: area_worst ;
_TEMP = area_worst ;
_LP0 = _LP0 + (   -0.01376602915711 * _TEMP);
 
***  Effect: compactness_mean ;
_TEMP = compactness_mean ;
_LP0 = _LP0 + (    232.442567230408 * _TEMP);
 
***  Effect: compactness_se ;
_TEMP = compactness_se ;
_LP0 = _LP0 + (    715.450846657355 * _TEMP);
 
***  Effect: compactness_worst ;
_TEMP = compactness_worst ;
_LP0 = _LP0 + (   -109.270508182804 * _TEMP);
 
***  Effect: concave_points_mean ;
_TEMP = concave_points_mean ;
_LP0 = _LP0 + (   -1056.68833666276 * _TEMP);
 
***  Effect: concave_points_se ;
_TEMP = concave_points_se ;
_LP0 = _LP0 + (    1526.31497250697 * _TEMP);
 
***  Effect: concave_points_worst ;
_TEMP = concave_points_worst ;
_LP0 = _LP0 + (    55.5471082556197 * _TEMP);
 
***  Effect: concavity_mean ;
_TEMP = concavity_mean ;
_LP0 = _LP0 + (    247.070643612495 * _TEMP);
 
***  Effect: concavity_se ;
_TEMP = concavity_se ;
_LP0 = _LP0 + (   -720.744276340065 * _TEMP);
 
***  Effect: concavity_worst ;
_TEMP = concavity_worst ;
_LP0 = _LP0 + (    1.93883619426195 * _TEMP);
 
***  Effect: fractal_dimension_mean ;
_TEMP = fractal_dimension_mean ;
_LP0 = _LP0 + (   -119.817939842831 * _TEMP);
 
***  Effect: fractal_dimension_se ;
_TEMP = fractal_dimension_se ;
_LP0 = _LP0 + (   -1390.95767639641 * _TEMP);
 
***  Effect: fractal_dimension_worst ;
_TEMP = fractal_dimension_worst ;
_LP0 = _LP0 + (    749.403248553797 * _TEMP);
 
***  Effect: perimeter_mean ;
_TEMP = perimeter_mean ;
_LP0 = _LP0 + (   -0.56372219019267 * _TEMP);
 
***  Effect: perimeter_se ;
_TEMP = perimeter_se ;
_LP0 = _LP0 + (    12.9901340342256 * _TEMP);
 
***  Effect: perimeter_worst ;
_TEMP = perimeter_worst ;
_LP0 = _LP0 + (   -1.93000514666213 * _TEMP);
 
***  Effect: radius_mean ;
_TEMP = radius_mean ;
_LP0 = _LP0 + (   -7.14575974892616 * _TEMP);
 
***  Effect: radius_se ;
_TEMP = radius_se ;
_LP0 = _LP0 + (    -51.765910155924 * _TEMP);
 
***  Effect: radius_worst ;
_TEMP = radius_worst ;
_LP0 = _LP0 + (    16.2703745915544 * _TEMP);
 
***  Effect: smoothness_mean ;
_TEMP = smoothness_mean ;
_LP0 = _LP0 + (    192.479816676639 * _TEMP);
 
***  Effect: smoothness_se ;
_TEMP = smoothness_se ;
_LP0 = _LP0 + (   -1786.28791241645 * _TEMP);
 
***  Effect: smoothness_worst ;
_TEMP = smoothness_worst ;
_LP0 = _LP0 + (   -18.1492410086065 * _TEMP);
 
***  Effect: symmetry_mean ;
_TEMP = symmetry_mean ;
_LP0 = _LP0 + (    130.235666013621 * _TEMP);
 
***  Effect: symmetry_se ;
_TEMP = symmetry_se ;
_LP0 = _LP0 + (   -358.611926593686 * _TEMP);
 
***  Effect: symmetry_worst ;
_TEMP = symmetry_worst ;
_LP0 = _LP0 + (    56.8881601689553 * _TEMP);
 
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -78.7941640772348 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;
 
REG_2DR1:
 
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
I_diagnosis = REG_2DRF[_IY];
U_diagnosis = REG_2DRU[_IY];
 
*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* EndGrp: EndGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Bagging: accumulate probabilities for iteration: 2;
*------------------------------------------------------------*;
_sum =0;
P_diagnosisM = EndGrp_P_diagnosisM*(1/2) + P_diagnosisM*(1/2);
_sum = _sum + P_diagnosisM ;
P_diagnosisB = EndGrp_P_diagnosisB*(1/2) + P_diagnosisB*(1/2);
_sum = _sum + P_diagnosisB ;
if _sum > 1E-8 then do;
   P_diagnosisM = P_diagnosisM/_sum;
   P_diagnosisB = P_diagnosisB/_sum;
end;
*------------------------------------------------------------*;
* Bagging: Saving Probabilities for Next Iteration;
*------------------------------------------------------------*;
EndGrp_P_diagnosisM = P_diagnosisM;
EndGrp_P_diagnosisB = P_diagnosisB;
*------------------------------------------------------------*;
* Grp: StartGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Reg: Regression;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=3;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;
 
length _WARN_ $4;
label _WARN_ = 'Warnings' ;
 
length I_diagnosis $ 1;
label I_diagnosis = 'Into: diagnosis' ;
*** Target Values;
array REG_3DRF [2] $1 _temporary_ ('M' 'B' );
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
format U_diagnosis $1.;
length U_diagnosis $ 1;
*** Unnormalized target values;
array REG_3DRU[2] $ 1 _temporary_ ('M'  'B' );
 
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
   if F_diagnosis = 'M'  then do;
      _Y = 0;
   end;
   else if F_diagnosis = 'B'  then do;
      _Y = 1;
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
   _P0 = 0.525;
   _P1 = 0.475;
   goto REG_3DR1;
end;
 
*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;
 
***  Effect: area_mean ;
_TEMP = area_mean ;
_LP0 = _LP0 + (   -0.08019842918329 * _TEMP);
 
***  Effect: area_se ;
_TEMP = area_se ;
_LP0 = _LP0 + (   -0.04120489719914 * _TEMP);
 
***  Effect: area_worst ;
_TEMP = area_worst ;
_LP0 = _LP0 + (    0.04460037165391 * _TEMP);
 
***  Effect: compactness_mean ;
_TEMP = compactness_mean ;
_LP0 = _LP0 + (   -30.5713774933612 * _TEMP);
 
***  Effect: compactness_se ;
_TEMP = compactness_se ;
_LP0 = _LP0 + (    986.464588142311 * _TEMP);
 
***  Effect: compactness_worst ;
_TEMP = compactness_worst ;
_LP0 = _LP0 + (   -136.046727877364 * _TEMP);
 
***  Effect: concave_points_mean ;
_TEMP = concave_points_mean ;
_LP0 = _LP0 + (    -227.22740294497 * _TEMP);
 
***  Effect: concave_points_se ;
_TEMP = concave_points_se ;
_LP0 = _LP0 + (    952.944309349962 * _TEMP);
 
***  Effect: concave_points_worst ;
_TEMP = concave_points_worst ;
_LP0 = _LP0 + (    78.0025941646681 * _TEMP);
 
***  Effect: concavity_mean ;
_TEMP = concavity_mean ;
_LP0 = _LP0 + (    123.535202829611 * _TEMP);
 
***  Effect: concavity_se ;
_TEMP = concavity_se ;
_LP0 = _LP0 + (   -651.164399733451 * _TEMP);
 
***  Effect: concavity_worst ;
_TEMP = concavity_worst ;
_LP0 = _LP0 + (    49.6860733615644 * _TEMP);
 
***  Effect: fractal_dimension_mean ;
_TEMP = fractal_dimension_mean ;
_LP0 = _LP0 + (   -883.252243172387 * _TEMP);
 
***  Effect: fractal_dimension_se ;
_TEMP = fractal_dimension_se ;
_LP0 = _LP0 + (   -5747.08451256153 * _TEMP);
 
***  Effect: fractal_dimension_worst ;
_TEMP = fractal_dimension_worst ;
_LP0 = _LP0 + (    1193.23813583644 * _TEMP);
 
***  Effect: perimeter_mean ;
_TEMP = perimeter_mean ;
_LP0 = _LP0 + (    0.12695926938941 * _TEMP);
 
***  Effect: perimeter_se ;
_TEMP = perimeter_se ;
_LP0 = _LP0 + (   -4.80314107695206 * _TEMP);
 
***  Effect: perimeter_worst ;
_TEMP = perimeter_worst ;
_LP0 = _LP0 + (   -0.26410801717175 * _TEMP);
 
***  Effect: radius_mean ;
_TEMP = radius_mean ;
_LP0 = _LP0 + (    11.9768633958016 * _TEMP);
 
***  Effect: radius_se ;
_TEMP = radius_se ;
_LP0 = _LP0 + (    57.3882589423266 * _TEMP);
 
***  Effect: radius_worst ;
_TEMP = radius_worst ;
_LP0 = _LP0 + (   -6.40326194703458 * _TEMP);
 
***  Effect: smoothness_mean ;
_TEMP = smoothness_mean ;
_LP0 = _LP0 + (    449.329582681399 * _TEMP);
 
***  Effect: smoothness_se ;
_TEMP = smoothness_se ;
_LP0 = _LP0 + (    2022.11586081391 * _TEMP);
 
***  Effect: smoothness_worst ;
_TEMP = smoothness_worst ;
_LP0 = _LP0 + (   -488.413606774079 * _TEMP);
 
***  Effect: symmetry_mean ;
_TEMP = symmetry_mean ;
_LP0 = _LP0 + (   -61.6062662733199 * _TEMP);
 
***  Effect: symmetry_se ;
_TEMP = symmetry_se ;
_LP0 = _LP0 + (    -815.01059883828 * _TEMP);
 
***  Effect: symmetry_worst ;
_TEMP = symmetry_worst ;
_LP0 = _LP0 + (    146.459345486233 * _TEMP);
 
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -77.9144301562645 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;
 
REG_3DR1:
 
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
I_diagnosis = REG_3DRF[_IY];
U_diagnosis = REG_3DRU[_IY];
 
*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* EndGrp: EndGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Bagging: accumulate probabilities for iteration: 3;
*------------------------------------------------------------*;
_sum =0;
P_diagnosisM = EndGrp_P_diagnosisM*(2/3) + P_diagnosisM*(1/3);
_sum = _sum + P_diagnosisM ;
P_diagnosisB = EndGrp_P_diagnosisB*(2/3) + P_diagnosisB*(1/3);
_sum = _sum + P_diagnosisB ;
if _sum > 1E-8 then do;
   P_diagnosisM = P_diagnosisM/_sum;
   P_diagnosisB = P_diagnosisB/_sum;
end;
*------------------------------------------------------------*;
* Bagging: Saving Probabilities for Next Iteration;
*------------------------------------------------------------*;
EndGrp_P_diagnosisM = P_diagnosisM;
EndGrp_P_diagnosisB = P_diagnosisB;
*------------------------------------------------------------*;
* Grp: StartGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Reg: Regression;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=4;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;
 
length _WARN_ $4;
label _WARN_ = 'Warnings' ;
 
length I_diagnosis $ 1;
label I_diagnosis = 'Into: diagnosis' ;
*** Target Values;
array REG_4DRF [2] $1 _temporary_ ('M' 'B' );
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
format U_diagnosis $1.;
length U_diagnosis $ 1;
*** Unnormalized target values;
array REG_4DRU[2] $ 1 _temporary_ ('M'  'B' );
 
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
   _P0 = 0.5;
   _P1 = 0.5;
   goto REG_4DR1;
end;
 
*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;
 
***  Effect: area_mean ;
_TEMP = area_mean ;
_LP0 = _LP0 + (    0.40506248192716 * _TEMP);
 
***  Effect: area_se ;
_TEMP = area_se ;
_LP0 = _LP0 + (    1.51521577473865 * _TEMP);
 
***  Effect: area_worst ;
_TEMP = area_worst ;
_LP0 = _LP0 + (   -0.28271182327841 * _TEMP);
 
***  Effect: compactness_mean ;
_TEMP = compactness_mean ;
_LP0 = _LP0 + (   -21.7864416276616 * _TEMP);
 
***  Effect: compactness_se ;
_TEMP = compactness_se ;
_LP0 = _LP0 + (   -282.008398351106 * _TEMP);
 
***  Effect: compactness_worst ;
_TEMP = compactness_worst ;
_LP0 = _LP0 + (    93.6083879921943 * _TEMP);
 
***  Effect: concave_points_mean ;
_TEMP = concave_points_mean ;
_LP0 = _LP0 + (    -384.86760670558 * _TEMP);
 
***  Effect: concave_points_se ;
_TEMP = concave_points_se ;
_LP0 = _LP0 + (    569.189333707302 * _TEMP);
 
***  Effect: concave_points_worst ;
_TEMP = concave_points_worst ;
_LP0 = _LP0 + (    114.959270286149 * _TEMP);
 
***  Effect: concavity_mean ;
_TEMP = concavity_mean ;
_LP0 = _LP0 + (     4.5059642147619 * _TEMP);
 
***  Effect: concavity_se ;
_TEMP = concavity_se ;
_LP0 = _LP0 + (   -93.4310285889169 * _TEMP);
 
***  Effect: concavity_worst ;
_TEMP = concavity_worst ;
_LP0 = _LP0 + (    101.408341496711 * _TEMP);
 
***  Effect: fractal_dimension_mean ;
_TEMP = fractal_dimension_mean ;
_LP0 = _LP0 + (    443.670467433719 * _TEMP);
 
***  Effect: fractal_dimension_se ;
_TEMP = fractal_dimension_se ;
_LP0 = _LP0 + (    1070.17442220984 * _TEMP);
 
***  Effect: fractal_dimension_worst ;
_TEMP = fractal_dimension_worst ;
_LP0 = _LP0 + (   -437.634844883287 * _TEMP);
 
***  Effect: perimeter_mean ;
_TEMP = perimeter_mean ;
_LP0 = _LP0 + (    -6.8317208622316 * _TEMP);
 
***  Effect: perimeter_se ;
_TEMP = perimeter_se ;
_LP0 = _LP0 + (   -6.25842025948391 * _TEMP);
 
***  Effect: perimeter_worst ;
_TEMP = perimeter_worst ;
_LP0 = _LP0 + (   -0.95180578765221 * _TEMP);
 
***  Effect: radius_mean ;
_TEMP = radius_mean ;
_LP0 = _LP0 + (    7.04763511833917 * _TEMP);
 
***  Effect: radius_se ;
_TEMP = radius_se ;
_LP0 = _LP0 + (   -38.2871608586984 * _TEMP);
 
***  Effect: radius_worst ;
_TEMP = radius_worst ;
_LP0 = _LP0 + (     32.051096294362 * _TEMP);
 
***  Effect: smoothness_mean ;
_TEMP = smoothness_mean ;
_LP0 = _LP0 + (    597.547228312885 * _TEMP);
 
***  Effect: smoothness_se ;
_TEMP = smoothness_se ;
_LP0 = _LP0 + (    1898.97719947279 * _TEMP);
 
***  Effect: smoothness_worst ;
_TEMP = smoothness_worst ;
_LP0 = _LP0 + (   -703.010275474165 * _TEMP);
 
***  Effect: symmetry_mean ;
_TEMP = symmetry_mean ;
_LP0 = _LP0 + (   -158.369314161595 * _TEMP);
 
***  Effect: symmetry_se ;
_TEMP = symmetry_se ;
_LP0 = _LP0 + (   -611.385007995619 * _TEMP);
 
***  Effect: symmetry_worst ;
_TEMP = symmetry_worst ;
_LP0 = _LP0 + (    171.693679352877 * _TEMP);
 
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     45.4679167867221 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;
 
REG_4DR1:
 
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
I_diagnosis = REG_4DRF[_IY];
U_diagnosis = REG_4DRU[_IY];
 
*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* EndGrp: EndGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Bagging: accumulate probabilities for iteration: 4;
*------------------------------------------------------------*;
_sum =0;
P_diagnosisM = EndGrp_P_diagnosisM*(3/4) + P_diagnosisM*(1/4);
_sum = _sum + P_diagnosisM ;
P_diagnosisB = EndGrp_P_diagnosisB*(3/4) + P_diagnosisB*(1/4);
_sum = _sum + P_diagnosisB ;
if _sum > 1E-8 then do;
   P_diagnosisM = P_diagnosisM/_sum;
   P_diagnosisB = P_diagnosisB/_sum;
end;
*------------------------------------------------------------*;
* Bagging: Saving Probabilities for Next Iteration;
*------------------------------------------------------------*;
EndGrp_P_diagnosisM = P_diagnosisM;
EndGrp_P_diagnosisB = P_diagnosisB;
*------------------------------------------------------------*;
* Grp: StartGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Reg: Regression;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=5;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;
 
length _WARN_ $4;
label _WARN_ = 'Warnings' ;
 
length I_diagnosis $ 1;
label I_diagnosis = 'Into: diagnosis' ;
*** Target Values;
array REG_5DRF [2] $1 _temporary_ ('M' 'B' );
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
format U_diagnosis $1.;
length U_diagnosis $ 1;
*** Unnormalized target values;
array REG_5DRU[2] $ 1 _temporary_ ('M'  'B' );
 
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
   _P0 = 0.425;
   _P1 = 0.575;
   goto REG_5DR1;
end;
 
*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;
 
***  Effect: area_mean ;
_TEMP = area_mean ;
_LP0 = _LP0 + (    0.07250855280431 * _TEMP);
 
***  Effect: area_se ;
_TEMP = area_se ;
_LP0 = _LP0 + (   -0.86858250558976 * _TEMP);
 
***  Effect: area_worst ;
_TEMP = area_worst ;
_LP0 = _LP0 + (    0.05352890811716 * _TEMP);
 
***  Effect: compactness_mean ;
_TEMP = compactness_mean ;
_LP0 = _LP0 + (    231.104929387299 * _TEMP);
 
***  Effect: compactness_se ;
_TEMP = compactness_se ;
_LP0 = _LP0 + (    2134.62791543442 * _TEMP);
 
***  Effect: compactness_worst ;
_TEMP = compactness_worst ;
_LP0 = _LP0 + (   -143.683583432755 * _TEMP);
 
***  Effect: concave_points_mean ;
_TEMP = concave_points_mean ;
_LP0 = _LP0 + (   -328.938858995674 * _TEMP);
 
***  Effect: concave_points_se ;
_TEMP = concave_points_se ;
_LP0 = _LP0 + (   -1131.52572376265 * _TEMP);
 
***  Effect: concave_points_worst ;
_TEMP = concave_points_worst ;
_LP0 = _LP0 + (   -39.3543766176149 * _TEMP);
 
***  Effect: concavity_mean ;
_TEMP = concavity_mean ;
_LP0 = _LP0 + (   -104.144812788459 * _TEMP);
 
***  Effect: concavity_se ;
_TEMP = concavity_se ;
_LP0 = _LP0 + (    412.674488372458 * _TEMP);
 
***  Effect: concavity_worst ;
_TEMP = concavity_worst ;
_LP0 = _LP0 + (     5.9146223551484 * _TEMP);
 
***  Effect: fractal_dimension_mean ;
_TEMP = fractal_dimension_mean ;
_LP0 = _LP0 + (   -1436.59545691027 * _TEMP);
 
***  Effect: fractal_dimension_se ;
_TEMP = fractal_dimension_se ;
_LP0 = _LP0 + (   -19571.0623171227 * _TEMP);
 
***  Effect: fractal_dimension_worst ;
_TEMP = fractal_dimension_worst ;
_LP0 = _LP0 + (    2558.44244669079 * _TEMP);
 
***  Effect: perimeter_mean ;
_TEMP = perimeter_mean ;
_LP0 = _LP0 + (     1.3392483653279 * _TEMP);
 
***  Effect: perimeter_se ;
_TEMP = perimeter_se ;
_LP0 = _LP0 + (   -15.2523146630116 * _TEMP);
 
***  Effect: perimeter_worst ;
_TEMP = perimeter_worst ;
_LP0 = _LP0 + (   -1.89935668603831 * _TEMP);
 
***  Effect: radius_mean ;
_TEMP = radius_mean ;
_LP0 = _LP0 + (    3.15991733182546 * _TEMP);
 
***  Effect: radius_se ;
_TEMP = radius_se ;
_LP0 = _LP0 + (    298.165537379868 * _TEMP);
 
***  Effect: radius_worst ;
_TEMP = radius_worst ;
_LP0 = _LP0 + (   -5.70207962146065 * _TEMP);
 
***  Effect: smoothness_mean ;
_TEMP = smoothness_mean ;
_LP0 = _LP0 + (   -204.014380294942 * _TEMP);
 
***  Effect: smoothness_se ;
_TEMP = smoothness_se ;
_LP0 = _LP0 + (   -4312.59262542729 * _TEMP);
 
***  Effect: smoothness_worst ;
_TEMP = smoothness_worst ;
_LP0 = _LP0 + (    400.310643864278 * _TEMP);
 
***  Effect: symmetry_mean ;
_TEMP = symmetry_mean ;
_LP0 = _LP0 + (   -54.6121638002961 * _TEMP);
 
***  Effect: symmetry_se ;
_TEMP = symmetry_se ;
_LP0 = _LP0 + (    1375.04596076766 * _TEMP);
 
***  Effect: symmetry_worst ;
_TEMP = symmetry_worst ;
_LP0 = _LP0 + (   -173.540640190016 * _TEMP);
 
*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -48.3281013123235 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;
 
REG_5DR1:
 
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
I_diagnosis = REG_5DRF[_IY];
U_diagnosis = REG_5DRU[_IY];
 
*************************************;
***** end scoring code for regression;
*************************************;
*------------------------------------------------------------*;
* EndGrp: EndGroup;
* User: student;
* Date: 21OCT26: 21:52;
* Bagging: Loop=5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Bagging: accumulate final probabilities;
*------------------------------------------------------------*;
_sum =0;
P_diagnosisM = EndGrp_P_diagnosisM*(4/5) + P_diagnosisM*(1/5);
_sum = _sum + P_diagnosisM ;
P_diagnosisB = EndGrp_P_diagnosisB*(4/5) + P_diagnosisB*(1/5);
_sum = _sum + P_diagnosisB ;
if _sum > 1E-8 then do;
   P_diagnosisM = P_diagnosisM/_sum;
   P_diagnosisB = P_diagnosisB/_sum;
end;
