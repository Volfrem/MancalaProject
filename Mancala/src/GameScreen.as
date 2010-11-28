package {
	import Labels.PlayerNameLabel;

	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 */
	public class GameScreen extends MovieClip {

		private var mPlayerOneLabel : PlayerNameLabel;

		public function GameScreen() {
			initializeScreen();
		}

		private function initializeScreen() : void {
			mPlayerOneLabel = new PlayerNameLabel("PlayerOneName", 50, 50);
			addChild(mPlayerOneLabel);
		}

		public function set playerOneName(name : String) : void {
			mPlayerOneLabel.text = name;
		}

		public function set playerTwoName(name : String) : void {
			mPlayerTwoLabel.text = name;
		}
	}
}