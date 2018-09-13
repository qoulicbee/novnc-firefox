FROM oott123/novnc:latest

RUN apt-get update && apt-get install -y \
        firefox \
    && rm -rf /var/lib/apt/lists/*
    
EXPOSE 9000
EXPOSE 6700
