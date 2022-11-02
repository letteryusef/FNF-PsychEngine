package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import openfl.Lib;
import openfl.utils.Assets;
import lime.utils.Assets as LimeAssets;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
#if sys
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end

using StringTools;

class CoolUtil
{
	public static var delayTimer:FlxTimer = null;
	public static var delayTitleTimer:FlxTimer = null;

	public static var defaultDifficulties:Array<String> = [
		'Easy',
		'Normal',
		'Hard'
	];
	public static var defaultDifficulty:String = 'Normal'; //The chart that has no suffix and starting difficulty on Freeplay/Story Mode

	public static var difficulties:Array<String> = [];

	inline public static function quantize(f:Float, snap:Float){
		// changed so this actually works lol
		var m:Float = Math.fround(f * snap);
		trace(snap);
		return (m / snap);
	}
	
	public static function getDifficultyFilePath(num:Null<Int> = null)
	{
		if(num == null) num = PlayState.storyDifficulty;

		var fileSuffix:String = difficulties[num];
		if(fileSuffix != defaultDifficulty)
		{
			fileSuffix = '-' + fileSuffix;
		}
		else
		{
			fileSuffix = '';
		}
		return Paths.formatToSongPath(fileSuffix);
	}

	public static function difficultyString():String
	{
		return difficulties[PlayState.storyDifficulty].toUpperCase();
	}

