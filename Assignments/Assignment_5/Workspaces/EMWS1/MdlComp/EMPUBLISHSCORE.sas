drop _temp_;
if (P_diagnosisM ge 0.99999999802658) then do;
_temp_ = dmran(1234);
b_diagnosis = floor(1 + 5*_temp_);
end;
else
if (P_diagnosisM ge 0.99982145230239) then do;
b_diagnosis = 6;
end;
else
if (P_diagnosisM ge 0.98814403877436) then do;
b_diagnosis = 7;
end;
else
if (P_diagnosisM ge 0.00090758191095) then do;
b_diagnosis = 8;
end;
else
if (P_diagnosisM ge 0.00003992880697) then do;
b_diagnosis = 9;
end;
else
if (P_diagnosisM ge 0.00003182588798) then do;
_temp_ = dmran(1234);
b_diagnosis = floor(10 + 3*_temp_);
end;
else
if (P_diagnosisM ge 0.00002564522068) then do;
b_diagnosis = 13;
end;
else
if (P_diagnosisM ge 0.0000130248611) then do;
b_diagnosis = 14;
end;
else
if (P_diagnosisM ge 6.6138094029171E-6) then do;
b_diagnosis = 15;
end;
else
do;
_temp_ = dmran(1234);
b_diagnosis = floor(16 + 5*_temp_);
end;
