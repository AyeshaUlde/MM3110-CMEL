T0 = 30;
Tm = 1064;
rho = 19.32*10^(-3); %in g/ mm^3
Cp = 0.129;
tm = 0.1;
e = 0.47;
sbc = 5.67*10^(-8);
d0 = (0.1:0.9:10);
r0 = d0/2;
V = (4/3)*pi*(r0.^3);
A = (4*pi*(r0.^2))/10^6;
color = ['b';'g';'r';'y';'m'];
line_style = {'-'; '-.'; '--'; '-';'-'};
markers = {'o','+','*','s','d'};
h_values = linspace(0.1,10,5);
for i=1:5
    h = h_values(i);
    Q0 = ((rho*V*Cp*(Tm - T0)) + (((1337^4) - (303^4))*e*sbc*A) + (h*A*(Tm-T0)))/tm;
    plot(d0,Q0,'Marker', markers{i},'color', color(i), 'linestyle', line_style{i}, 'DisplayName', ['h = ', num2str(h_values(i))])
    xlabel('d_{0} (mm)', 'FontSize', 24, 'FontName', 'Times New Roman')
    ylabel('Q_{0} (J s^{-1})', 'FontSize', 24, 'FontName', 'Times New Roman')
    title('Plot of Q_{0} vs d_{0}', 'FontSize', 28, 'FontName', 'Times New Roman')
    hold on
    xticks(0.1:0.9:10)
end
legend('Location','northwest')
hold off