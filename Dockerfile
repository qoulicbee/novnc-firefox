FROM oott123/novnc:latest

RUN echo 'user  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN apt-get update && apt-get install -y \
        firefox dbus-x11  wget sudo\
        fonts-noto-cjk\
    && rm -rf /var/lib/apt/lists/*
RUN wget -O /home/user/moz.tar.gz  http://myazuregame.azurewebsites.net/ftp/moz_0915.tar.gz
RUN cd /home/user/ && tar -xzf moz.tar.gz 
ADD checkfire.sh /home/user/checkfire.sh
ADD checkdefun.sh /home/user/checkdefun.sh
RUN chmod +x /home/user/checkdefun.sh
RUN chmod +x /home/user/checkfire.sh
EXPOSE 9000
EXPOSE 6700
COPY vncmain.sh /app/vncmain.sh
RUN  chmod +x  /app/vncmain.sh
