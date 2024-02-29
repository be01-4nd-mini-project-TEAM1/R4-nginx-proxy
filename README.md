# R4-nginx-proxy
![image](https://github.com/be01-4nd-mini-project-TEAM1/R4-nginx-proxy/assets/148875683/d47d6b5e-23dd-4b91-8432-210d7f2d1896)


# sample nginx content caching

![image](https://github.com/be01-4nd-mini-project-TEAM1/R4-nginx-proxy/assets/125641153/6d56f3ed-ff5b-4ec5-aa3a-0bba8770c159)

```
http {
    # ...
    proxy_cache_path /data/nginx/cache keys_zone=mycache:10m loader_threshold=300
                     loader_files=200 max_size=200m;

    server {
        listen 8080;
        proxy_cache mycache;

        location / {
            proxy_pass http://backend1;
        }

        location /some/path {
            proxy_pass http://backend2;
            proxy_cache_valid any 1m;
            proxy_cache_min_uses 3;
            proxy_cache_bypass $cookie_nocache $arg_nocache$arg_comment;
        }
    }
}
```
