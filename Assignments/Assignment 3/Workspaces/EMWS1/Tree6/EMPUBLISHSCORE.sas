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
                 114.6 <= perimeter_worst  THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    7;
  P_diagnosisM  =                    1;
  P_diagnosisB  =                    0;
  Q_diagnosisM  =                    1;
  Q_diagnosisB  =                    0;
  V_diagnosisM  =      0.9090909090909;
  V_diagnosisB  =     0.09090909090909;
  I_diagnosis  = 'M' ;
  U_diagnosis  = 'M' ;
  END;
ELSE DO;
  IF  NOT MISSING(concave_points_worst ) AND
                 0.11135 <= concave_points_worst  THEN DO;
    IF  NOT MISSING(concave_points_worst ) AND
                    0.1603 <= concave_points_worst  THEN DO;
      _NODE_  =                    9;
      _LEAF_  =                    6;
      P_diagnosisM  =     0.92857142857142;
      P_diagnosisB  =     0.07142857142857;
      Q_diagnosisM  =     0.92857142857142;
      Q_diagnosisB  =     0.07142857142857;
      V_diagnosisM  =     0.83333333333333;
      V_diagnosisB  =     0.16666666666666;
      I_diagnosis  = 'M' ;
      U_diagnosis  = 'M' ;
      END;
    ELSE DO;
      IF  NOT MISSING(area_worst ) AND
        area_worst  <               724.05 THEN DO;
        _NODE_  =                   10;
        _LEAF_  =                    2;
        P_diagnosisM  =                    0;
        P_diagnosisB  =                    1;
        Q_diagnosisM  =                    0;
        Q_diagnosisB  =                    1;
        V_diagnosisM  =     0.09090909090909;
        V_diagnosisB  =      0.9090909090909;
        I_diagnosis  = 'B' ;
        U_diagnosis  = 'B' ;
        END;
      ELSE DO;
        IF  NOT MISSING(fractal_dimension_worst ) AND
          fractal_dimension_worst  <               0.0754 THEN DO;
          _NODE_  =                   14;
          _LEAF_  =                    3;
          P_diagnosisM  =                    1;
          P_diagnosisB  =                    0;
          Q_diagnosisM  =                    1;
          Q_diagnosisB  =                    0;
          V_diagnosisM  =                    0;
          V_diagnosisB  =                    1;
          I_diagnosis  = 'M' ;
          U_diagnosis  = 'M' ;
          END;
        ELSE DO;
          IF  NOT MISSING(radius_mean ) AND
            radius_mean  <                14.43 THEN DO;
            _NODE_  =                   16;
            _LEAF_  =                    4;
            P_diagnosisM  =     0.71428571428571;
            P_diagnosisB  =     0.28571428571428;
            Q_diagnosisM  =     0.71428571428571;
            Q_diagnosisB  =     0.28571428571428;
            V_diagnosisM  =                    1;
            V_diagnosisB  =                    0;
            I_diagnosis  = 'M' ;
            U_diagnosis  = 'M' ;
            END;
          ELSE DO;
            _NODE_  =                   17;
            _LEAF_  =                    5;
            P_diagnosisM  =     0.09090909090909;
            P_diagnosisB  =      0.9090909090909;
            Q_diagnosisM  =     0.09090909090909;
            Q_diagnosisB  =      0.9090909090909;
            V_diagnosisM  =                    0;
            V_diagnosisB  =                    1;
            I_diagnosis  = 'B' ;
            U_diagnosis  = 'B' ;
            END;
          END;
        END;
      END;
    END;
  ELSE DO;
    _NODE_  =                    4;
    _LEAF_  =                    1;
    P_diagnosisM  =      0.0045871559633;
    P_diagnosisB  =     0.99541284403669;
    Q_diagnosisM  =      0.0045871559633;
    Q_diagnosisB  =     0.99541284403669;
    V_diagnosisM  =     0.05376344086021;
    V_diagnosisB  =     0.94623655913978;
    I_diagnosis  = 'B' ;
    U_diagnosis  = 'B' ;
    END;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
