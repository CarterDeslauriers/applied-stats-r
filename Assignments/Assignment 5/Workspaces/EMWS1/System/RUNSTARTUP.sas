*------------------------------------------------------------* ;
* Project Startup Code
*------------------------------------------------------------* ;
libname bcw "C:\Users\student\OneDrive - Bryant University\Documents\GitHub\Projects_in_R\Assignments\Data";
 
proc import datafile="C:\Users\student\OneDrive - Bryant University\Documents\GitHub\Projects_in_R\Assignments\Data\breast_cancer.csv"
    out=bcw.breast_cancer
    dbms=csv replace;
    getnames=yes;
    guessingrows=max;
run;
