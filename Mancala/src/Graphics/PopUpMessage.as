package Graphics {
	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 * Class of the pop up message, this message will be shown when mouse is over the pit
	 */
	public class PopUpMessage extends MovieClip {

		public function PopUpMessage() {
		}

		public function set text(_txt : String) : void {
			this["txt"]["text"] = _txt;
		}

		public function move(_x : int,_y : int) : void {
			x = _x;
			y = _y;
		}
	}
}
