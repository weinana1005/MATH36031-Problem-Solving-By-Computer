function isClear = Sight(z, r, A, E)
    % Check if the line from the fox (z) to the rabbit (r) intersects the line from E to A
    foxToRabbitStart = z;           % Line segment from fox to rabbit
    foxToRabbitEnd = r;
    FenceStart = E;                  % Line segment representing the fence
    FenceEnd= A;
    % Perform intersection test
    isBlocked = doLinesIntersect(foxToRabbitStart, foxToRabbitEnd, FenceStart, FenceEnd);
    % If blocked, return false. Otherwise, return true
    isClear = ~isBlocked;
end
function intersect = doLinesIntersect(a, b, c, d)
    % Function to check if line segments ab and cd intersect
    % Calculate the denominator
    denominator = (b(1) - a(1)) * (d(2) - c(2)) - (b(2) - a(2)) * (d(1) - c(1));
    % Lines are parallel or coincident
    if denominator == 0
        intersect = false;
        return;
    end
    % Calculate parameters t and u
    t = ((a(2) - c(2)) * (d(1) - c(1)) - (a(1) - c(1)) * (d(2) - c(2))) / denominator;
    u = ((b(1) - a(1)) * (a(2) - c(2)) - (b(2) - a(2)) * (a(1) - c(1))) / denominator;
    % Check if t and u fall within the range [0, 1]
    intersect = (t >= 0 && t <= 1) && (u >= 0 && u <= 1);
end
