FROM python:3.8.2-buster
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone  
RUN apt-get update -qq && apt-get install -qy \ 
    ca-certificates \
    bzip2 \
    curl \
    libfontconfig \
    vim \
    ssh \
    openssh-client

COPY ./src/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN useradd -ms /bin/bash  app
WORKDIR /src

COPY ./src .
RUN chmod +x my_shell.sh \
    && printf 28 > my_count.txt \
    && chown app:app my_count.txt
USER app

# ENTRYPOINT [ "./my_shell.sh" ]