package rhythm.data;

typedef NoteStyleImgConfig =
{
	@:optional var glow:String; // the glow that shows up when you hold a key or hit a note
	var head:String; // the tap notes graphic path
	var receptor:String; // the receptors graphic
	var hold:String; // the hold bodys graphic
	var tail:String; // path to the hold ends graphic
}

typedef StyleData =
{
	var colored:Bool; // if the users settings are able to color the glow, and notes + holds of the noteskin
	var scale:Float; // x and y scale multiplier if the style is a bit small or too big
	@:optional var tailHeight:Int; // the height of the tails frame, anything below that in pixels related to the graphic itself gets clipped
	var name:String; // the name to show up in the settings menu
	var images:NoteStyleImgConfig; // the paths to the image for each induvidual piece of the notestyle
	var antialiasing:Bool; // if your notestyle looks too pixely, enable this but if it is too blurred ex. scale bigger then shut it off or resize the images
}

class NoteStyle
{
	/**
	 * The cache holding all notestyles, do not use this, use NoteStyle.get instead.
	**/
	private static var noteskincache:Map<String, StyleData> = new Map<String, StyleData>();

	public static function get(skin:String):StyleData
	{
		if (noteskincache.exists(skin))
			return noteskincache.get(skin);

		var path = Assets.getPath('images/notestyles/$skin/data.json');
		if (!Assets.exists(path, TEXT))
		{
			Log.error('notestyle $skin is missing dat a file $path, returning default circle skin');
			return get('circle');
		}

		var data:StyleData = haxe.Json.parse(Assets.getText(path));
		noteskincache.set(skin, data);
		return data;
	}
}
