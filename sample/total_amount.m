api_key = fileread('api_key.txt');
api_secret = fileread('api_secret.txt');

pub = bitbank.public();
prv = bitbank.private(api_key, api_secret);

% Get each coin price
run('get_price.m');

% Get coin amount
assets = prv.get_asset().data.assets;
volume = struct();
for i = 1:size(assets)
    volume.(assets(i).asset) = str2double(assets(i).onhand_amount);
end

% Calc equivalent of JPY
total = 0;
total = total + volume.jpy;
total = total + volume.btc * btc_jpy;
total = total + volume.ltc * ltc_jpy;
total = total + volume.xrp * xrp_jpy;
total = total + volume.bcc * bcc_jpy;
total = total + volume.eth * eth_jpy;
total = total + volume.mona * mona_jpy;
total = total + volume.xlm * xlm_jpy;

disp(total);