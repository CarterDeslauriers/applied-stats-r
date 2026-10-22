***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4 
      F_diagnosis  $ 1
      I_diagnosis  $ 1
      U_diagnosis  $ 1
;
      label S_area_mean = 'Standard: area_mean' ;

      label S_area_se = 'Standard: area_se' ;

      label S_area_worst = 'Standard: area_worst' ;

      label S_compactness_mean = 'Standard: compactness_mean' ;

      label S_compactness_se = 'Standard: compactness_se' ;

      label S_compactness_worst = 'Standard: compactness_worst' ;

      label S_concave_points_mean = 'Standard: concave_points_mean' ;

      label S_concave_points_se = 'Standard: concave_points_se' ;

      label S_concave_points_worst = 'Standard: concave_points_worst' ;

      label S_concavity_mean = 'Standard: concavity_mean' ;

      label S_concavity_se = 'Standard: concavity_se' ;

      label S_concavity_worst = 'Standard: concavity_worst' ;

      label S_fractal_dimension_mean = 'Standard: fractal_dimension_mean' ;

      label S_fractal_dimension_se = 'Standard: fractal_dimension_se' ;

      label S_fractal_dimension_worst = 'Standard: fractal_dimension_worst' ;

      label S_perimeter_mean = 'Standard: perimeter_mean' ;

      label S_perimeter_se = 'Standard: perimeter_se' ;

      label S_perimeter_worst = 'Standard: perimeter_worst' ;

      label S_radius_mean = 'Standard: radius_mean' ;

      label S_radius_se = 'Standard: radius_se' ;

      label S_radius_worst = 'Standard: radius_worst' ;

      label S_smoothness_mean = 'Standard: smoothness_mean' ;

      label S_smoothness_se = 'Standard: smoothness_se' ;

      label S_smoothness_worst = 'Standard: smoothness_worst' ;

      label S_symmetry_mean = 'Standard: symmetry_mean' ;

      label S_symmetry_se = 'Standard: symmetry_se' ;

      label S_symmetry_worst = 'Standard: symmetry_worst' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label I_diagnosis = 'Into: diagnosis' ;

      label F_diagnosis = 'From: diagnosis' ;

      label U_diagnosis = 'Unnormalized Into: diagnosis' ;

      label P_diagnosisM = 'Predicted: diagnosis=M' ;

      label R_diagnosisM = 'Residual: diagnosis=M' ;

      label P_diagnosisB = 'Predicted: diagnosis=B' ;

      label R_diagnosisB = 'Residual: diagnosis=B' ;

      label  _WARN_ = "Warnings"; 

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   area_mean , 
   area_se , 
   area_worst , 
   compactness_mean , 
   compactness_se , 
   compactness_worst , 
   concave_points_mean , 
   concave_points_se , 
   concave_points_worst , 
   concavity_mean , 
   concavity_se , 
   concavity_worst , 
   fractal_dimension_mean , 
   fractal_dimension_se , 
   fractal_dimension_worst , 
   perimeter_mean , 
   perimeter_se , 
   perimeter_worst , 
   radius_mean , 
   radius_se , 
   radius_worst , 
   smoothness_mean , 
   smoothness_se , 
   smoothness_worst , 
   symmetry_mean , 
   symmetry_se , 
   symmetry_worst   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_area_mean  =    -1.86155221068433 +     0.00284371116064 * area_mean ;
   S_area_se  =    -0.82845717837421 +     0.02048291691749 * area_se ;
   S_area_worst  =    -1.52782645672378 +     0.00173417139448 * area_worst ;
   S_compactness_mean  =    -1.98985478375849 +     19.1473294438856 * 
        compactness_mean ;
   S_compactness_se  =    -1.46966611690372 +     58.8177170660739 * 
        compactness_se ;
   S_compactness_worst  =    -1.62636444042546 +     6.44034972918207 * 
        compactness_worst ;
   S_concave_points_mean  =    -1.25205252854053 +      25.620888810128 * 
        concave_points_mean ;
   S_concave_points_se  =    -1.85502867799946 +     158.959518400178 * 
        concave_points_se ;
   S_concave_points_worst  =    -1.71297809378767 +     15.0189205761679 * 
        concave_points_worst ;
   S_concavity_mean  =    -1.11382232257536 +     12.5605844423819 * 
        concavity_mean ;
   S_concavity_se  =    -1.06340744420102 +     33.9549878051086 * 
        concavity_se ;
   S_concavity_worst  =    -1.32449308670687 +     4.91583845296763 * 
        concavity_worst ;
   S_fractal_dimension_mean  =    -9.00253413939402 +     143.666896205708 * 
        fractal_dimension_mean ;
   S_fractal_dimension_se  =    -1.36136539788035 +     367.305791698724 * 
        fractal_dimension_se ;
   S_fractal_dimension_worst  =    -4.86183926084573 +     58.4930718814694 * 
        fractal_dimension_worst ;
   S_perimeter_mean  =    -3.82488652457676 +     0.04156966188435 * 
        perimeter_mean ;
   S_perimeter_se  =    -1.34775754728092 +      0.4681121145196 * 
        perimeter_se ;
   S_perimeter_worst  =    -3.17563903366227 +     0.02955372716892 * 
        perimeter_worst ;
   S_radius_mean  =    -4.05764977496878 +     0.28713377367946 * radius_mean
         ;
   S_radius_se  =    -1.40283152653658 +     3.48147110181667 * radius_se ;
   S_radius_worst  =    -3.36551320681228 +     0.20684720574392 * 
        radius_worst ;
   S_smoothness_mean  =    -6.99342760420755 +     72.8736992704779 * 
        smoothness_mean ;
   S_smoothness_se  =    -2.36630202368779 +     345.757326476785 * 
        smoothness_se ;
   S_smoothness_worst  =    -5.79475029800394 +     44.1748287995126 * 
        smoothness_worst ;
   S_symmetry_mean  =    -6.56848536936401 +     36.4978834207944 * 
        symmetry_mean ;
   S_symmetry_se  =    -2.58149167419602 +     125.750050862589 * symmetry_se
         ;
   S_symmetry_worst  =    -4.59287080342021 +     15.8682160344868 * 
        symmetry_worst ;
