classdef public
    
    properties
        end_point = 'https://public.bitbank.cc';
    end
    
    methods (Access = private)
        function response = query(this, query_url)
            response = webread(query_url);
        end
    end
    
    methods
        function ticker = get_ticker(this, pair)
            path = ['/', pair, '/ticker'];
            ticker = this.query([this.end_point, path]);
        end
        
        function depth = get_depth(this, pair)
            path = ['/', pair, '/depth'];
            depth = this.query([this.end_point, path]);
        end
        
        function transactions = get_transactions(this, pair, yyyymmdd)
            path = ['/', pair, '/transactions'];
            if nargin == 3
                path = [path, '/', yyyymmdd];
            end
            transactions = this.query([this.end_point, path]);
        end
        
        function candlestick = get_candlestick(this, pair, candle_type, yyyymmdd)
            path =  ['/', pair, '/candlestick/', candle_type, '/', yyyymmdd];
            candlestick = this.query([this.end_point, path]);
        end
    end
end
