*------------------------------------------------------------* ;
* Project Startup Code
*------------------------------------------------------------* ;
libname assign5 "C:\Users\student\OneDrive - Bryant University\Documents\GitHub\Projects_in_R\Assignments\Data";
 
proc import datafile="C:\Users\student\OneDrive - Bryant University\Documents\GitHub\Projects_in_R\Assignments\Data\breast_cancer.csv"
    out=assign5.breast_cancer
    dbms=csv replace;
    getnames=yes;
    guessingrows=max;
run;
