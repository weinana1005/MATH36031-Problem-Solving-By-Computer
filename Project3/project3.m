%% Task 1
format long;
distinctItems = unique(data.item);      % List of all distinct entries under the 'item' header
disp('Distinct Items:');                            % Display distinct items
disp(distinctItems');
totalDistinctItems = length(distinctItems);            
fprintf('\nTotal Number of Distinct Items: %d\n', totalDistinctItems);
% Display total number of distinct items
specificItems = {'tomatoes', 'beans', 'lettuce', 'carrots'};        
for i = 1:length(specificItems)                     % List distinct varieties for specific items
    item = specificItems{i};
    varieties = unique(data.variety(strcmp(data.item, item)));
    numVarieties = length(varieties);                  % Count of distinct varieties
    varietiesStr = strjoin(varieties', ', ');          % Join varieties as a single string
    fprintf('\nDistinct varieties for %s:', item);
    fprintf('%s\n', varietiesStr);
    fprintf('Total number of distinct varieties: %d\n', numVarieties);
end
%% Task 2
tomatoesData = data(strcmp(data.item, 'tomatoes'), :);% Filter data for tomatoes
% Use grpstats to calculate mean price for each variety
meanPrices = grpstats(tomatoesData, 'variety', {'mean'}, 'DataVars', 'price');
disp(meanPrices);   % Display the mean prices for each variety of tomatoes
%% Task 3
% Create a box plot for the price of different tomato varieties
boxplot(tomatoesData.price, tomatoesData.variety)
title('Price Variation of Tomato Varieties','FontSize',14)
xlabel('Tomato Varieties','FontSize',12)
ylabel('Price','FontSize',12)
grid on
%% Task 4
% Filter data for tomatoes round variety
roundTomatoesData = tomatoesData(strcmp(tomatoesData.variety, 'round'), :);
% Convert the date column to datetime format
roundTomatoesData.date = datetime(roundTomatoesData.date, 'InputFormat', 'yyyy-MM-dd');
% Plot the time series directly using datetime objects
plot(roundTomatoesData.date, roundTomatoesData.price)
title('Time Series of Round Tomato Prices','FontSize',14)
xlabel('Date','FontSize',12)
ylabel('Price','FontSize',12)
% Improve the readability of the x-axis dates
datetick('x')
axis tight % Removes the extra margin around the data
%% Task 5
carrotData = data(strcmp(data.item, 'carrots'), :);         % Find carrots data
roundTomatoData = data(strcmp(data.item, 'tomatoes') & strcmp(data.variety, 'round'), :);
carrotData.date = datetime(carrotData.date);                % Convert dates to datetime and sort by date
roundTomatoData.date = datetime(roundTomatoData.date);
carrotData = sortrows(carrotData, 'date');
roundTomatoData = sortrows(roundTomatoData, 'date');
% Fill missing values in the price data
carrotData.price = fillmissing(carrotData.price, 'linear');
roundTomatoData.price = fillmissing(roundTomatoData.price, 'linear');
% Find common dates in both datasets
[commonDates, ia, ib] = intersect(carrotData.date, roundTomatoData.date);
% Select prices for common dates
carrotPrices = carrotData.price(ia);
tomatoPrices = roundTomatoData.price(ib);
% Calculate the correlation coefficient for the common date prices
corrCoeff = corrcoef(carrotPrices, tomatoPrices);
% Display the correlation coefficient
disp('Correlation Coefficient between Carrot Prices and Round Tomato Prices:');
disp(corrCoeff(1,2));
