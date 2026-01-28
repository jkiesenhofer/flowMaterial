% Physikalische Parameter
rho = 1.27;        % Dichte [kg/m^3]
delta_rho = 6900;  % Dichtedifferenz [kg/m^3]
sigma = 0.072;     % Oberflächenspannung [N/m]
g = 9.81;          % Erdbeschleunigung [m/s^2]
v = 0.5;           % Geschwindigkeit [m/s]

% Charakteristische Länge
L = linspace(1e-4, 1e-2, 200); % [m]

% Dimensionslose Kennzahlen
Eo = (delta_rho .* g .* L.^2) ./ sigma; % Gravitationskräfte zu Oberflächenspannungskräften
We = (rho .* v.^2 .* L) ./ sigma;       % Trägheitskräften zu Oberflächenspannungskräften

% Plot
figure
plot(Eo, We, 'LineWidth', 2)
xlabel('Eötvös-Zahl (Eo)')
ylabel('Weber-Zahl (We)')
grid on
