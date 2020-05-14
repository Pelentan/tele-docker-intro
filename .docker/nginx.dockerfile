FROM nginx:1.17.3 as base

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone  

RUN apt-get update -qq && apt-get install -qy \ 
    ca-certificates \
    bzip2 \
    curl \
    libfontconfig \
    vim \
    ssh \
    openssh-client \
    nginx-extras

# COPY ./web/site-confs /etc/nginx/conf.d
# COPY ./web/errorpages/* /var/www/html/
# COPY ./web/sites /usr/share/nginx/html
