package Inputs {
	import fl.controls.TextInput;

	import flash.events.Event;
	import flash.text.TextFormat;

	/**
	 * @author Sergei Laada
	 */
	public class GenericInput extends TextInput {

		private var mChangeFunction : Function;

		public function GenericInput(_x : int,_y : int, _width : int, _height : int, _maxChars : int, _changeFunction : Function) {
			super();
			var textFormat : TextFormat = new TextFormat(); 
			textFormat.color = 0xFF6600; 
			textFormat.font = "Monotype Corsiva"; 
			textFormat.size = 30; 
			textFormat.align = "center"; 
			textFormat.italic = true; 
			setStyle("textFormat", textFormat); 
			setSize(_width, _height); 
			move(_x, _y);
			maxChars = _maxChars;
			mChangeFunction = _changeFunction;
			addListeners();
		}

		private function addListeners() : void {
			addEventListener(Event.CHANGE, onInputChange);
		}

		//		private function removeListeners() : void {
		//			removeEventListener(Event.CHANGE, onInputChange);
		//		}

		private function onInputChange(event : Event) : void {
			mChangeFunction(text);
		}

		public function clearField() : void {
			text = "";
		}
	}
}
