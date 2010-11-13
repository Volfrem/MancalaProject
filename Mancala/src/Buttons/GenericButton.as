package Buttons {
	import flash.events.MouseEvent;
	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 */
	public class GenericButton extends MovieClip {

		private var mCompleteFunction : Function;

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

		private function addListeners() : void {
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}

		private function removeListeners() : void {
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}

		private function onMouseDown(event : MouseEvent) : void {
			gotoAndStop("down");
		}

		private function onMouseOut(event : MouseEvent) : void {
			gotoAndStop("up");
		}

		private function onMouseUp(event : MouseEvent) : void {
			gotoAndStop("over");
			mCompleteFunction(event);
		}

		private function onMouseOver(event : MouseEvent) : void {
			gotoAndStop("over");
		}

		public function enable() : void {
			gotoAndStop("up");
			addListeners();
			buttonMode = true;
			mouseEnabled = true;
		}

		public function disable() : void {
			gotoAndStop("disabled");
			removeListeners();
			buttonMode = false;
			mouseEnabled = false;
		}
	}
}
