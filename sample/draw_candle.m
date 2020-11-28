pub = bitbank.public();

% Bitcon
res1 = pub.get_candlestick('btc_jpy', '4hour', '2018');
res2 = pub.get_candlestick('btc_jpy', '4hour', '2019');
res3 = pub.get_candlestick('btc_jpy', '4hour', '2020');

ohlcv2018 = cat(2, res1.data.candlestick.ohlcv{:,1})';
ohlcv2019 = cat(2, res2.data.candlestick.ohlcv{:,1})';
ohlcv2020 = cat(2, res3.data.candlestick.ohlcv{:,1})';

ohlcvAll = cat(1, ohlcv2018, ohlcv2019, ohlcv2020);
timestamp = datetime(cat(1, ohlcvAll{:,[6]})/1000, 'ConvertFrom', 'posixtime');

candleData = timetable(timestamp);
candleData.Open = str2double(ohlcvAll(:,1));
candleData.High = str2double(ohlcvAll(:,2));
candleData.Low = str2double(ohlcvAll(:,3));
candleData.Close = str2double(ohlcvAll(:,4));
candleData.Volume = str2double(ohlcvAll(:,5));

stackedplot(candleData);

% all_data = cat(1, data1, data2, data3);
% plot(all_data(:,1:4));