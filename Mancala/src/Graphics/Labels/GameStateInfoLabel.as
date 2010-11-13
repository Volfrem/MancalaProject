package Graphics.Labels {
	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 * Class for game state info label
	 */
	public class GameStateInfoLabel extends MovieClip {

		/**
		 * @param _x x coordinate
		 * @param _y y coordinate
		 */
		public function GameStateInfoLabel(_x : int,_y : int) {
			x = _x;
			y = _y;
		}

		public function set text(txt : String) : void {
			this["txt"]["text"] = txt;
		}

		public function clearField() : void {
			this["txt"]["text"] = "";
		}
	}
}
