package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var bg:FlxSprite;
	var overlaybs:FlxSprite;
	var bnuy:FlxSprite;
	var swe:FlxSprite;
	var brewy:FlxSprite;
	var beepy:FlxSprite;

	override function create()
	{
		FlxG.mouse.visible = true;

		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

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

		bnuy = new FlxSprite(580, 160).loadGraphic(Paths.image('credits/bunny'));
		bnuy.antialiasing = ClientPrefs.globalAntialiasing;

		swe = new FlxSprite(20, 90).loadGraphic(Paths.image('credits/swe'));
		swe.antialiasing = ClientPrefs.globalAntialiasing;

		brewy = new FlxSprite(900, 80).loadGraphic(Paths.image('credits/brewy'));
		brewy.antialiasing = ClientPrefs.globalAntialiasing;
		
		beepy = new FlxSprite(270, 100).loadGraphic(Paths.image('credits/missBeepy'));
		beepy.antialiasing = ClientPrefs.globalAntialiasing;

		overlaybs = new FlxSprite().loadGraphic(Paths.image('bars'));
		overlaybs.screenCenter();

		add(beepy);
		add(swe);
		add(brewy);
		add(bnuy);
		add(overlaybs);

		var credits:FlxText = new FlxText(0, 0, 0, 'Credits', 200);
		credits.setFormat(Paths.font('riffic.ttf'), 50);
		credits.antialiasing = ClientPrefs.globalAntialiasing;
		add(credits);
		credits.screenCenter(X);

		var bottomTxt:FlxText = new FlxText(0, FlxG.height - 32, 0, "Shadow Mario - Psych Engine / PincerProd - Host of FNF: OC Mod Jam 2023", 32);
		bottomTxt.setFormat(Paths.font('coves.otf'), 28);
		bottomTxt.bold = true;
		bottomTxt.antialiasing = ClientPrefs.globalAntialiasing;
		add(bottomTxt);
		bottomTxt.screenCenter(X);
	
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

		if (FlxG.mouse.overlaps(beepy) && FlxG.mouse.justPressed)
			CoolUtil.browserLoad("https://youtube.com/@MissBeepy");
	}
}