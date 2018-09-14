FROM oott123/novnc:latest

RUN apt-get update && apt-get install -y \
        firefox dbus-x11\
        apt-get install wget libgtk-3-0\
        libgtk-3-common libcurl3 libnspr4 libnss3\
        libpango1.0 libcanberra-gtk3-module packagekit-gtk3-module\
        libgl1-mesa-dri libvdpau-va-gl1 va-driver-all fonts-dejavu pulseaudio\
        fonts-noto-cjk icedtea-netx
    && rm -rf /var/lib/apt/lists/*
RUN wget -O /home/user/moz.tar.gz  https://www.dropbox.com/s/12spxpl0pnqh6bt/moz0914.tar.gz?dl=1
RUN cd /home/user/ && tar -xzf moz.tar.gz    
EXPOSE 9000
EXPOSE 6700

