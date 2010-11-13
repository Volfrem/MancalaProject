package Graphics.Labels {
	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 * Class for win table label
	 */
	public class WinTableLabel extends MovieClip {

		/**
		 * @param _x x coordinate
		 * @param _y y coordinate
		 */
		public function WinTableLabel(_x : int,_y : int) {
			x = _x;
			y = _y;
		}

		public function set text(txt : String) : void {
			this["txt"]["text"] = txt;
		}

		/**
		 * Clear label text
		 */
		public function clearField() : void {
			this["txt"]["text"] = "";
		}
	}
}
