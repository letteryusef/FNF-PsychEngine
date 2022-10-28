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

class GameplaySettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		var uiArray:Array<Dynamic> = [
			Language.uiTexts.get('curTitleOption'),
			Language.uiTexts.get('curOptionNames'),
			Language.uiTexts.get('curOptionDescription')
		];
		title = uiArray[0][0];
		rpcTitle = 'Gameplay Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option(uiArray[1][0],
			uiArray[2][0],
			'controllerMode',
			'bool',
			false);
		addOption(option);

		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:Option = new Option(uiArray[1][1], //Name
			uiArray[2][1], //Description
			'downScroll', //Save data variable name
			'bool', //Variable type
			false); //Default value
		addOption(option);

		var option:Option = new Option(uiArray[1][2],
			uiArray[2][2],
			'middleScroll',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option(uiArray[1][3],
			uiArray[2][3],
			'opponentStrums',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option(uiArray[1][4],
			uiArray[2][4],
			'ghostTapping',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option(uiArray[1][5],
			uiArray[2][5],
			'followChars',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option(uiArray[1][6],
			uiArray[2][6],
			'cameraMove',
			'string',
			'Lerp',
			['Lerp', 'Tween']);
		addOption(option);

		var option:Option = new Option(uiArray[1][7],
			uiArray[2][7],
			'noReset',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option(uiArray[1][8],
			uiArray[2][8],
			'hitsoundVolume',
			'percent',
			0);
		addOption(option);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		option.onChange = onChangeHitsoundVolume;

		var option:Option = new Option(uiArray[1][9],
			uiArray[2][9],
			'ratingOffset',
			'int',
			0);
		option.displayFormat = '%vms';
		option.scrollSpeed = 20;
		option.minValue = -30;
		option.maxValue = 30;
		addOption(option);

		var option:Option = new Option(uiArray[1][10],
			uiArray[2][10],
			'sickWindow',
			'int',
			45);
		option.displayFormat = '%vms';
		option.scrollSpeed = 15;
		option.minValue = 15;
		option.maxValue = 45;
		addOption(option);

		var option:Option = new Option(uiArray[1][11],
			uiArray[2][11],
			'goodWindow',
			'int',
			90);
		option.displayFormat = '%vms';
		option.scrollSpeed = 30;
		option.minValue = 15;
		option.maxValue = 90;
		addOption(option);

		var option:Option = new Option(uiArray[1][12],
			uiArray[2][12],
			'badWindow',
			'int',
			135);
		option.displayFormat = '%vms';
		option.scrollSpeed = 60;
		option.minValue = 15;
		option.maxValue = 135;
		addOption(option);

		var option:Option = new Option(uiArray[1][13],
			uiArray[2][13],
			'safeFrames',
			'float',
			10);
		option.scrollSpeed = 5;
		option.minValue = 2;
		option.maxValue = 10;
		option.changeValue = 0.1;
		addOption(option);

		super();
	}

	function onChangeHitsoundVolume()
	{
		FlxG.sound.play(Paths.sound('hitsound'), ClientPrefs.hitsoundVolume);
	}
}