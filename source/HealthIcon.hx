package;

import flixel.ui.FlxBar;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import openfl.utils.Assets as OpenFlAssets;

#if sys
import sys.io.File;
import sys.FileSystem;
#end

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isAnimated:Bool = false;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';
	private var xmlContent:String;
	private var leWidth:Float;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		changeIcon(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}

	private var iconOffsets:Array<Float> = [0, 0];
	public function changeIcon(char:String) {
		if (this.char != char)
		{
			var name:String = 'icons/' + char;

		 	if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
		
			#if sys
			if (FileSystem.exists('images/' + name + '.xml'))
			{
				isAnimated = true;
				xmlContent = File.getContent('images/' + name + '.xml');
			}
			#end

			if (isAnimated){
				var leAnimation:Dynamic = Paths.image(name);
				loadGraphic(leAnimation);

				animation.addByPrefix('idle', char + 'IDLE', 24, true, isPlayer);
				animation.addByPrefix('losing', xmlContent.contains(char + 'LOSING') ? char + 'LOSING' : char + 'IDLE', 24, true, isPlayer);
				animation.addByPrefix('winning', xmlContent.contains(char + 'WINNING') ? char + 'WINNING' : char + 'IDLE', 24, true, isPlayer);

			} else {
				var iconGraphic:FlxGraphic = Paths.image(name);

				switch (iconGraphic.width)
		   	    {
					case 450: leWidth = 3;
					case 300: leWidth = 2;
					case 150: leWidth = 1;
					default: leWidth = 2;
				}

				loadGraphic(iconGraphic); //Load stupidly first for getting the file size
				if (leWidth != 1)
				{
					loadGraphic(iconGraphic, true, Math.floor(width / leWidth), Math.floor(height)); //Then load it fr
			    	iconOffsets[0] = (width - 150) / leWidth;
			    	iconOffsets[1] = (width - 150) / leWidth;
				}
				animation.add('idle', [0], 0, false, isPlayer);
				animation.add('losing', leWidth >= 2 ? [1] : [0], 0, false, isPlayer);
				animation.add('winning', leWidth == 3 ? [2] : [0], 0, false, isPlayer);
			}
			updateHitbox();
			animation.play('idle');
			this.char = char;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
		}
	}

	override function updateHitbox()
	{
		super.updateHitbox();
		offset.x = iconOffsets[0];
		offset.y = iconOffsets[1];
	}

	public dynamic function healthIconUpdate(healthBar:FlxBar)
	{
		if (isPlayer)
		{
			if (healthBar.percent < 20)
				animation.play('losing');
			else if (healthBar.percent > 80)
				animation.play('winning');
			else
				animation.play('idle');
		} else {
			if (healthBar.percent > 80)
				animation.play('losing');
			else if (healthBar.percent < 20) 
				animation.play('winning');
			else
				animation.play('idle');
		}
	}

	public function getCharacter():String {
		return char;
	}
}
