FROM nginx
COPY default.conf /etc/nginx/conf.d
RUN  mkdir -p /data/nginx/cache
