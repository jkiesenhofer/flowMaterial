[x,y] = meshgrid(linspace(0,2*pi,100));
rho = 7900;
mu = 1e-1;
g = 9.81;
L = (max(max(x)) + max(max(y)))/2;

u =  sin(y) + 0.5*cos(3*x).*sin(2*y);
v = -sin(x) + 0.5*sin(3*y).*cos(2*x)+rand;

speed = sqrt(u.^2 + v.^2);
Re = rho * speed .* L / mu; % Trägheitskräfte zu viskosen Kräfte

Fr = speed ./ sqrt(g .* L);  % Trägheitskräfte zu Schwerekräfte

figure(1)
imagesc(x(1,:), y(:,1), Fr)
set(gca,'YDir','normal')
colorbar
xlabel('x')
ylabel('y')
title('Fr(x,y)')

hold on
quiver(x,y,u,v,'k')
hold off

n = Re/Fr;

figure(2)
plot(x(50,:), Re)
xlim([0 L])
xlabel('x')
ylabel('y')

figure(3)
subplot(1,2,1)
plot(x(25,:), Re)
xlim([0 L])
xlabel('x')
ylabel('y')
title('Re(x,y)')
subplot(1,2,2)
surf(n)
title('O(Re/Fr)')

% Geschwindigkeit
v = linspace(0.01, 5, 100);

Re = rho * v .* L / mu; % Trägheitskräfte zu viskosen Kräfte
Fr = v ./ sqrt(g .* L);  % Trägheitskräfte zu Schwerekräfte

% Plot
figure(4)
loglog(Re, Fr, 'LineWidth', 2)
xlabel('Reynolds number')
ylabel('Froude number')
legend('Fr(Re)')
grid on
