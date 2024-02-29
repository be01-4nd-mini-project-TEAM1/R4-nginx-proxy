proxy_cache_path /var/cache/nginx/ levels=1:2 keys_zone=my_cache:10m max_size=10g inactive=60m use_temp_path=off;
#    proxy_cache_valid 200 302 5m;
#    proxy_cache_key "$scheme$request_method$host$request_uri";

upstream todo {
    server 192.168.0.65:8080;
}

server {
    listen 80;

    location / {
       proxy_cache my_cache;
#	proxy_buffering on;
#       proxy_ignore_headers Expires;
#       proxy_ignore_headers X-Accel-Expires;
#        proxy_ignore_headers Cache-Control;
#       proxy_ignore_headers Set-Cookie;

#        proxy_hide_header X-Accel-Expires;
#        proxy_hide_header Expires;
#        proxy_hide_header Cache-Control;
#        proxy_hide_header Pragma;

#        add_header X-Proxy-Cache $upstream_cache_status;
	

        proxy_pass http://todo/session-login/login;
    }
}
