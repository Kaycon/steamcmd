FROM ubuntu:16.04

MAINTAINER Kaycon "kaycon1@web.de"

#Add steam user
RUN useradd -m steam

WORKDIR /home/steam

#Download required packages
RUN apt-get update
RUN apt-get install lib32gcc1 wget -y
RUN apt-get clean

#Download steamcmd
RUN wget http://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xf steamcmd_linux.tar.gz

RUN chown -R steam /home/steam && chmod -R 755 /home/steam

RUN ./steamcmd.sh +login anonymous +quit