END;
ELSE DO;
   IF MISSING( area_mean ) THEN S_area_mean  = . ;
   ELSE S_area_mean  =    -1.86155221068433 +     0.00284371116064 * area_mean
         ;
   IF MISSING( area_se ) THEN S_area_se  = . ;
   ELSE S_area_se  =    -0.82845717837421 +     0.02048291691749 * area_se ;
   IF MISSING( area_worst ) THEN S_area_worst  = . ;
   ELSE S_area_worst  =    -1.52782645672378 +     0.00173417139448 * 
        area_worst ;
   IF MISSING( compactness_mean ) THEN S_compactness_mean  = . ;
   ELSE S_compactness_mean  =    -1.98985478375849 +     19.1473294438856 * 
        compactness_mean ;
   IF MISSING( compactness_se ) THEN S_compactness_se  = . ;
   ELSE S_compactness_se  =    -1.46966611690372 +     58.8177170660739 * 
        compactness_se ;
   IF MISSING( compactness_worst ) THEN S_compactness_worst  = . ;
   ELSE S_compactness_worst  =    -1.62636444042546 +     6.44034972918207 * 
        compactness_worst ;
   IF MISSING( concave_points_mean ) THEN S_concave_points_mean  = . ;
   ELSE S_concave_points_mean
          =    -1.25205252854053 +      25.620888810128 * concave_points_mean
         ;
   IF MISSING( concave_points_se ) THEN S_concave_points_se  = . ;
   ELSE S_concave_points_se  =    -1.85502867799946 +     158.959518400178 * 
        concave_points_se ;
   IF MISSING( concave_points_worst ) THEN S_concave_points_worst  = . ;
   ELSE S_concave_points_worst
          =    -1.71297809378767 +     15.0189205761679 * concave_points_worst
         ;
   IF MISSING( concavity_mean ) THEN S_concavity_mean  = . ;
   ELSE S_concavity_mean  =    -1.11382232257536 +     12.5605844423819 * 
        concavity_mean ;
   IF MISSING( concavity_se ) THEN S_concavity_se  = . ;
   ELSE S_concavity_se  =    -1.06340744420102 +     33.9549878051086 * 
        concavity_se ;
   IF MISSING( concavity_worst ) THEN S_concavity_worst  = . ;
   ELSE S_concavity_worst  =    -1.32449308670687 +     4.91583845296763 * 
        concavity_worst ;
   IF MISSING( fractal_dimension_mean ) THEN S_fractal_dimension_mean  = . ;
   ELSE S_fractal_dimension_mean
          =    -9.00253413939402 +     143.666896205708 * 
        fractal_dimension_mean ;
   IF MISSING( fractal_dimension_se ) THEN S_fractal_dimension_se  = . ;
   ELSE S_fractal_dimension_se
          =    -1.36136539788035 +     367.305791698724 * fractal_dimension_se
         ;
   IF MISSING( fractal_dimension_worst ) THEN S_fractal_dimension_worst  = . ;
   ELSE S_fractal_dimension_worst
          =    -4.86183926084573 +     58.4930718814694 * 
        fractal_dimension_worst ;
   IF MISSING( perimeter_mean ) THEN S_perimeter_mean  = . ;
   ELSE S_perimeter_mean  =    -3.82488652457676 +     0.04156966188435 * 
        perimeter_mean ;
   IF MISSING( perimeter_se ) THEN S_perimeter_se  = . ;
   ELSE S_perimeter_se  =    -1.34775754728092 +      0.4681121145196 * 
        perimeter_se ;
   IF MISSING( perimeter_worst ) THEN S_perimeter_worst  = . ;
   ELSE S_perimeter_worst  =    -3.17563903366227 +     0.02955372716892 * 
        perimeter_worst ;
   IF MISSING( radius_mean ) THEN S_radius_mean  = . ;
   ELSE S_radius_mean  =    -4.05764977496878 +     0.28713377367946 * 
        radius_mean ;
   IF MISSING( radius_se ) THEN S_radius_se  = . ;
   ELSE S_radius_se  =    -1.40283152653658 +     3.48147110181667 * radius_se
         ;
   IF MISSING( radius_worst ) THEN S_radius_worst  = . ;
   ELSE S_radius_worst  =    -3.36551320681228 +     0.20684720574392 * 
        radius_worst ;
   IF MISSING( smoothness_mean ) THEN S_smoothness_mean  = . ;
   ELSE S_smoothness_mean  =    -6.99342760420755 +     72.8736992704779 * 
        smoothness_mean ;
   IF MISSING( smoothness_se ) THEN S_smoothness_se  = . ;
   ELSE S_smoothness_se  =    -2.36630202368779 +     345.757326476785 * 
        smoothness_se ;
   IF MISSING( smoothness_worst ) THEN S_smoothness_worst  = . ;
   ELSE S_smoothness_worst  =    -5.79475029800394 +     44.1748287995126 * 
        smoothness_worst ;
   IF MISSING( symmetry_mean ) THEN S_symmetry_mean  = . ;
   ELSE S_symmetry_mean  =    -6.56848536936401 +     36.4978834207944 * 
        symmetry_mean ;
   IF MISSING( symmetry_se ) THEN S_symmetry_se  = . ;
   ELSE S_symmetry_se  =    -2.58149167419602 +     125.750050862589 * 
        symmetry_se ;
   IF MISSING( symmetry_worst ) THEN S_symmetry_worst  = . ;
   ELSE S_symmetry_worst  =    -4.59287080342021 +     15.8682160344868 * 
        symmetry_worst ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     -1.0384770268112 * S_area_mean  +    -0.31624446915027 * 
        S_area_se  +    -0.44266983908294 * S_area_worst
          +      0.1753440124127 * S_compactness_mean
          +      0.3074051337239 * S_compactness_se  +    -1.11207892626932 * 
        S_compactness_worst  +     0.55468287665186 * S_concave_points_mean
          +     0.67989295120372 * S_concave_points_se
          +     0.06387513523687 * S_concave_points_worst
          +     0.68775860084696 * S_concavity_mean  +    -0.61307778424691 * 
        S_concavity_se  +     0.27890196865159 * S_concavity_worst
          +     -0.9630128793529 * S_fractal_dimension_mean
          +    -1.62527836301815 * S_fractal_dimension_se
          +    -1.08889532062515 * S_fractal_dimension_worst
          +      -0.195370769471 * S_perimeter_mean  +      1.0752564229519 * 
        S_perimeter_se  +     0.29711606400543 * S_perimeter_worst
          +    -0.37006594668447 * S_radius_mean  +    -0.33824577831892 * 
        S_radius_se  +      -0.265664872654 * S_radius_worst
          +    -1.88155613424655 * S_smoothness_mean
          +     0.38505019821322 * S_smoothness_se  +    -1.90321250461932 * 
        S_smoothness_worst  +     -0.8930305178327 * S_symmetry_mean
          +     0.62021519389082 * S_symmetry_se  +    -0.77615427846851 * 
        S_symmetry_worst ;
   H12  =    -1.32175801026771 * S_area_mean  +      -0.477409143452 * 
        S_area_se  +     0.93735320579474 * S_area_worst
          +     0.39593875195771 * S_compactness_mean
          +     0.25667488874755 * S_compactness_se  +     1.11220412397512 * 
        S_compactness_worst  +    -0.67808106831669 * S_concave_points_mean
          +    -0.03815665637598 * S_concave_points_se
          +    -1.33902575939572 * S_concave_points_worst
          +    -2.34143519960228 * S_concavity_mean  +     0.47865507866866 * 
        S_concavity_se  +    -0.53446416088267 * S_concavity_worst
          +     0.92827862863326 * S_fractal_dimension_mean
          +     1.72045368124118 * S_fractal_dimension_se
          +    -2.26580025054762 * S_fractal_dimension_worst
          +     0.22860540781086 * S_perimeter_mean  +    -0.27213447709692 * 
        S_perimeter_se  +     0.33944621197489 * S_perimeter_worst
          +    -0.62784619082323 * S_radius_mean  +    -0.68106450710717 * 
        S_radius_se  +     0.47529684777241 * S_radius_worst
          +    -0.33517905918522 * S_smoothness_mean
          +    -1.32925198102113 * S_smoothness_se  +     1.23611236760884 * 
        S_smoothness_worst  +     -0.1579681037859 * S_symmetry_mean
          +     0.37265471206316 * S_symmetry_se  +    -0.44570723571297 * 
        S_symmetry_worst ;
   H13  =       0.484280306054 * S_area_mean  +     2.69156050870574 * 
        S_area_se  +     4.11824028006232 * S_area_worst
          +    -1.57450764150447 * S_compactness_mean
          +    -3.22512115198253 * S_compactness_se  +     0.24729246928114 * 
        S_compactness_worst  +     2.37450441243376 * S_concave_points_mean
          +     1.90666537716128 * S_concave_points_se
          +    -1.53644061122821 * S_concave_points_worst
          +    -0.57929201231017 * S_concavity_mean  +    -0.71379802777961 * 
        S_concavity_se  +     0.77294721068184 * S_concavity_worst
          +     3.81316016367013 * S_fractal_dimension_mean
          +     0.37475266546511 * S_fractal_dimension_se
          +     0.31048915687575 * S_fractal_dimension_worst
          +    -0.77594722358713 * S_perimeter_mean  +     1.14606140740303 * 
        S_perimeter_se  +     1.48797572524387 * S_perimeter_worst
          +    -0.09478126862438 * S_radius_mean  +     2.04648928433954 * 
        S_radius_se  +     1.26485148325018 * S_radius_worst
          +    -1.82082389811315 * S_smoothness_mean
          +    -0.61837190979605 * S_smoothness_se  +     0.95418941055518 * 
        S_smoothness_worst  +     0.06629101577789 * S_symmetry_mean
          +    -3.61813368055851 * S_symmetry_se  +     2.19817175831678 * 
        S_symmetry_worst ;
   H11  =    -3.49423316205934 + H11 ;
   H12  =     0.92561567129862 + H12 ;
   H13  =    -0.53792252310284 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node diagnosis ;
