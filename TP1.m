%% The variables needed
A1 = [2 0 -2 4 0; 2 -4 0 -2 0; 2 0 1 1 1];
b1 = [4 6 10]';
c1 = [-4 4 2 -2 0]';

A2 = [1 -2 0 -1 0; 0 -2 1 -3 0; 0 6 0 6 1];
b2 = [3 1 3]';

v = [1 3 5];

A3 = [1 1 -1 4; 1 -2 -1 1];
b3 = [8 2]';
c3 = [1 1 1 1]';

A4 = [4 2 -1 0; 1 4 0 -1];
b4 = [12 6]';
c4 = [2 3 0 0]';

%% Exhaustive_LP test
fprintf("Exhaustive LP test :\n");

fprintf("\nTest 1 start ---------\n");
fprintf("\n Matrixes used : \n");
A3
b3
c3
fprintf("------\n");
[f, x, B] = Exhaustive_LP(A3,b3,c3);
f
x
B
fprintf("Test 1 end --------\n");

fprintf("\nTest 2 start ---------\n");
fprintf("\n Matrixes used : \n");
A4
b4
c4
fprintf("------\n");
[f, x, B] = Exhaustive_LP(A4,b4,c4);
f
x
B
fprintf("Test 2 end --------\n");

fprintf("Exhaustive LP test over\n\n");

%% One phase simplex method test
fprintf("\n Testing one phase simplex method: \n")

fprintf("\nTest 1 start ---------\n");
fprintf("\nMatrixes used : \n");
A1
b1
c1
v
fprintf("------\n");
[f, x, B] = LP_Simplex(A1,b1,c1,v);
f
x
B
fprintf("Test 1 end --------\n");

fprintf("\nTest 2 start ---------\n");
fprintf("\nMatrixes used : \n");
A2
b2
c1
v
fprintf("------\n");
[f, x, B] = LP_Simplex(A2,b2,c1,v);
f
x
B
fprintf("Test 2 end --------\n");

fprintf("\nOne phase simplex method test over\n")

%% Two phase simplex method test
fprintf("\n Testing two phase simplex method: \n")

fprintf("\nTest 1 start ---------\n");
fprintf("\nMatrixes used : \n");
A1
b1
c1
fprintf("------\n");
[f, x, B] = LP_Two_Phase_Simplex(A1,b1,c1);
f
x
B
fprintf("Test 1 end --------\n");


fprintf("\nTest 2 start ---------\n");
fprintf("\nMatrixes used : \n");
A4
b4
c4
fprintf("------\n");
[f, x, B] = LP_Two_Phase_Simplex(A4,b4,c4);
f
x
B
fprintf("Test 2 end --------\n");

fprintf("\nTwo phase simplex method test over\n")

%% clearing the variables to avoid a mess
clear A1;
clear b1;
clear c1;
clear A2;
clear b2;
clear A3;
clear b3;
clear c3;
clear A4;
clear b4;
clear c4;
clear f;
clear x;
clear B;
clear v;