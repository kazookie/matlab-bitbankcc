# matlab-bitbankcc
matlab-bitbankcc is library to use bitbank API on MATLAB.  
This library is referring to [python-bitbankcc](https://github.com/bitbankinc/python-bitbankcc).

## Useage
Add this project to MATLAB path.

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
```
