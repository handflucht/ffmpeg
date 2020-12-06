# General
Installs the current ffmpeg-version on a debian slim.

# How to build
```
docker build git://github.com/handflucht/ffmpeg.git -t handflucht/ffmpeg
```

# Usage

Default `ENYTRPOINT` is `ffmpeg`, default `CMD` is `--help`.



## Example scaling a video

Scaling a video c:\download\video.mp4 to 2700x1350 pixel (target: c:\download\video_scaled.mp4)
```
docker run --rm -v /c/download:/video handflucht/ffmpeg -i /video/video.mp4 -vf scale=2700x1350 -speed 8 /video/video_scaled.mp4
```