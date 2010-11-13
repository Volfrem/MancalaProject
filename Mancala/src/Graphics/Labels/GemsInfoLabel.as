package Graphics.Labels {
	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 * Class for gems info label
	 */
	public class GemsInfoLabel extends MovieClip {

		/**
		 * @param _x x coordinate
		 * @param _y y coordinate
		 */
		public function GemsInfoLabel(_x : int,_y : int) {
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
