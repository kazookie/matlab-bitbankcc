classdef private    
    properties
        end_point = 'https://api.bitbank.cc/v1';
        api_key;
        api_secret;
    end
    
    methods (Access = private)
        function h = sign_request(this, key, query)
            hmac = py.importlib.import_module('hmac');
            hashlib = py.importlib.import_module('hashlib');
            hash = hmac.new(...
                py.bytes(key, 'ascii'), ...
                py.bytes(query, 'ascii'), ...
                hashlib.sha256);
            h = char(hash.hexdigest());
        end
        
        function headers = make_header(this, query_data, api_key, api_secret)
            unix_time = posixtime(datetime('now', 'TimeZone', 'UTC'))*1000;
            nonce = num2str(round(unix_time, 0));
            message = [nonce, query_data];
            
            headers = weboptions('ContentType', 'json', ...
                'MediaType', 'application/json', ...
                'HeaderFields', {...
                    'ACCESS-KEY', api_key; ...
                    'ACCESS-NONCE', nonce; ...
                    'ACCESS-SIGNATURE', this.sign_request(api_secret, message)
                    });
        end
        
        function response = get_query(this, path, query)
            urllib = py.importlib.import_module('urllib');
            request = char(urllib.parse.urlencode(query));
            data = ['/v1', path, request];
            headers = this.make_header(data, this.api_key, this.api_secret);
            uri = [this.end_point, path, request];
            response = webread(uri, headers);
        end
        
        function response = post_query(this, path, query)
            data = jsonencode(query);
            headers = this.make_header(data, this.api_key, this.api_secret);
            uri = [this.end_point, path];
            response = webwrite(uri, query, headers);
        end
    end
    
    methods
        function this = private(api_key,api_secret)
            this.api_key = api_key;
            this.api_secret = api_secret;
        end
        
        function asset = get_asset(this)
            query = struct();
            asset = this.get_query('/user/assets', query);
        end
        
        function order = get_order(this, pair, order_id)
            query.pair = pair;
            query.order_id = order_id;
            order = this.get_query('/user/spot/order?', query);
        end
        
        function active_order = get_active_orders(this, pair, options)
            query.pair = pair;
            active_order = this.get_query('/user/spot/active_orders?', query);
        end
        
        function order = order(this, pair, price, amount, side, order_type)
            query.pair = pair;
            query.price = price;
            query.amount = amount;
            query.side = side;
            query.type = order_type;
            order = this.post_query('/user/spot/order', query);
        end
        
        function cancel = cancel_order(this, pair, order_id)
            query.pair = pair;
            query.order_id = order_id;
            cancel = this.post_query('/user/spot/cancel_order', query);
        end
        
        function cancel = cancel_orders(this, pair, order_ids)
            query.pair = pair;
            query.order_ids = order_ids;
            cancel = this.post_query('/user/spot/cancel_orders', query);
        end
        
        function orders_info = get_orders_info(this, pair, order_ids)
            query.pair = pair;
            query.order_ids = order_ids;
            orders_info = this.post_query('/user/spot/orders_info', query);
        end
        
        function trade_history = get_trade_history(this, pair, order_count)
            query.pair = pair;
            if nargin == 3
                    query.count = order_count;
            end
            trade_history = this.get_query('/user/spot/trade_history?', query);
        end
        
        function withdraw_account = get_withdraw_account(this, asset)
            query.asset = asset;
            withdraw_account = this.get_query('/user/withdrawal_account?', query);
        end
    end
end

