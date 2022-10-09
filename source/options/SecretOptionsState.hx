package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class SecretOptionsState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Secret Stuff';
		rpcTitle = 'Sssshhh, it\'s a secret!!'; //for Discord Rich Presence

		var option:Option = new Option('Mosaic Mode',
			"You want your game to be more pixelated?, then now uou have it!",
			'mosaicMode',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Fight Mode',
			"f-fight??",
			'fightMode',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Mosaic Strength',
			'How pixelated you want your screen to be. (ONLY WORKS WITH MOSAIC MODE)',
			'mosaicStrength',
			'float',
			3.0);
		addOption(option);
		option.scrollSpeed = 1.4;
		option.minValue = 1.0;
		option.maxValue = 20.0;
		option.changeValue = 0.1;

		super();
	}

	var changedMusic:Bool = false;
	function onChangePauseMusic()
	{
		if(ClientPrefs.pauseMusic == 'None')
			FlxG.sound.music.volume = 0;
		else
			FlxG.sound.playMusic(Paths.music(Paths.formatToSongPath(ClientPrefs.pauseMusic)));

		changedMusic = true;
	}

	override function destroy()
	{
		if(changedMusic) FlxG.sound.playMusic(Paths.music('klaskiMenu'));
		super.destroy();
	}
}