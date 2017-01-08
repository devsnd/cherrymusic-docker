wget https://raw.githubusercontent.com/devsnd/cherrymusic-docker/master/cherrymusic.service -q -O - > /lib/systemd/system/cherrymusic.service
wget https://raw.githubusercontent.com/devsnd/cherrymusic-docker/master/cherrymusic.service.conf -q -O - > /etc/cherrymusic.service.conf
systemctl enable cherrymusic