	inline public static function boundTo(value:Float, min:Float, max:Float):Float {
		return Math.max(min, Math.min(max, value));
	}

	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = [];
		#if sys
		if(FileSystem.exists(path)) daList = File.getContent(path).trim().split('\n');
		#else
		if(Assets.exists(path)) daList = Assets.getText(path).trim().split('\n');
		#end

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}
	public static function listFromString(string:String):Array<String>
	{
		var daList:Array<String> = [];
		daList = string.trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}
	public static function dominantColor(sprite:flixel.FlxSprite):Int{
		var countByColor:Map<Int, Int> = [];
		for(col in 0...sprite.frameWidth){
			for(row in 0...sprite.frameHeight){
			  var colorOfThisPixel:Int = sprite.pixels.getPixel32(col, row);
			  if(colorOfThisPixel != 0){
				  if(countByColor.exists(colorOfThisPixel)){
				    countByColor[colorOfThisPixel] =  countByColor[colorOfThisPixel] + 1;
				  }else if(countByColor[colorOfThisPixel] != 13520687 - (2*13520687)){
					 countByColor[colorOfThisPixel] = 1;
				  }
			  }
			}
		 }
		var maxCount = 0;
		var maxKey:Int = 0;//after the loop this will store the max color
		countByColor[flixel.util.FlxColor.BLACK] = 0;
			for(key in countByColor.keys()){
			if(countByColor[key] >= maxCount){
				maxCount = countByColor[key];
				maxKey = key;
			}
		}
		return maxKey;
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}

	//uhhhh does this even work at all? i'm starting to doubt
	public static function precacheSound(sound:String, ?library:String = null):Void {
		Paths.sound(sound, library);
	}

	public static function precacheMusic(sound:String, ?library:String = null):Void {
		Paths.music(sound, library);
	}

	public static function browserLoad(site:String) {
		#if linux
		Sys.command('/usr/bin/xdg-open', [site]);
		#else
		FlxG.openURL(site);
		#end
	}

	public static function setupMouse(graphic:String, visible:Bool = true)
	{
		var mouseGraphic:FlxSprite = new FlxSprite(0, 0, Paths.image(graphic));
		FlxG.mouse.load(mouseGraphic.pixels);
		FlxG.mouse.visible = visible;
	}
	
	public static function destroyMouse()
	{
		FlxG.mouse.visible = false;
		FlxG.mouse.unload();
	}

	/* 
	
	- a quick tutorial of how to make a animated string by LetterY

	public static function typeString(string:String, duration:Float) {
		var delayTimer:FlxTimer;
		var curLetter:Int = string.length;
		var shownString:String = '';

		delayTimer = new FlxTimer().start(duration, function(ass:FlxTimer)
		{
			shownString += string.charAt(string.length - curLetter);
			curLetter--;
			trace(shownString);
		}, string.length);
	}

	- have fun!!, but pls when you use it, at least credit me, i lost braincells for this

	*/

	// WARNING, THIS CODE BELOW WORKS BUT NOT PROPERLY!!
	public static function typeText(string:String, duration:Float, curText:FlxText, onCenter:Bool = true, clearBefore:Bool = true) {
		var curLetter:Int = string.length;
		var defaultHeight:Float = curText.height;

		curText.offset.y = 0;

		if (delayTimer != null)
		{
			delayTimer.cancel();
			if (clearBefore) curText.text = '';
		}

		delayTimer = new FlxTimer().start(duration, function(ass:FlxTimer)
		{
			curText.text += string.charAt(string.length - curLetter);
			curLetter--;
			if (onCenter && curText.height != defaultHeight)
			{
				curText.offset.y += 6;
				defaultHeight = curText.height;
			} else if (onCenter && curText.height == defaultHeight){
				curText.offset.y -= 0;
			}
		}, string.length);
	}

	public static function setWindowTitle(name:String = '')
	{
		if (delayTitleTimer != null) delayTitleTimer.cancel();
		var gameName = "Friday Night Funkin': Psych Engine (WaveNami)";
		
		if (name != '')
		{
			Lib.application.window.title = gameName + " - " + name;
		} else {
			Lib.application.window.title = gameName;
		}
	}

	public static function setWindowAnimatedTitle(string:String, duration:Float, beforeString:String = '', afterString:String = '', includesHyphen:Bool = true)
	{
		var gameName = "Friday Night Funkin': Psych Engine (WaveNami)";
		var curLetter:Int = string.length;
		var shownString:String = '';
		var hyphenSucks:String = includesHyphen ? " - " : "";

		if (delayTitleTimer != null) delayTitleTimer.cancel();

		delayTitleTimer = new FlxTimer().start(duration, function(ass:FlxTimer)
		{
			shownString += string.charAt(string.length - curLetter);
			curLetter--;
			Lib.application.window.title = gameName + hyphenSucks + beforeString + shownString + afterString;
		}, string.length);
	}

	public static function cancelDelayTitleTimer() // simple but worth it lol
	{
		if (delayTitleTimer != null) delayTitleTimer.cancel();
	}

	public static function pixelTween(target:Dynamic, dynamicValue:Dynamic, changeTimes:Float, interval:Float)
	{
		if (target != dynamicValue)
		{
			target += dynamicValue / changeTimes;
			new FlxTimer().start(interval, function(ass:FlxTimer)
			{
				target += dynamicValue / changeTimes;
				if (target < dynamicValue)
				{
					ass.reset(interval);
				} else {
					target = dynamicValue;
				}
			});
		} else {
			trace('mate, the thing is already on the wished value >:(');
			target += dynamicValue;
		}
	}

	/**
		Little equation used for Bhaskara Equation.
	**/
	public static inline function delta(a:Float, b:Float, c:Float):Float
	{
		return Math.pow(b, 2) - 4 * a * c;
	}

	/**
		Classic equation to resolve 2° Degree Math.
	**/
	public static inline function bhaskara(a:Float, b:Float, c:Float):Array<Float>
	{
		var xArray:Array<Float> = [];
		xArray.insert(xArray.length + 1, (-b + Math.sqrt(delta(a, b, c))) / 2 * a);
		xArray.insert(xArray.length + 1, (-b - Math.sqrt(delta(a, b, c))) / 2 * a);
		return xArray;
	}

	/**
		Classic equation to resolve Quadratic Function Math.
	**/
	public static inline function vertexQuad(a:Float, b:Float, c:Float):Array<Float>
	{
		var xArray:Array<Float> = [];
		xArray.insert(xArray.length + 1, -b / 2 * a);
		xArray.insert(xArray.length + 1, -delta(a, b, c) / 4 * a);
		return xArray;
	}
}
