package Graphics.Labels {
	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 * Class for player name label
	 */
	public class PlayerNameLabel extends MovieClip {

		/**
		 * @param _x x coordinate
		 * @param _y y coordinate
		 */
		public function PlayerNameLabel(_x : int,_y : int) {
			x = _x;
			y = _y;
		}

		public function set text(txt : String) : void {
			this["txt"]["text"] = txt;
		}

		public function get text() : String {
			return this["txt"]["text"];
		}

		/**
		 * Clear label text
		 */
		public function clearField() : void {
			this["txt"]["text"] = "";
		}
	}
}
