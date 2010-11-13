package Graphics {
	import Graphics.Buttons.PlayGame;
	import Graphics.Inputs.PlayerOne;
	import Graphics.Inputs.PlayerTwo;

	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 * Class for holding information about the screen, that will be shown when game is started
	 */
	public class StartupScreen extends MovieClip {

		//play button
		private var mPlayButton : PlayGame;
		//Input with player one name		private var mPlayerOneInput : PlayerOne;
		//Input with player two name		private var mPlayerTwoInput : PlayerTwo;

		public function StartupScreen() {
			initializeScreen();
		}

		/**
		 * Initialize the screen
		 */
		private function initializeScreen() : void {
			var controller : GameController = GameController.getInstance();
			//controller.clickHandler function will be executed when button is pressed
			mPlayButton = new PlayGame(290, 280, "PlayButton", controller.clickHandler);
			mPlayerOneInput = new PlayerOne(30, 300, 148, 50, 10, controller.playerOneNameChanged);			mPlayerTwoInput = new PlayerTwo(570, 300, 148, 50, 10, controller.playerTwoNameChanged);			addChild(mPlayButton);			addChild(mPlayerOneInput);			addChild(mPlayerTwoInput);
		}

		/**
		 * Clear player names from text inputs
		 */
		public function clearFields() : void {
			mPlayerOneInput.clearField();			mPlayerTwoInput.clearField();
		}
	}
}
