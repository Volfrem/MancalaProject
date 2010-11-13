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

		private var mPlayButton : PlayGame;		private var mCreditsButton : Credits;		private var mPlayerOneInput : PlayerOne;		private var mPlayerTwoInput : PlayerTwo;

		public function StartupScreen() {
			initializeScreen();
		}

		private function initializeScreen() : void {
			var controller : GameController = GameController.getInstance();
			mPlayButton = new PlayGame(290, 280, "PlayButton", controller.clickHandler);			mCreditsButton = new Credits(250, 450, "CreditsButton", controller.clickHandler);
			mPlayerOneInput = new PlayerOne(30, 300, 148, 50, 10, controller.playerOneNameChanged);			mPlayerTwoInput = new PlayerTwo(570, 300, 148, 50, 10, controller.playerTwoNameChanged);			addChild(mPlayButton);			addChild(mCreditsButton);			addChild(mPlayerOneInput);			addChild(mPlayerTwoInput);
		}

		public function clearFields() : void {
			mPlayerOneInput.clearField();			mPlayerTwoInput.clearField();
		}
	}
}
