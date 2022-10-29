package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.group.FlxGroup;

class LanguageState extends MusicBeatState
{
    public static var leftState:Bool = false;
    public var optionsGroup:FlxTypedGroup<FlxText> = new FlxTypedGroup();
    public var canSelect:Bool = true;
    public var curSelected:Int = 0;

    override function create() {
        super.create();

        CoolUtil.setWindowTitle('Title');

        var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

        for (i in 0...Language.availableLanguages.length)
        {
            leftState = true;
            var text:FlxText = new FlxText(0, 300 + (i * 56), 0, Language.availableLanguages[i], 42);
            text.setFormat(Paths.font("vcr.ttf"), 42, FlxColor.WHITE, CENTER);
            text.screenCenter(X);
            text.ID = i;
            optionsGroup.add(text);
            add(text);
        }

        changeOptions();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        if (canSelect)
        {
            if (controls.UI_UP_P) changeOptions(-1);
            if (controls.UI_DOWN_P) changeOptions(1);
            if (controls.ACCEPT)
            {
                leftState = true;
                optionsGroup.forEach(function (text:FlxText) {
                    if (text.ID == curSelected)
                    {
                        selectOption(curSelected);
                        FlxFlicker.flicker(text, 1, 0.06, true, false, function(flick:FlxFlicker)
                        {
                            MusicBeatState.switchState(new WarnState());
                        });
                    } else {
                        FlxTween.tween(text, {alpha: 0.4}, 0.4, {ease: FlxEase.quintOut});
                    }
                });
                canSelect = false;
            }
        }
    }

    function selectOption(huh:Int = 0)
    {
        FlxG.sound.play(Paths.sound('cancelMenu'), 0.4);
        ClientPrefs.language = Language.availableLanguages[huh];
        ClientPrefs.saveSettings();
        Language.reloadTextTranslation();
        CoolUtil.setWindowTitle(Language.titleWindow[0]);
    }

    function changeOptions(change:Int = 0)
    {
        FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
        curSelected += change;
        if (curSelected >= Language.availableLanguages.length) curSelected = 0;
        if (curSelected < 0) curSelected = Language.availableLanguages.length - 1;
    
        optionsGroup.forEach(function (text:FlxText) {
            if (text.ID == curSelected)
            {
                text.alpha = 1;
            } else {
                text.alpha = 0.6;
            }
        });
    }
}