# matlab-bitbankcc
matlab-bitbankcc is library to use bitbank API on MATLAB.  
This library is referring to [python-bitbankcc](https://github.com/bitbankinc/python-bitbankcc).

![Reference_image](https://raw.githubusercontent.com/kazookie/matlab-bitbankcc/main/docs/img/reference_image.png)

## Useage
Add this project to MATLAB path.

This library depends on hmac and hashlib of python.

## Public API
```matlab
pub = bitbank.public()

ticker = pub.get_ticker('btc_jpy')

depth = pub.get_depth('btc_jpy')

trans = pub.get_transactions('btc_jpy')

trans = pub.get_transactions('btc_jpy', '20201122')

candle = pub.get_candlestick('btc_jpy', '1hour', '20201122')
```

## Private API
```matlab
API_KEY = 'Your API key'
API_SECRET = 'Your API secret'

prv = bitbank.private(API_KEY, API_SECRET)

assets = prv.get_asset()

order = value = prv.get_order('btc_jpy', '11015239564')

active_order = prv.get_active_orders('btc_jpy')

order = prv.order('btc_jpy', '1600000', '0.0001', 'buy', 'limit')

cancel = prv.cancel_order('btc_jpy', '11030826133')

cancel = prv.cancel_orders('btc_jpy', {'11016114534','11019131180'})

order_info = prv.get_orders_info('btc_jpy', {'11267312740', '11416348938'})

history = prv.get_trade_history('btc_jpy', '10')
```
