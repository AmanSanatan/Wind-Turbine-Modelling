% Define constants
rated_wind_speed = 12; % Rated wind speed in m/s
lambda = 8.1; % Tip speed ratio at rated wind speed
radius = 1.3; % Rotor radius in meters
rated_power = 12.3e3; % Rated power in watts (12.3 kW)
P_dc = 0.469e3; % DC power in watts (0.469 kW)

% Wind Energy Utilization factor
wind_energy_utilization_factor = 0.469;

% Define a range of wind speeds near rated speed
wind_speeds = linspace(10, 15, 10); % Wind speed from 10 to 15 m/s

% Initialize variables to store results
power_output = zeros(size(wind_speeds));
rotor_speed = zeros(size(wind_speeds));
P_m = zeros(size(wind_speeds));

% Loop through each wind speed in the range
for i = 1:length(wind_speeds)
    % Calculate rotor speed wr using the given formula
    wr = (lambda * wind_speeds(i)) / radius; % Rotor speed in rad/s
    
    % Calculate the mechanical power P_m based on wind speed
    P_m(i) = 0.5 * 1.225 * pi * radius^2 * wind_speeds(i)^3; % Power in watts, assuming air density 1.225 kg/m^3
    
    % Calculate power output (simplified model, you could replace with your model's equation)
    power_output(i) = P_m(i) * wind_energy_utilization_factor; % Assuming linear scaling with the factor
    
    % Store rotor speed
    rotor_speed(i) = wr;
end

% Plot results for visual comparison
figure;
subplot(3,1,1);
plot(wind_speeds, P_m / 1000, '-o'); % Plot mechanical power (in kW)
xlabel('Wind Speed (m/s)');
ylabel('Mechanical Power (kW)');
title('Mechanical Power vs Wind Speed');

subplot(3,1,2);
plot(wind_speeds, power_output / 1000, '-o'); % Plot output power (in kW)
xlabel('Wind Speed (m/s)');
ylabel('Power Output (kW)');
title('Power Output vs Wind Speed');

subplot(3,1,3);
plot(wind_speeds, rotor_speed, '-o'); % Plot rotor speed (in rad/s)
xlabel('Wind Speed (m/s)');
ylabel('Rotor Speed (rad/s)');
title('Rotor Speed vs Wind Speed');
