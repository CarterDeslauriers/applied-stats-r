data sasep.out;
  dcl package score sc();
  dcl double "area_mean";
  dcl double "area_se";
  dcl double "area_worst";
  dcl double "compactness_mean";
  dcl double "compactness_se";
  dcl double "compactness_worst";
  dcl double "concave_points_mean";
  dcl double "concave_points_se";
  dcl double "concave_points_worst";
  dcl double "concavity_mean";
  dcl double "concavity_se";
  dcl double "concavity_worst";
  dcl double "fractal_dimension_mean";
  dcl double "fractal_dimension_se";
  dcl double "fractal_dimension_worst";
  dcl double "perimeter_mean";
  dcl double "perimeter_se";
  dcl double "perimeter_worst";
  dcl double "radius_mean";
  dcl double "radius_se";
  dcl double "radius_worst";
  dcl double "smoothness_mean";
  dcl double "smoothness_se";
  dcl double "smoothness_worst";
  dcl double "symmetry_mean";
  dcl double "symmetry_se";
  dcl double "symmetry_worst";
  dcl double "P_diagnosisM" having label n'Predicted: diagnosis=M';
  dcl double "P_diagnosisB" having label n'Predicted: diagnosis=B';
  dcl nchar(32) "I_diagnosis" having label n'Into: diagnosis';
  dcl nchar(4) "_WARN_" having label n'Warnings';
  Keep 
    "P_diagnosisM" 
    "P_diagnosisB" 
    "I_diagnosis" 
    "_WARN_" 
    ;
  varlist allvars[_all_];
  method init();
    sc.setvars(allvars);
    sc.setKey(n'7FDEB00C850E7C4F6AEBC0F2552528C7069BB4CE');
  end;
  method preScoreRecord();
  end;
  method postScoreRecord();
  end;
  method term();
  end;
  method run();
    set sasep.in;
    preScoreRecord();
    sc.scoreRecord();
    postScoreRecord();
  end;
enddata;

