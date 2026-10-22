%macro main;

   %if %upcase(&EM_ACTION) = CREATE %then %do;
       filename temp catalog 'sashelp.hpdm.hpdmforest_create.source';
       %include temp;
       filename temp;
       %hpdm_Forest_create;
   %end;
   %else
   %if %upcase(&EM_ACTION) = TRAIN %then %do;
       filename temp catalog 'sashelp.hpdm.hpdmforest_train.source';
       %include temp;
       filename temp;
       %hpdm_Forest_train;
   %end;
   %else
   %if %upcase(&EM_ACTION) = SCORE %then %do;
       %em_checkmacro(name=EM_PROPERTY_VARSELECT, value=Y, global=Y);
       %em_checkmacro(name=EM_PROPERTY_VIMETHOD, value=LOSSREDUCTION);
        %if "&EM_PROPERTY_VARSELECT" eq "Y" and "&EM_PROPERTY_VIMETHOD" = "RBA" %then %do;
            %em_getname(key=OUTMDLFILE, type=FILE, extension=bin);
            %if %sysfunc(fileexist(&EM_USER_OUTMDLFILE))=0 %then %do;
                /* when the Variable Importance method has changed to RBA after running with Use as Modeling=No, need to re-train to create the outmdl file */
               filename temp catalog 'sashelp.hpdm.hpdmforest_train.source';
               %include temp;
               filename temp;
               %hpdm_Forest_train;
            %end;
        %end;
        filename temp catalog 'sashelp.hpdm.hpdmforest_score.source';
        %include temp;
        filename temp;
        %hpdm_Forest_score;
   %end;
   %else
   %if %upcase(&EM_ACTION) = REPORT %then %do;
       filename temp catalog 'sashelp.hpdm.hpdmforest_report.source';
       %include temp;
       filename temp;
       %hpdm_Forest_report;
   %end;
   %else

%mend main;

%main;