*** *************************;

*** Generate dummy variables for diagnosis ;
drop diagnosisM diagnosisB ;
label F_diagnosis = 'From: diagnosis' ;
length F_diagnosis $ 1;
F_diagnosis = put( diagnosis , $1. );
%DMNORMIP( F_diagnosis )
if missing( diagnosis ) then do;
   diagnosisM = .;
   diagnosisB = .;
end;
else do;
   if F_diagnosis = 'B'  then do;
      diagnosisM = 0;
      diagnosisB = 1;
   end;
   else if F_diagnosis = 'M'  then do;
      diagnosisM = 1;
      diagnosisB = 0;
   end;
   else do;
      diagnosisM = .;
      diagnosisB = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_diagnosisM  =     1.11412583555609 * H11  +    -10.3986784889356 * H12
          +     7.76015562844953 * H13 ;
   P_diagnosisM  =     6.69385588428352 + P_diagnosisM ;
   P_diagnosisB  = 0; 
   _MAX_ = MAX (P_diagnosisM , P_diagnosisB );
   _SUM_ = 0.; 
   P_diagnosisM  = EXP(P_diagnosisM  - _MAX_);
   _SUM_ = _SUM_ + P_diagnosisM ;
   P_diagnosisB  = EXP(P_diagnosisB  - _MAX_);
   _SUM_ = _SUM_ + P_diagnosisB ;
   P_diagnosisM  = P_diagnosisM  / _SUM_;
   P_diagnosisB  = P_diagnosisB  / _SUM_;
END;
ELSE DO;
   P_diagnosisM  = .;
   P_diagnosisB  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_diagnosisM  =     0.37121212121212;
   P_diagnosisB  =     0.62878787878787;
END;
*** *****************************;
*** Writing the Residuals  of the Node diagnosis ;
*** ******************************;
IF MISSING( diagnosisM ) THEN R_diagnosisM  = . ;
ELSE R_diagnosisM  = diagnosisM  - P_diagnosisM ;
IF MISSING( diagnosisB ) THEN R_diagnosisB  = . ;
ELSE R_diagnosisB  = diagnosisB  - P_diagnosisB ;
*** *************************;
*** Writing the I_diagnosis  AND U_diagnosis ;
*** *************************;
_MAXP_ = P_diagnosisM ;
I_diagnosis  = "M" ;
U_diagnosis  = "M" ;
IF( _MAXP_ LT P_diagnosisB  ) THEN DO; 
   _MAXP_ = P_diagnosisB ;
   I_diagnosis  = "B" ;
   U_diagnosis  = "B" ;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
