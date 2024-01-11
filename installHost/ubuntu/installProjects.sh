#rclone
RUN curl -fSL "https://downloads.rclone.org/v1.65.0/rclone-v1.65.0-linux-amd64.deb" -o rclone.deb \
	&& dpkg -i rclone.deb \
	&& rm rclone.deb
