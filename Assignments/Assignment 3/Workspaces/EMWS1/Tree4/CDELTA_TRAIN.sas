if upcase(NAME) = "AREA_SE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "AREA_WORST" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "COMPACTNESS_MEAN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "COMPACTNESS_SE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "COMPACTNESS_WORST" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CONCAVE_POINTS_MEAN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CONCAVE_POINTS_SE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CONCAVE_POINTS_WORST" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CONCAVITY_MEAN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CONCAVITY_SE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CONCAVITY_WORST" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "FRACTAL_DIMENSION_MEAN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "FRACTAL_DIMENSION_SE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "FRACTAL_DIMENSION_WORST" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PERIMETER_MEAN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PERIMETER_SE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_DIAGNOSISB" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_DIAGNOSISM" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "RADIUS_MEAN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "RADIUS_SE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "RADIUS_WORST" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "SMOOTHNESS_MEAN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "SMOOTHNESS_SE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "SMOOTHNESS_WORST" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "SYMMETRY_MEAN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "SYMMETRY_SE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "SYMMETRY_WORST" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
