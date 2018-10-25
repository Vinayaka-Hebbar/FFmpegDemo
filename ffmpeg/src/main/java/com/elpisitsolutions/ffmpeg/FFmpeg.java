package com.elpisitsolutions.ffmpeg;

public class FFmpeg {
    static {
        try {
            System.loadLibrary("avutil");
            System.loadLibrary("swresample");
            System.loadLibrary("avcodec");
            System.loadLibrary("avformat");
            System.loadLibrary("swscale");
            System.loadLibrary("avfilter");
            System.loadLibrary("avdevice");
            System.loadLibrary("videokit");
        } catch (UnsatisfiedLinkError e) {
            e.printStackTrace();
        }
    }

    private native int run(int loglevel, String[] args);
}
