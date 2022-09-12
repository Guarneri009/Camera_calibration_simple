FROM ubuntu:20.04
RUN apt-get update -y && apt-get install -y x11-apps
# DISPLAYの設定を忘れずに
ENV DISPLAY=host.docker.internal:0
ENV DISPLAY="$DISPLAY" -v /tmp/.X11-unix:/tmp/.X11-unix ubuntu:20.04