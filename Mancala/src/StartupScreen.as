package {
	import Buttons.Credits;
	import Buttons.PlayGame;

	import Inputs.PlayerOne;
	import Inputs.PlayerTwo;

	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 */
	public class StartupScreen extends MovieClip {

		private var mPlayButton : PlayGame;

		public function StartupScreen() {
			initializeScreen();
		}

		private function initializeScreen() : void {
			var controller : GameController = GameController.getInstance();
			mPlayButton = new PlayGame(290, 280, "PlayButton", controller.clickHandler);
			mPlayerOneInput = new PlayerOne(30, 300, 148, 50, 10, controller.playerOneNameChanged);
		}

		public function clearFields() : void {
			mPlayerOneInput.clearField();
		}
	}
}