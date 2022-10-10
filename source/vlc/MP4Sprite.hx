package vlc;

import flixel.FlxSprite;

/**
 * This class will play the video in the form of a FlxSprite, which you can control.
 */
class MP4Sprite extends FlxSprite
{
    public var readyCallback:Void->Void;
    public var finishCallback:Void->Void;

    var video:MP4Handler;

    public function new(x:Float = 0, y:Float = 0, ?width:Float, ?height:Float, ?autoScale:Bool, ?cantSkip:Bool, repeat:Bool = false)
    {
        if (width == null) width = 320;
        if (height == null) height = 240;
        if (autoScale == null) autoScale = true;
        if (cantSkip == null) cantSkip = false;

        super(x, y);

        video = new MP4Handler(width, height, autoScale, cantSkip);
        video.alpha = 0;

        video.readyCallback = function()
        {
            loadGraphic(video.bitmapData);
            if (readyCallback != null)
                readyCallback();
        }

        video.finishCallback = function()
        {
            if (finishCallback != null)
                finishCallback();
        };
    }

    /**
    * Native video support for Flixel & OpenFL
    * @param path Example: `your/video/here.mp4`
    * @param repeat Repeat the video.
    * @param pauseMusic Pause music until done video.
    */
    public function playVideo(path:String, repeat:Bool = false, pauseMusic:Bool = false)
    {
        video.playVideo(path, repeat, pauseMusic);
    }

    public function pause()
    {
        video.pause();
    }

    public function resume()
    {
        video.resume();
    }
}