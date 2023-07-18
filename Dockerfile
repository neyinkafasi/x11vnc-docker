FROM ubuntu:xenial
LABEL maintainer "neyinkafasi"
EXPOSE 5900 6099
ENV \
  DEBIAN_FRONTEND="nonintractive" \
  X11VNC_PASSWORD="password"
RUN apt-get update -y
RUN apt-get install -y xvfb x11vnc fluxbox wget
RUN wget --no-ssl-certificate https://updates.peer2profit.app/peer2profit_0.48_amd64.deb
RUN dpkg -i peer2profit_0.48_amd64.deb; apt --fix-broken -y install
RUN rm -rf peer2profit_0.48_amd64.deb
ADD ./entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT /opt/entrypoint.sh
