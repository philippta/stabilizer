# Video stabilization in a container

This container uses ffmpeg to stabilize a video.

## Usage:

```
docker run -ti --rm -v $PWD:/video philippta/stabilizer unstable-video.mp4
```
