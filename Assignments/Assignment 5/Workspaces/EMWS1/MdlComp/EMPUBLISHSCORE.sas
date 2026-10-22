drop _temp_;
if (P_diagnosisM ge 1) then do;
_temp_ = dmran(1234);
b_diagnosis = floor(1 + 3*_temp_);
end;
else
if (P_diagnosisM ge 0.99333333333333) then do;
b_diagnosis = 4;
end;
else
if (P_diagnosisM ge 0.98) then do;
b_diagnosis = 5;
end;
else
if (P_diagnosisM ge 0.93) then do;
b_diagnosis = 6;
end;
else
if (P_diagnosisM ge 0.76333333333333) then do;
b_diagnosis = 7;
end;
else
if (P_diagnosisM ge 0.14666666666666) then do;
b_diagnosis = 8;
end;
else
if (P_diagnosisM ge 0.06) then do;
b_diagnosis = 9;
end;
else
if (P_diagnosisM ge 0.02666666666666) then do;
b_diagnosis = 10;
end;
else
if (P_diagnosisM ge 0.01333333333333) then do;
b_diagnosis = 11;
end;
else
if (P_diagnosisM ge 0.00666666666666) then do;
b_diagnosis = 12;
end;
else
do;
_temp_ = dmran(1234);
b_diagnosis = floor(13 + 8*_temp_);
end;
