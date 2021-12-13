syms T_11 T_21 T_31 T_12 T_22 T_32 T_13 T_23 T_33
eqn1 = T_21 + T_12 - (4*T_11) + 30 == 0;
eqn2 = T_22 + T_11 + T_31 - (4*T_21) == 0;
eqn3 = T_32 + T_21 - (4*T_31) + 60 == 0;
eqn4 = T_13 + T_11 + T_22 - (4*T_12) + 30 == 0;
eqn5 = T_32 + T_12 + T_23 + T_21 - (4*T_22) == 0;
eqn6 = T_22 + T_31 + T_33 - (4*T_32) + 60 == 0;
eqn7 = T_23 + T_12 + 130 - (4*T_13) == 0;
eqn8 = T_33 + T_13 + T_22 - (4*T_23) + 100 == 0;
eqn9 = T_23 + T_32 + 160 - (4*T_33) == 0;
sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6, eqn7, eqn8, eqn9], [T_11, T_21, T_31, T_12, T_22, T_32, T_13, T_23, T_33]);
fprintf('T(1,1) = %.2f\n', sol.T_11)
fprintf('T(2,1) = %.2f\n', sol.T_21)
fprintf('T(3,1) = %.2f\n', sol.T_31)
fprintf('T(1,2) = %.2f\n', sol.T_12)
fprintf('T(2,2) = %.2f\n', sol.T_22)
fprintf('T(3,2) = %.2f\n', sol.T_32)
fprintf('T(1,3) = %.2f\n', sol.T_13)
fprintf('T(2,3) = %.2f\n', sol.T_23)
fprintf('T(3,3) = %.2f\n', sol.T_33)