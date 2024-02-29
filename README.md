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
proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=my_cache:10m max_size=10g inactive=60m;

proxy_cache_path: 캐시 파일을 저장할 디렉토리와 관련된 설정을 지정하는 지시어입니다.
/var/cache/nginx: 캐시 파일이 저장될 디렉토리 경로를 나타냅니다.
levels=1:2: 캐시 디렉토리의 하위 디렉토리 구조를 지정합니다. 이 경우, /var/cache/nginx/ 다음에 최대 2개의 하위 디렉토리가 생성됩니다.
keys_zone=my_cache:10m: 캐시 키를 저장할 메모리 영역의 이름과 크기를 지정합니다. 여기서는 my_cache라는 이름의 메모리 영역을 10메가바이트 크기로 설정합니다.
max_size=10g: 캐시 디렉토리의 최대 크기를 지정합니다. 여기서는 10기가바이트로 설정되어 있습니다.
inactive=60m: 캐시 파일이 얼마 동안 활성화되지 않으면 자동으로 삭제되도록 설정합니다. 여기서는 60분으로 설정되어 있습니다.
location / { ... }

location: URI에 따라 다른 설정을 지정할 수 있도록 하는 블록입니다. 여기서는 "/"에 해당하는 URI에 대한 설정을 정의합니다.
proxy_pass http://backend_server;: 해당 위치의 요청을 백엔드 서버로 프록시(pass)하도록 지정합니다.
proxy_set_header: 프록시에 전달되는 헤더를 설정합니다.
proxy_cache my_cache;: 앞서 정의한 my_cache 캐시 영역을 사용하도록 지정합니다.
proxy_cache_valid: 어떤 상태 코드의 응답을 캐시로 저장할지와 해당 캐시의 유효 기간을 설정합니다.
proxy_cache_use_stale: 캐시 서버에 오류가 있을 때 어떻게 대응할지 설정합니다.
add_header X-Cached $upstream_cache_status;: 응답 헤더에 현재 요청이 캐시에서 제공되었는지 확인하는 헤더를 추가합니다.
listen 80; server_name example.com;

listen: 서버가 수신하는 포트를 지정합니다. 여기서는 80번 포트를 사용합니다.
server_name: 서버에 대한 도메인 이름을 설정합니다.
sudo nginx -t

nginx -t: Nginx 설정 파일의 구문 오류를 확인하는 명령입니다.
sudo systemctl restart nginx

systemctl restart nginx: Nginx 서버를 재시작하는 명령입니다. 새로운 설정을 적용하기 위해 사용됩니다.
```


