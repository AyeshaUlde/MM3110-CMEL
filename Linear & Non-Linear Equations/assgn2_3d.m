Cp0 = [25.279; 25.465; 25.637; 25.811; 25.996;  26.196; 26.415;  26.655; 26.916; 27.199;...
    27.505; 27.835; 28.188; 28.565;  28.966; 29.392; 29.841; 30.315;  30.814;  31.337; 31.884; 32.309];
T = [300; 350; 400; 450; 500; 550; 600; 650; 700; 750; ...
    800; 850; 900; 950; 1000; 1050; 1100; 1150; 1200; 1250; 1300; 1337];
%Cp0 is in J/(mol K)
load census;
%f=fit(T,Cp0,'poly1');
%plot(f,T,Cp0)
%xlabel('T (K)', 'FontSize', 24, 'FontName', 'Times New Roman')
%ylabel('C_{P}^{0} (J K^{-1} mol^{-1})', 'FontSize', 24, 'FontName', 'Times New Roman')
%title('Plot of C_{P}^{0} vs T', 'FontSize', 28, 'FontName', 'Times New Roman')
[curvefit,gof,output] = fit(T,Cp0,'poly1','normalize','off');

CpTm = curvefit(1337)/197;
CpT0 = curvefit(303)/197;
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
    Q0 = ((rho*V*((CpTm*1337) - (CpT0*303))) + (((1337^4) - (303^4))*e*sbc*A) + (h*A*(Tm-T0)))/tm;
    plot(d0,Q0,'Marker', markers{i},'color', color(i), 'linestyle', line_style{i}, 'DisplayName', ['h = ', num2str(h_values(i))])
    xlabel('d_{0} (mm)', 'FontSize', 24, 'FontName', 'Times New Roman')
    ylabel('Q_{0} (J s^{-1})', 'FontSize', 24, 'FontName', 'Times New Roman')
    title('Plot of Q_{0} vs d_{0}', 'FontSize', 28, 'FontName', 'Times New Roman')
    hold on
    xticks(0.1:0.9:10)
end
legend('Location','northwest')
hold off