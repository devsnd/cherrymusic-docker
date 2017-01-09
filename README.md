# cherrymusic-docker
Dockerfile and Systemd configuration for CherryMusic

# installation (see installation.sh):

 1. Download repo
 2. Copy `cherrymusic.service` into `/etc/systemd/system/`
 3. Copy `cherrymusic.service.conf` into `/etc/`
 4. Modify `/etc/cherrymusic.service.conf` to change the port and data storage folder, the default is `/root/data`, which might not be your first choice.
 5. enable systemd service `systemctl enable cherrymusic`
 6. start systemd service `systemctl start cherrymusic`

# Usage:

To add music to your library symlink the music into

`/root/data/cherrmusic/basedir`

e.g.:

`ln -s /mnt/my/music/hdd /root/data/cherrmusic/basedir/music`

Configuration and cached albumart are in `/root/data/cherrmusic/.config` and `/root/data/cherrmusic/.local/share` respectively

# insane installtion:

    wget -q -O - https://raw.githubusercontent.com/devsnd/cherrymusic-docker/master/cherrymusic.service > /lib/systemd/system/cherrymusic.service && wget -q -O - https://raw.githubusercontent.com/devsnd/cherrymusic-docker/master/cherrymusic.service.conf > /etc/cherrymusic.service.conf && systemctl enable cherrymusic && systemctl start cherrymusic
