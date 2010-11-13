package Graphics.Inputs {
	import fl.controls.TextInput;

	import flash.events.Event;
	import flash.text.TextFormat;

	/**
	 * @author Sergei Laada
	 * Class for all input fields
	 */
	public class GenericInput extends TextInput {
		//Function that will be executed when input text is changed
		private var mChangeFunction : Function;

		/**
		 * @param _changeFunction Function that will be executed when input text is changed
		 * @param _height height of the input field
		 * @param _maxChars input field max chars
		 * @param _width width of the input field
		 * @param _x x coordinate
		 * @param _y y coordinate
		 */
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

		/**
		 * Add listeners to the input field
		 */
		private function addListeners() : void {
			addEventListener(Event.CHANGE, onInputChange);
		}

		/**
		 * Function that will be executed when text is changed in input field
		 */
		private function onInputChange(event : Event) : void {
			mChangeFunction(text);
		}

		/**
		 * Clear input field text
		 */
		public function clearField() : void {
			text = "";
		}
	}
}
