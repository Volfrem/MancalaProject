package Graphics.Inputs {

	/**
	 * @author Sergei Laada
	 * Class for player one input field
	 */
	public class PlayerOne extends GenericInput {

		/**
		 * @param _changeFunction Function that will be executed when input text is changed
		 * @param _height height of the input field
		 * @param _maxChars input field max chars
		 * @param _width width of the input field
		 * @param _x x coordinate
		 * @param _y y coordinate
		 */
		public function PlayerOne(_x : int,_y : int, _width : int, _height : int, _maxChars : int, _completeFunction : Function) : void {
			super(_x, _y, _width, _height, _maxChars, _completeFunction);
		}
	}
}
