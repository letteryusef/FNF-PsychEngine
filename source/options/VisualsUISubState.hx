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
import WindowsData;

using StringTools;

class VisualsUISubState extends BaseOptionsMenu
{
	public function new()
	{
		var uiArray:Array<Dynamic> = [
			Language.uiTexts.get('curTitleOption'),
			Language.uiTexts.get('curOptionNames'),
			Language.uiTexts.get('curOptionDescription')
		];
		title = uiArray[0][1];
		rpcTitle = 'Visuals & UI Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option(uiArray[1][14],
			uiArray[2][14],
			'language',
			'string',
			'English',
			['English', 'PT-BR']);
		addOption(option);
		option.onChange = onChangeLanguage;

		#if (windows && cpp)
		var option:Option = new Option(uiArray[1][15],
			uiArray[2][15],
			'darkTheme',
			'bool',
			true);
		addOption(option);
		option.onChange = onChangeTheme;
		#end

		var option:Option = new Option(uiArray[1][16],
			uiArray[2][16],
			'classicMode',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option(uiArray[1][17],
			uiArray[2][17],
			'subtitles',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option(uiArray[1][18],
			uiArray[2][18],
			'wavyHolds',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option(uiArray[1][19],
			uiArray[2][19],
			'noteSplashes',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option(uiArray[1][20],
			uiArray[2][20],
			'hideHud',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option(uiArray[1][21],
			uiArray[2][21],
			'comboType',
			'string',
			'OG Combo',
			['OG Combo', 'GoofyAAHText']);
		addOption(option);
		
		var option:Option = new Option(uiArray[1][22],
			uiArray[2][22],
			'timeBarType',
			'string',
			'Time Left',
			['Time Left', 'Time Elapsed', 'Song Name', 'Disabled']);
		addOption(option);

		var option:Option = new Option(uiArray[1][23],
			uiArray[2][23],
			'flashing',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option(uiArray[1][24],
			uiArray[2][24],
			'camZooms',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option(uiArray[1][25],
			uiArray[2][25],
			'scoreZoom',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option(uiArray[1][26],
			uiArray[2][26],
			'healthBarAlpha',
			'percent',
			1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);
		
		#if !mobile
		var option:Option = new Option(uiArray[1][27],
			uiArray[2][27],
			'showFPS',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option(uiArray[1][28],
			uiArray[2][28],
			'showMEM',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option(uiArray[1][29],
			uiArray[2][29],
			'showMEMPEAK',
			'bool',
			true);
		addOption(option);
		#end
		
		var option:Option = new Option(uiArray[1][30],
			uiArray[2][30],
			'pauseMusic',
			'string',
			'Tea Time',
			['None', 'Breakfast', 'Tea Time']);
		addOption(option);
		option.onChange = onChangePauseMusic;
		
		#if CHECK_FOR_UPDATES
		var option:Option = new Option(uiArray[1][31],
			uiArray[2][31],
			'checkForUpdates',
			'bool',
			true);
		addOption(option);
		#end

		var option:Option = new Option(uiArray[1][32],
			uiArray[2][32],
			'comboStacking',
			'bool',
			true);
		addOption(option);

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

	function onChangeLanguage()
	{
		Language.reloadTextTranslation();
		OptionsState.instance.resetState = true;
	}

	#if (windows && cpp)
	public static function onChangeTheme()
	{
		WindowsData.setWindowColorMode(ClientPrefs.darkTheme ? DARK : LIGHT);
	}
	#end

	override function destroy()
	{
		if(changedMusic) FlxG.sound.playMusic(Paths.music('klaskiMenu'));
		super.destroy();
	}
}
