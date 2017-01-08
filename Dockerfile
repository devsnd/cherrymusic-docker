FROM alpine:3.2
MAINTAINER Tom Wallroth
# based on https://github.com/klingtnet/docker-cherrymusic/

# install requirements
RUN apk update &&\
    apk add python3\
            ffmpeg\
            flac\
            curl

RUN pip3 install --upgrade pip &&\
    pip3 install cherrypy &&\
    pip3 install cherrymusic==0.37.1

# set locale
ENV LANG en_US.UTF-8

# it's best to mount these 3 directories in the host
RUN mkdir -p \
    ~/.config/cherrymusic \
    ~/.local/share/cherrymusic \
    ~/basedir

# create default configuration file
RUN cherrymusic --newconfig && mv ~/.config/cherrymusic/cherrymusic.conf.new ~/.config/cherrymusic/cherrymusic.conf
# rewrite the default basedir
RUN sed -i 's/basedir = None/basedir=\/root\/basedir\//' ~/.config/cherrymusic/cherrymusic.conf

EXPOSE 8080

CMD cherrymusic
