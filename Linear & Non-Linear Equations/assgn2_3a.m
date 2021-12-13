T0 = 30;
Tm = 1064;
rho = 19.32*10^(-3); %in g/ mm^3
Cp = 0.129;
tm = 0.1;
d0 = (0.1:0.9:10);
r0 = d0/2;
V = (4/3)*pi*(r0.^3);
Q0 = (rho*V*Cp*(Tm - T0))/tm;
plot(d0,Q0)
xlabel('d_{0} (mm)', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('Q_{0} (J s^{-1})', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Plot of Q_{0} vs d_{0}', 'FontSize', 28, 'FontName', 'Times New Roman')
xticks(0.1:0.9:10)