data EMWS1.MdlComp2_EMRANK;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree5" MODEL "Tree5" MODELDESCRIPTION "Gini Tree 2" TARGETLABEL "";
set EMWS1.Tree5_EMRANK;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMSCOREDIST;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree5" MODEL "Tree5" MODELDESCRIPTION "Gini Tree 2" TARGETLABEL "";
set EMWS1.Tree5_EMSCOREDIST;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMOUTFIT;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree5" MODEL "Tree5" MODELDESCRIPTION "Gini Tree 2" TARGETLABEL "";
set WORK.Tree5_OUTFIT;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMCLASSIFICATION;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree5" MODEL "Tree5" MODELDESCRIPTION "Gini Tree 2" TARGETLABEL "";
set EMWS1.Tree5_EMCLASSIFICATION;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMEVENTREPORT;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree5" MODEL "Tree5" MODELDESCRIPTION "Gini Tree 2" TARGETLABEL "";
set EMWS1.Tree5_EMEVENTREPORT;
where upcase(TARGET) = upcase("diagnosis");
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree6" MODEL "Tree6" MODELDESCRIPTION "Entropy Tree 2" TARGETLABEL "";
set EMWS1.Tree6_EMRANK;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMRANK;
set EMWS1.MdlComp2_EMRANK work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree6" MODEL "Tree6" MODELDESCRIPTION "Entropy Tree 2" TARGETLABEL "";
set EMWS1.Tree6_EMSCOREDIST;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMSCOREDIST;
set EMWS1.MdlComp2_EMSCOREDIST work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree6" MODEL "Tree6" MODELDESCRIPTION "Entropy Tree 2" TARGETLABEL "";
set WORK.Tree6_OUTFIT;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMOUTFIT;
set EMWS1.MdlComp2_EMOUTFIT work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree6" MODEL "Tree6" MODELDESCRIPTION "Entropy Tree 2" TARGETLABEL "";
set EMWS1.Tree6_EMCLASSIFICATION;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMCLASSIFICATION;
set EMWS1.MdlComp2_EMCLASSIFICATION work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree6" MODEL "Tree6" MODELDESCRIPTION "Entropy Tree 2" TARGETLABEL "";
set EMWS1.Tree6_EMEVENTREPORT;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMEVENTREPORT;
set EMWS1.MdlComp2_EMEVENTREPORT work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree7" MODEL "Tree7" MODELDESCRIPTION "ChiSq Tree 2" TARGETLABEL "";
set EMWS1.Tree7_EMRANK;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMRANK;
set EMWS1.MdlComp2_EMRANK work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree7" MODEL "Tree7" MODELDESCRIPTION "ChiSq Tree 2" TARGETLABEL "";
set EMWS1.Tree7_EMSCOREDIST;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMSCOREDIST;
set EMWS1.MdlComp2_EMSCOREDIST work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree7" MODEL "Tree7" MODELDESCRIPTION "ChiSq Tree 2" TARGETLABEL "";
set WORK.Tree7_OUTFIT;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMOUTFIT;
set EMWS1.MdlComp2_EMOUTFIT work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree7" MODEL "Tree7" MODELDESCRIPTION "ChiSq Tree 2" TARGETLABEL "";
set EMWS1.Tree7_EMCLASSIFICATION;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMCLASSIFICATION;
set EMWS1.MdlComp2_EMCLASSIFICATION work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree7" MODEL "Tree7" MODELDESCRIPTION "ChiSq Tree 2" TARGETLABEL "";
set EMWS1.Tree7_EMEVENTREPORT;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMEVENTREPORT;
set EMWS1.MdlComp2_EMEVENTREPORT work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree8" MODEL "Tree8" MODELDESCRIPTION "4-Leaf Tree 2" TARGETLABEL "";
set EMWS1.Tree8_EMRANK;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMRANK;
set EMWS1.MdlComp2_EMRANK work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree8" MODEL "Tree8" MODELDESCRIPTION "4-Leaf Tree 2" TARGETLABEL "";
set EMWS1.Tree8_EMSCOREDIST;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMSCOREDIST;
set EMWS1.MdlComp2_EMSCOREDIST work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree8" MODEL "Tree8" MODELDESCRIPTION "4-Leaf Tree 2" TARGETLABEL "";
set WORK.Tree8_OUTFIT;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMOUTFIT;
set EMWS1.MdlComp2_EMOUTFIT work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree8" MODEL "Tree8" MODELDESCRIPTION "4-Leaf Tree 2" TARGETLABEL "";
set EMWS1.Tree8_EMCLASSIFICATION;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMCLASSIFICATION;
set EMWS1.MdlComp2_EMCLASSIFICATION work.MdlComp2_TEMP;
run;
data work.MdlComp2_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree8" MODEL "Tree8" MODELDESCRIPTION "4-Leaf Tree 2" TARGETLABEL "";
set EMWS1.Tree8_EMEVENTREPORT;
where upcase(TARGET) = upcase("diagnosis");
run;
data EMWS1.MdlComp2_EMEVENTREPORT;
set EMWS1.MdlComp2_EMEVENTREPORT work.MdlComp2_TEMP;
run;
