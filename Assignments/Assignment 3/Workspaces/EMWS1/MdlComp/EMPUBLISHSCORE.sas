drop _temp_;
if (P_diagnosisM ge 1) then do;
_temp_ = dmran(1234);
b_diagnosis = floor(1 + 6*_temp_);
end;
else
if (P_diagnosisM ge 0.5875) then do;
b_diagnosis = 7;
end;
else
if (P_diagnosisM ge 0.15632911392405) then do;
b_diagnosis = 8;
end;
else
do;
_temp_ = dmran(1234);
b_diagnosis = floor(9 + 12*_temp_);
end;
