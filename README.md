# General
Installs the current ffmpeg-version on a debian slim.

**fmpeg** is a 
> A complete, cross-platform solution to record, convert and stream audio and video.

Source: https://ffmpeg.org/

# How to build
Build your own:
```
docker build git://github.com/handflucht/ffmpeg.git -t handflucht/ffmpeg
```

Use existing one:
```
docker pull handflucht/ffmpeg
```

# Usage
For all the following examples we assume, docker was executed on a Windows-machine with a file called `video_original.mp4` placed at `c:\download\`. The output- if any should be written into the same directory.

<br/>
In the upcoming examples, only the command call is shown. To run the command

```
ffmpeg -i i /video/video_original.mp4 -vf scale=2700x1350 -speed 8 /video/video_scaled.mp4
```
you have to execute:
```
docker run --rm -v /c/download:/video handflucht/ffmpeg ffmpeg -i /video/video_original.mp4 -vf scale=2700x1350 -speed 8 /video/video_scaled.mp4
```

## General
Show encodes and decoders
```
ffmpeg -encoders
ffmpeg -decoders
```

## Example scaling a video

Scaling a video to `1280x1024` pixel 
```
ffmpeg -i /video/video_original.mp4 -vf scale=2700x1350 -speed 8 /video/video_scaled.mp4
```

## Extract audio from video

Warning: the audio might have a different length from the video!

Audio simply copied (fast):
```
ffmpeg -i /video/video_original.mp4 -vn -acodec copy output-audio.wav
```

Audio with identical length to the video (slow):
```
ffmpeg -i /video/video_original.mp4 -map 0:a audio.m4a -map 0:v onlyvideo.avi
```

Audio in oga-format (quiet fast):
```
ffmpeg -i /video/video_original.mp4 -c:a libvorbis audio.oga
```

## Get information regarding audio/video on a file
```
ffmpeg -i /video/video_original.mp4 
```


```
fprobe video_original.mp4
```


```
ffprobe video_original.mp4 -show_streams
```

```
ffprobe -hide_banner -stats -i video_original.mp4
```

Get name of audio-codec only:
```
ffprobe -v error -select_streams a:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 video_original.mp4
```

Get name of video-codec only:
```
ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nokey=1:noprint_wrappers=1 video_original.mp4
```

# Epilogue
* Download videos from plattforms: https://de.savefrom.net/
