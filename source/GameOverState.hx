package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxMath;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class GameOverState extends MusicBeatSubstate
{
	public var boyfriend:Boyfriend;
	var camFollow:FlxPoint;
	var camFollowPos:FlxObject;
	var updateCamera:Bool = false;
	var playingDeathSound:Bool = false;
	var gameOverSprite:FlxSprite;

	var stageSuffix:String = "";

	public static var characterName:String = 'gameover';
	public static var deathSoundName:String = 'gameoverSigh';
	public static var loopSoundName:String = 'rivers';
	public static var endSoundName:String = 'gameOverEnd';

	public static var instance:GameOverState;

	public static function resetVariables() {
		characterName = 'gameover';
		deathSoundName = 'gameoverSigh';
		loopSoundName = 'rivers';
		endSoundName = 'gameOverEnd';
	}

	override function create()
	{
		PlayState.instance.setOnLuas('inGameOver', true);

		Conductor.songPosition = 0;

		gameOverSprite = new FlxSprite(0, 0);
		gameOverSprite.frames = Paths.getSparrowAtlas('GameOver');
		gameOverSprite.antialiasing = ClientPrefs.globalAntialiasing;
		gameOverSprite.animation.addByPrefix('loop', 'GameOverLoop', 24);
		gameOverSprite.animation.addByPrefix('end', 'GameOverEnd', 24, false);
		gameOverSprite.screenCenter();
		add(gameOverSprite);
		gameOverSprite.alpha = 0;

		instance = this;
		// PlayState.instance.callOnLuas('onGameOverStart', []);

		super.create();

		FlxG.sound.play(Paths.sound(deathSoundName));
		Conductor.changeBPM(75);

		new FlxTimer().start(1.5, function(tmr:FlxTimer){
			coolStartDeath();
		});
	}

	// public function new(x:Float, y:Float, camX:Float, camY:Float)
	// {
	// 	super();
// 
	// 	PlayState.instance.setOnLuas('inGameOver', true);
// 
	// 	Conductor.songPosition = 0;
// 
	// 	gameOverSprite = new FlxSprite(0, 0);
	// 	gameOverSprite.frames = Paths.getSparrowAtlas('GameOver');
	// 	gameOverSprite.antialiasing = ClientPrefs.globalAntialiasing;
	// 	gameOverSprite.animation.addByPrefix('loop', 'GameOverLoop', 24);
	// 	gameOverSprite.animation.addByPrefix('end', 'GameOverEnd', 24, false);
	// 	gameOverSprite.screenCenter();
	// 	add(gameOverSprite);
	// 	gameOverSprite.alpha = 0;
// 
	// 	FlxG.sound.play(Paths.sound(deathSoundName));
	// 	Conductor.changeBPM(75);
// 
	// 	new FlxTimer().start(1.5, function(tmr:FlxTimer){
	// 		coolStartDeath();
	// 	});
	// }

	var isFollowingAlready:Bool = false;
	override function update(elapsed:Float)
	{
		super.update(elapsed);

		PlayState.instance.callOnLuas('onUpdate', [elapsed]);

		if (controls.ACCEPT)
		{
			endBullshit();
		}

		if (controls.BACK)
		{
			FlxG.sound.music.stop();
			PlayState.deathCounter = 0;
			PlayState.seenCutscene = false;
			PlayState.chartingMode = false;

			WeekData.loadTheFirstEnabledMod();
			if (PlayState.isStoryMode)
				MusicBeatState.switchState(new MainMenuState());
			else
				MusicBeatState.switchState(new FreeplayState());

			FlxG.sound.playMusic(Paths.music('lonelyNights'));
			PlayState.instance.callOnLuas('onGameOverConfirm', [false]);
		}

		if (FlxG.sound.music.playing)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}
		PlayState.instance.callOnLuas('onUpdatePost', [elapsed]);
	}

	override function beatHit()
	{
		super.beatHit();

		gameOverSprite.animation.play('loop');

		//FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function coolStartDeath(?volume:Float = 1):Void
	{
		// var dumb = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		// add(dumb);

		FlxTween.tween(gameOverSprite, {alpha: 1}, 2);
		FlxG.sound.playMusic(Paths.music(loopSoundName), 0.8);
		FlxG.sound.music.fadeIn(2, 0, 0.8);
	}

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			gameOverSprite.animation.play('end');
			//boyfriend.playAnim('deathConfirm', true);
			FlxG.sound.music.stop();
			FlxG.sound.play(Paths.music(endSoundName));
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					MusicBeatState.resetState();
				});
			});
			PlayState.instance.callOnLuas('onGameOverConfirm', [true]);
		}
	}
}
