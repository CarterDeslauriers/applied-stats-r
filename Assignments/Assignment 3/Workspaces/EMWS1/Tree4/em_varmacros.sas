*------------------------------------------------------------*;
* Variable Macros;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* General Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_VARS = 28;
   %macro EM_VARS;
    area_mean area_se area_worst compactness_mean compactness_se compactness_worst
   concave_points_mean concave_points_se concave_points_worst concavity_mean
   concavity_se concavity_worst diagnosis fractal_dimension_mean
   fractal_dimension_se fractal_dimension_worst perimeter_mean perimeter_se
   perimeter_worst radius_mean radius_se radius_worst smoothness_mean
   smoothness_se smoothness_worst symmetry_mean symmetry_se symmetry_worst
   %mend EM_VARS;
%let EM_NUM_CLASS = 1;
   %macro EM_CLASS;
    diagnosis
   %mend EM_CLASS;
%let EM_NUM_INTERVAL = 27;
   %macro EM_INTERVAL;
    area_mean area_se area_worst compactness_mean compactness_se compactness_worst
   concave_points_mean concave_points_se concave_points_worst concavity_mean
   concavity_se concavity_worst fractal_dimension_mean fractal_dimension_se
   fractal_dimension_worst perimeter_mean perimeter_se perimeter_worst radius_mean
   radius_se radius_worst smoothness_mean smoothness_se smoothness_worst
   symmetry_mean symmetry_se symmetry_worst
   %mend EM_INTERVAL;
%let EM_NUM_REPORT_VARS = 0;
   %macro  EM_REPORT_VARS; %mend;
%let EM_NUM_CLASS_REPORT = 0;
   %macro  EM_CLASS_REPORT; %mend;
%let EM_NUM_INTERVAL_REPORT = 0;
   %macro  EM_INTERVAL_REPORT; %mend;
*------------------------------------------------------------*;
* Target Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_TARGET = 1;
   %macro EM_TARGET;
    diagnosis
   %mend EM_TARGET;
%let EM_NUM_TARGET_LEVEL = 1;
   %macro EM_TARGET_LEVEL;
    BINARY
   %mend EM_TARGET_LEVEL;
%let EM_NUM_BINARY_TARGET = 1;
   %macro EM_BINARY_TARGET;
    diagnosis
   %mend EM_BINARY_TARGET;
%let EM_NUM_ORDINAL_TARGET = 0;
   %macro  EM_ORDINAL_TARGET; %mend;
%let EM_NUM_NOMINAL_TARGET = 0;
   %macro  EM_NOMINAL_TARGET; %mend;
%let EM_NUM_INTERVAL_TARGET = 0;
   %macro  EM_INTERVAL_TARGET; %mend;
*------------------------------------------------------------*;
* Input Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_INPUT = 27;
   %macro EM_INPUT;
    area_mean area_se area_worst compactness_mean compactness_se compactness_worst
   concave_points_mean concave_points_se concave_points_worst concavity_mean
   concavity_se concavity_worst fractal_dimension_mean fractal_dimension_se
   fractal_dimension_worst perimeter_mean perimeter_se perimeter_worst radius_mean
   radius_se radius_worst smoothness_mean smoothness_se smoothness_worst
   symmetry_mean symmetry_se symmetry_worst
   %mend EM_INPUT;
%let EM_NUM_BINARY_INPUT = 0;
   %macro  EM_BINARY_INPUT; %mend;
%let EM_NUM_ORDINAL_INPUT = 0;
   %macro  EM_ORDINAL_INPUT; %mend;
%let EM_NUM_NOMINAL_INPUT = 0;
   %macro  EM_NOMINAL_INPUT; %mend;
%let EM_NUM_INTERVAL_INPUT = 27;
   %macro EM_INTERVAL_INPUT;
    area_mean area_se area_worst compactness_mean compactness_se compactness_worst
   concave_points_mean concave_points_se concave_points_worst concavity_mean
   concavity_se concavity_worst fractal_dimension_mean fractal_dimension_se
   fractal_dimension_worst perimeter_mean perimeter_se perimeter_worst radius_mean
   radius_se radius_worst smoothness_mean smoothness_se smoothness_worst
   symmetry_mean symmetry_se symmetry_worst
   %mend EM_INTERVAL_INPUT;
*------------------------------------------------------------*;
* Rejected Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_REJECTED = 0;
   %macro  EM_REJECTED; %mend;
%let EM_NUM_BINARY_REJECTED = 0;
   %macro  EM_BINARY_REJECTED; %mend;
%let EM_NUM_ORDINAL_REJECTED = 0;
   %macro  EM_ORDINAL_REJECTED; %mend;
%let EM_NUM_NOMINAL_REJECTED = 0;
   %macro  EM_NOMINAL_REJECTED; %mend;
%let EM_NUM_INTERVAL_REJECTED = 0;
   %macro  EM_INTERVAL_REJECTED; %mend;
*------------------------------------------------------------*;
* Misc Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_ASSESS = 0;
   %macro  EM_ASSESS; %mend;
%let EM_NUM_INTERVAL_ASSESS = 0;
   %macro  EM_INTERVAL_ASSESS; %mend;
%let EM_NUM_CLASS_ASSESS = 0;
   %macro  EM_CLASS_ASSESS; %mend;
%let EM_NUM_CENSOR = 0;
   %macro  EM_CENSOR; %mend;
%let EM_NUM_CLASSIFICATION = 0;
   %macro  EM_CLASSIFICATION; %mend;
%let EM_NUM_COST = 0;
   %macro  EM_COST; %mend;
%let EM_NUM_CROSSID = 0;
   %macro  EM_CROSSID; %mend;
%let EM_NUM_DECISION = 0;
   %macro  EM_DECISION; %mend;
%let EM_NUM_FREQ = 0;
   %macro  EM_FREQ; %mend;
%let EM_NUM_ID = 0;
   %macro  EM_ID; %mend;
%let EM_NUM_LABEL = 0;
   %macro  EM_LABEL; %mend;
%let EM_NUM_PREDICT = 0;
   %macro  EM_PREDICT; %mend;
%let EM_NUM_REFERRER = 0;
   %macro  EM_REFERRER; %mend;
%let EM_NUM_REJECTS = 3;
   %macro EM_REJECTS;
    texture_mean texture_se texture_worst
   %mend EM_REJECTS;
%let EM_NUM_RESIDUAL = 0;
   %macro  EM_RESIDUAL; %mend;
%let EM_NUM_SEGMENT = 0;
   %macro  EM_SEGMENT; %mend;
%let EM_NUM_SEQUENCE = 0;
   %macro  EM_SEQUENCE; %mend;
%let EM_NUM_TEXT = 0;
   %macro  EM_TEXT; %mend;
%let EM_NUM_TIMEID = 0;
   %macro  EM_TIMEID; %mend;
%let EM_NUM_TREATMENT = 0;
   %macro  EM_TREATMENT; %mend;
%let EM_NUM_KEY = 0;
   %macro  EM_KEY; %mend;
*------------------------------------------------------------*;
* End Create EM Macro Variables and Macros;
*------------------------------------------------------------*;
