FROM oott123/novnc:latest

RUN apt-get update && apt-get install -y \
        firefox dbus-x11 cron\
        wget libgtk-3-0\
        libgtk-3-common libcurl3 libnspr4 libnss3\
        libpango1.0 libcanberra-gtk3-module packagekit-gtk3-module\
        libgl1-mesa-dri libvdpau-va-gl1 va-driver-all fonts-dejavu pulseaudio\
        fonts-noto-cjk icedtea-netx\
    && rm -rf /var/lib/apt/lists/*
RUN wget -O /home/user/moz.tar.gz  https://www.dropbox.com/s/12spxpl0pnqh6bt/moz0914.tar.gz?dl=1
RUN cd /home/user/ && tar -xzf moz.tar.gz 
ADD checkfire.sh /home/user/checkfire.sh
EXPOSE 9000
EXPOSE 6700
COPY crontab /etc/cron.d/my-cron
RUN chmod 0644 /etc/cron.d/my-cron
RUN touch /var/log/cron.log
RUN echo 'user ALL=NOPASSWD: /usr/sbin/cron' >>/etc/sudoers
RUN touch /var/log/cron.log
COPY vncmain.sh /app/vncmain.sh


