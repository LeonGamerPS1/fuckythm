package;

import flixel.FlxGame;
import flxres.FlxRes;
import openfl.display.Sprite;

class Main extends Sprite
{
	/**
	 * The desing width of this game. You will use either this or the design heigh
	 */
	private static inline var DESIGN_WIDTH:Int = 1280;

	/**
	 * The desing height of this game. You will use either this or the design width
	 */
	private static inline var DESIGN_HEIGHT:Int = 720;

	public function new()
	{
		super();
		rhythm.backend.Log.init();
		var _width:Int;
		var _height:Int;

		/**
		 * returnWidth = true : resulted resolution is based on DESIGN_WIDTH
		 * returnWidth = false : resulted resolution is based on DESIGN_HEIGHT
		 */
		var returnWidth:Bool = false;

		if (returnWidth)
		{
			_height = DESIGN_HEIGHT;
			_width = FlxRes.getOtherDimension(_height, returnWidth);
		}
		else
		{
			_width = DESIGN_WIDTH;
			_height = FlxRes.getOtherDimension(_width);
		}
		addChild(new FlxGame(_width, _height, rhythm.scenes.PlayScene));
	}
}
