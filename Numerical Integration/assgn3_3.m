t = (2:0.25:8);
q = (9 + 4*(cos(0.4*t)).^2);
c = (5*exp(-0.5*t)) + (2*exp(-0.15*t));
M = @(x)(9 + 4*(cos(0.4*x)).^2).*((5*exp(-0.5*x)) + (2*exp(-0.15*x)));
tmt = integral(M,2,8)
syms z
f = (9 + 4*(cos(0.4*z))^2)*((5*exp(-0.5*z)) + (2*exp(-0.15*z)));
M1 = zeros(1,length(t));
for i = 1:length(t)-1
    M1(i+1) = int(f,t(i),t(i+1));
end
plot(t,M1,'-r', 'LineWidth',2.5)
xlabel('t (min)', 'FontSize', 24, 'FontName', 'Times New Roman')
ylabel('Q(t), c(t) & M(t)', 'FontSize', 24, 'FontName', 'Times New Roman')
title('Plot of Q(t), c(t) & M(t)', 'FontSize', 28, 'FontName', 'Times New Roman')
hold on
plot(t,q,'--b', 'LineWidth',1)
hold on
plot(t,c,'-.g', 'LineWidth',1)
hold off
legend('Instantaneous mass transported M(t)','Mass flow rate Q(t)','Mass concentration c(t)','Location','northwest','FontSize', 20, 'FontName', 'Times New Roman')