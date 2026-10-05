****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_diagnosis  $    1;
LENGTH U_diagnosis  $    1;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_diagnosisM = 'Predicted: diagnosis=M' ;
label P_diagnosisB = 'Predicted: diagnosis=B' ;
label Q_diagnosisM = 'Unadjusted P: diagnosis=M' ;
label Q_diagnosisB = 'Unadjusted P: diagnosis=B' ;
label V_diagnosisM = 'Validated: diagnosis=M' ;
label V_diagnosisB = 'Validated: diagnosis=B' ;
label I_diagnosis = 'Into: diagnosis' ;
label U_diagnosis = 'Unnormalized Into: diagnosis' ;
label _WARN_ = 'Warnings' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_1 $      1; DROP _ARBFMT_1;
_ARBFMT_1 = ' '; /* Initialize to avoid warning. */
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(perimeter_worst ) AND
                 107.2 <= perimeter_worst  THEN DO;
  IF  NOT MISSING(perimeter_worst ) AND
    perimeter_worst  <                114.6 THEN DO;
    IF  NOT MISSING(area_mean ) AND
      area_mean  <               608.95 THEN DO;
      _NODE_  =                   10;
      _LEAF_  =                    3;
      P_diagnosisM  =                    1;
      P_diagnosisB  =                    0;
      Q_diagnosisM  =                    1;
      Q_diagnosisB  =                    0;
      V_diagnosisM  =                    1;
      V_diagnosisB  =                    0;
      I_diagnosis  = 'M' ;
      U_diagnosis  = 'M' ;
      END;
    ELSE DO;
      _NODE_  =                   11;
      _LEAF_  =                    4;
      P_diagnosisM  =                  0.3;
      P_diagnosisB  =                  0.7;
      Q_diagnosisM  =                  0.3;
      Q_diagnosisB  =                  0.7;
      V_diagnosisM  =     0.22222222222222;
      V_diagnosisB  =     0.77777777777777;
      I_diagnosis  = 'B' ;
      U_diagnosis  = 'B' ;
      END;
    END;
  ELSE DO;
    _NODE_  =                    7;
    _LEAF_  =                    5;
    P_diagnosisM  =                    1;
    P_diagnosisB  =                    0;
    Q_diagnosisM  =                    1;
    Q_diagnosisB  =                    0;
    V_diagnosisM  =      0.9090909090909;
    V_diagnosisB  =     0.09090909090909;
    I_diagnosis  = 'M' ;
    U_diagnosis  = 'M' ;
    END;
  END;
ELSE DO;
  IF  NOT MISSING(concave_points_worst ) AND
                  0.1589 <= concave_points_worst  THEN DO;
    _NODE_  =                    5;
    _LEAF_  =                    2;
    P_diagnosisM  =                0.875;
    P_diagnosisB  =                0.125;
    Q_diagnosisM  =                0.875;
    Q_diagnosisB  =                0.125;
    V_diagnosisM  =     0.83333333333333;
    V_diagnosisB  =     0.16666666666666;
    I_diagnosis  = 'M' ;
    U_diagnosis  = 'M' ;
    END;
  ELSE DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_diagnosisM  =      0.0126582278481;
    P_diagnosisB  =     0.98734177215189;
    Q_diagnosisM  =      0.0126582278481;
    Q_diagnosisB  =     0.98734177215189;
    V_diagnosisM  =     0.05940594059405;
    V_diagnosisB  =     0.94059405940594;
    I_diagnosis  = 'B' ;
    U_diagnosis  = 'B' ;
    END;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
