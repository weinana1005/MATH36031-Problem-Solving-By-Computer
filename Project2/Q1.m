function [timeToCatch, isCaught] = chaseConstantSpeed()
    % Initial Conditions
    foxSpeed = 17; % m/s
    rabbitSpeed = 12; % m/s
    initialDistance = 100; % meters, example initial distance
    catchDistance = 0.1; % meters, distance for catching the rabbit

    % Time span
    tspan = [0, 100]; % seconds, adjust as needed

    % Solve using ode45
    [T, Y] = ode45(@(t, y) speedFunction(t, y, foxSpeed, rabbitSpeed), tspan, initialDistance);

    % Check if and when the fox catches the rabbit
    caughtIdx = find(Y <= catchDistance, 1);
    if isempty(caughtIdx)
        timeToCatch = NaN; % Fox never catches the rabbit
        isCaught = false;
    else
        timeToCatch = T(caughtIdx);
        isCaught = true;
    end

    % Plot
    figure;
    plot(T, Y);
    xlabel('Time (s)');
    ylabel('Distance (m)');
    title('Distance Between Fox and Rabbit Over Time');
end

function dydt = speedFunction(t, y, foxSpeed, rabbitSpeed)
    dydt = rabbitSpeed - foxSpeed;
end
