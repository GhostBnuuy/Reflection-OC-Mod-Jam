package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var bg:FlxSprite;
	var overlaybs:FlxSprite;
	var bnuy:FlxSprite;
	var swe:FlxSprite;
	var brewy:FlxSprite;

	override function create()
	{
		FlxG.mouse.visible = true;

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('credits/bg'));
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.updateHitbox();
		add(bg);
		bg.screenCenter();

		bnuy = new FlxSprite(460, 160).loadGraphic(Paths.image('credits/bunny'));
		bnuy.antialiasing = ClientPrefs.globalAntialiasing;
		//bnuy.screenCenter(X);
		add(bnuy);

		swe = new FlxSprite(115, 90).loadGraphic(Paths.image('credits/swe'));
		swe.antialiasing = ClientPrefs.globalAntialiasing;
		add(swe);

		brewy = new FlxSprite(850, 80).loadGraphic(Paths.image('credits/brewy'));
		brewy.antialiasing = ClientPrefs.globalAntialiasing;
		add(brewy);

		overlaybs = new FlxSprite().loadGraphic(Paths.image('credits/overlay'));
		overlaybs.screenCenter();
		add(overlaybs);
	
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
			{
				FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			}

		if (controls.BACK)
		{
			FlxG.mouse.visible = false;
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if (FlxG.mouse.overlaps(bnuy) && FlxG.mouse.justPressed)
			CoolUtil.browserLoad("https://twitter.com/GhostBnuuy");
		if (FlxG.mouse.overlaps(swe) && FlxG.mouse.justPressed)
			CoolUtil.browserLoad("https://www.youtube.com/channel/UCZ1s1XKy6ufBLjsHfTBejzw");
		if (FlxG.mouse.overlaps(brewy) && FlxG.mouse.justPressed)
			CoolUtil.browserLoad("https://twitter.com/BreWyy_");
	}
}