FROM jrottenberg/ffmpeg


COPY entrypoint.sh /usr/local/bin

WORKDIR /video

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD []
