package Labels {
	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 */
	public class PlayerNameLabel extends MovieClip {

		public function PlayerNameLabel(_name : String, _x : int,_y : int) {
			x = _x;
			y = _y;
			name = _name;
		}

		public function set text(txt : String) : void {
			this["txt"]["text"] = txt;
		}
	}
}
