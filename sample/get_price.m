pub = bitbank.public();

% Bitcon
res = pub.get_transactions('btc_jpy');
btc_jpy = str2double(res.data.transactions(1).price);
disp(['BTC/JPY: ', sprintf('%.3f',btc_jpy)]);

% Litecoin
res = pub.get_transactions('ltc_jpy');
ltc_jpy = str2double(res.data.transactions(1).price);
disp(['LTC/JPY: ', sprintf('%.3f',ltc_jpy)]);

% ethereum
res = pub.get_transactions('eth_jpy');
eth_jpy = str2double(res.data.transactions(1).price);
disp(['ETH/JPY: ', sprintf('%.3f',eth_jpy)]);

% Ripple
res = pub.get_transactions('xrp_jpy');
xrp_jpy = str2double(res.data.transactions(1).price);
disp(['XRP/JPY: ', sprintf('%.3f',xrp_jpy)]);

% BitcoinCash
res = pub.get_transactions('bcc_jpy');
bcc_jpy = str2double(res.data.transactions(1).price);
disp(['BCC/JPY: ', sprintf('%.3f',bcc_jpy)]);

% MonaCoin
res = pub.get_transactions('mona_jpy');
mona_jpy =str2double(res.data.transactions(1).price);
disp(['MONA/JPY: ', sprintf('%.3f',mona_jpy)]);

% Stellar Lumens
res = pub.get_transactions('xlm_jpy');
xlm_jpy = str2double(res.data.transactions(1).price);
disp(['XLM/JPY: ', sprintf('%.3f',xlm_jpy)]);