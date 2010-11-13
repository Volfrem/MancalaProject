package Graphics.Buttons {

	/**
	 * @author Sergei Laada
	 * Class for play button graphics
	 */
	public class PlayGame extends GenericButton {

		/**
		 * @param _name name of the button
		 * @param _x x coordinate
		 * @param _y y coordinate
		 * @param _completeFunction function that will be executed when button is pressed
		 */
		public function PlayGame(_x : int, _y : int, _name : String, _completeFunction : Function) {
			super(_x, _y, _name, _completeFunction);
		}
	}
}
