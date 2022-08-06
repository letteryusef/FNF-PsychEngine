package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	public var hasWinning:Bool = false;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';

	public function new(char:String = 'bf', isPlayer:Bool = false, hasWinning:Bool = false)
	{
		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		this.hasWinning = hasWinning;
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
		var name:String = 'icons/' + char;

		if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
		if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
		
		var file:Dynamic = Paths.image(name);

		loadGraphic(file); //Load stupidly first for getting the file size
		if (hasWinning)
		{
			loadGraphic(file, true, Math.floor(width / 3), Math.floor(height)); //Then load it fr
		    iconOffsets[0] = (width - 150) / 3;
		    iconOffsets[1] = (width - 150) / 3;
			animation.add(char, [0, 1, 2], 0, false, isPlayer);
		} else {
			loadGraphic(file, true, Math.floor(width / 2), Math.floor(height));
		    iconOffsets[0] = (width - 150) / 2;
		    iconOffsets[1] = (width - 150) / 2;
			animation.add(char, [0, 1], 0, false, isPlayer);
		}
		updateHitbox();
		animation.play(char);
		this.char = char;

		antialiasing = ClientPrefs.globalAntialiasing;
		if(char.endsWith('-pixel')) {
			antialiasing = false;
		}
	}

	override function updateHitbox()
	{
		super.updateHitbox();
		offset.x = iconOffsets[0];
		offset.y = iconOffsets[1];
	}

	public function getCharacter():String {
		return char;
	}
}
