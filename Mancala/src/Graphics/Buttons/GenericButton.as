package Graphics.Buttons {
	import flash.events.MouseEvent;
	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 * Generic class for all buttons
	 */
	public class GenericButton extends MovieClip {

		//Function that will be executed when button is pressed
		private var mCompleteFunction : Function;

		/**
		 * @param _name name of the button
		 * @param _x x coordinate
		 * @param _y y coordinate
		 * @param _completeFunction function that will be executed when button is pressed
		 */
		public function GenericButton(_x : int,_y : int,_name : String,_completeFunction : Function) {
			mCompleteFunction = _completeFunction;
			name = _name;
			x = _x;			y = _y;
			initializeButton();
		}

		private function initializeButton() : void {
			mouseChildren = false;
			enable();
		}

		/**
		 * Add mouse listeners
		 */
		private function addListeners() : void {
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}

		/**
		 * Remove mouse listeners
		 */
		private function removeListeners() : void {
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}

		/**
		 * Function that will be executed when mouse is down
		 */
		private function onMouseDown(event : MouseEvent) : void {
			gotoAndStop("down");
		}

		/**
		 * Function that will be executed when mouse is out
		 */
		private function onMouseOut(event : MouseEvent) : void {
			gotoAndStop("up");
		}

		/**
		 * Function that will be executed when mouse is up
		 */
		private function onMouseUp(event : MouseEvent) : void {
			gotoAndStop("over");
			mCompleteFunction(event);
		}

		/**
		 * Function that will be executed when mouse is over
		 */
		private function onMouseOver(event : MouseEvent) : void {
			gotoAndStop("over");
		}

		/**
		 * Enable button
		 */
		public function enable() : void {
			gotoAndStop("up");
			addListeners();
			buttonMode = true;
			mouseEnabled = true;
		}

		/**
		 * Disable button
		 */
		public function disable() : void {
			gotoAndStop("disabled");
			removeListeners();
			buttonMode = false;
			mouseEnabled = false;
		}
	}
}
