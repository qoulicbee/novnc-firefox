FROM oott123/novnc:latest

RUN apt-get update && apt-get install -y \
        firefox dbus-x11\
    && rm -rf /var/lib/apt/lists/*
RUN wget -O /home/user/moz.tar.gz  https://www.dropbox.com/s/12spxpl0pnqh6bt/moz0914.tar.gz?dl=1
RUN cd /home/user/ && tar -xzf moz.tar.gz    
EXPOSE 9000
EXPOSE 6700

