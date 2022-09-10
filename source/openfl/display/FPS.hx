package openfl.display;

import haxe.Timer;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFormat;
import flixel.math.FlxMath;
#if gl_stats
import openfl.display._internal.stats.Context3DStats;
import openfl.display._internal.stats.DrawCallContext;
#end
#if flash
import openfl.Lib;
#end

#if openfl
import openfl.system.System;
#end

/**
	The FPS class provides an easy-to-use monitor to display
	the current frame rate of an OpenFL project
**/
#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
class FPS extends TextField
{
	/**
		The current frame rate, expressed using frames-per-second
	**/
	public var currentFPS(default, null):Int;
	var peak:UInt = 0;

	@:noCompletion private var cacheCount:Int;
	@:noCompletion private var currentTime:Float;
	@:noCompletion private var times:Array<Float>;

	public function new(x:Float = 10, y:Float = 10, string:String = "_sans", color:Int = 0x000000)
	{
		super();

		this.x = x;
		this.y = y;

		currentFPS = 0;
		selectable = false;
		mouseEnabled = false;
		defaultTextFormat = new TextFormat(string, 12, color);
		autoSize = LEFT;
		multiline = true;
		text = "FPS: N/A";

		cacheCount = 0;
		currentTime = 0;
		times = [];

		#if flash
		addEventListener(Event.ENTER_FRAME, function(e)
		{
			var time = Lib.getTimer();
			__enterFrame(time - currentTime);
		});
		#end
	}

	// Event Handlers
	@:noCompletion
	private #if !flash override #end function __enterFrame(deltaTime:Float):Void
	{
		currentTime += deltaTime;
		times.push(currentTime);
	
		while (times[0] < currentTime - 1000) times.shift();
	
		var currentCount = times.length;
		var mem = System.totalMemory;

		currentFPS = Math.round((currentCount + cacheCount));
		
		if (mem > peak) peak = mem;
		if (currentFPS > ClientPrefs.framerate) currentFPS = ClientPrefs.framerate;

		if (currentCount != cacheCount /*&& visible*/)
		{
			text = "";
	
			if (ClientPrefs.showFPS) text += "FPS: " + currentFPS + "\n";
		
			if (ClientPrefs.showMEM) text += "MEM: " + getSizeLabel(System.totalMemory) + "\n";
		
			if (ClientPrefs.showMEMPEAK) text += "MEM peak: " + getSizeLabel(peak) + "\n";
		}
	}
	
	final dataTexts = ["B", "KB", "MB", "GB", "TB", "PB"];
	
	function getSizeLabel(num:UInt):String
	{
		var size:Float = num;
		var data = 0;
		while (size > 1000 && data < dataTexts.length - 1)
		{
			data++;
			size = size / 1000;
		}
	
		size = Math.round(size * 100) / 100;
	
		if (data <= 2) size = Math.round(size);
	
		return size + " " + dataTexts[data];
	}
}
