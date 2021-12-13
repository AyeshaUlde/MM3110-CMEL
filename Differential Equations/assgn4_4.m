h1 = 6.626*10^(-34);
hbar = h1/(2*pi);
m = 9.1*10^(-31);
L = 0.5*10^(-9);
E1 = ((hbar^2)*(pi^2))/(2*m*L^2);

h = 0.1*10^(-9);
syms c x1 x2 x3 x4 
eq1 = -(2 - c)*x1 + x2 == 0;
eq2 = x1 -(2 - c)*x2 + x3 == 0;
eq3 = x2 -(2 - c)*x3 + x4 == 0;
eq4 = x3 -(2 - c)*x4 == 0;
[A,B] = equationsToMatrix([eq1, eq2, eq3, eq4], [x1, x2, x3, x4]);
eq5 = det(A) == 0;
S = solve(eq5,c);
k2 = double(S)/(h^2);
E = ((hbar^2)*k2)/(2*m);