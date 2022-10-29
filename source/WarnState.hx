package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class WarnState extends MusicBeatState
{
	var warnText:FlxText;
	var canSelect:Bool = true;

	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(40, 40, 1180, Language.uiTexts.get('warn'), 30);
		warnText.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, CENTER);
		warnText.setBorderStyle(OUTLINE, FlxColor.BLACK, 1.5);
		warnText.antialiasing = true;
		add(warnText);

		warnText.x = (Math.floor((FlxG.width / 2) - (warnText.width / 2)));
		warnText.y = Math.floor((FlxG.height / 2) - (warnText.height / 2));
	}

	override function update(elapsed:Float)
	{
		if(canSelect) {
			var back:Bool = controls.BACK;
			if (controls.ACCEPT || back) {
				canSelect = false;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				if(!back) {
					ClientPrefs.flashing = false;
					ClientPrefs.saveSettings();
					FlxG.sound.play(Paths.sound('confirmMenu'));
					FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
						new FlxTimer().start(0.5, function (tmr:FlxTimer) {
							MusicBeatState.switchState(new TitleState());
						});
					});
				} else {
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(warnText, {alpha: 0}, 1, {
						onComplete: function (twn:FlxTween) {
							MusicBeatState.switchState(new TitleState());
						}
					});
				}
			}
		}
		super.update(elapsed);
	}
}
