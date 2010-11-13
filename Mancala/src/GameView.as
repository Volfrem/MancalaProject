package {
	import Events.ShowWinTable;
	import Events.DisablePlayerTwoPits;
	import Events.DisablePlayerOnePits;
	import Events.CollectGemsInPit;
	import Events.SameTurn;
	import Events.NextTurn;
	import Events.RemoveAllGemsFromPit;
	import Events.AddGemToPit;
	import Events.AnimationInProgress;
	import Events.EventHandler;
	import Events.ExitGame;
	import Events.StartNewGame;

	import Graphics.GameScreen;
	import Graphics.StartupScreen;
	import Graphics.WinTable;

	import flash.display.Stage;

	/**
	 * @author Sergei Laada
	 * Class for game view
	 */
	public class GameView {

		//stage instance
		private var mStage : Stage;
		//screen when game has started
		private var mStartupScreen : StartupScreen;
		//screen when play button is pressed		private var mGameScreen : GameScreen;
		//table with game result		private var mWinTable : WinTable;

		public function GameView(_stage : Stage) : void {
			startInitialView(_stage);
		}

		/**
		 * initialize view
		 * @param _stage stage instance
		 */
		private function startInitialView(_stage : Stage) : void {
			mStage = _stage;
			addEventSubscription();
			createStartupScreen();
			createGameScreen();
			createWinTable();
		}

		/**
		 * Add global listeners to get events from controller
		 */
		private function addEventSubscription() : void {
			EventHandler.addEventSubscription(StartNewGame.EVENT_NAME, startNewGame);			EventHandler.addEventSubscription(ExitGame.EVENT_NAME, exitGame);			EventHandler.addEventSubscription(AnimationInProgress.EVENT_NAME, animationInProgress);			EventHandler.addEventSubscription(AddGemToPit.EVENT_NAME, addGemToPit);			EventHandler.addEventSubscription(RemoveAllGemsFromPit.EVENT_NAME, removeAllGems);			EventHandler.addEventSubscription(NextTurn.EVENT_NAME, nextTurn);			EventHandler.addEventSubscription(SameTurn.EVENT_NAME, sameTurn);			EventHandler.addEventSubscription(CollectGemsInPit.EVENT_NAME, collectGems);			EventHandler.addEventSubscription(DisablePlayerOnePits.EVENT_NAME, disablePlayerOnePits);			EventHandler.addEventSubscription(DisablePlayerTwoPits.EVENT_NAME, disablePlayerTwoPits);			EventHandler.addEventSubscription(ShowWinTable.EVENT_NAME, showWinTable);
		}

		/**
		 * Create screen that is shown when game is started
		 */
		private function createStartupScreen() : void {
			mStartupScreen = new StartupScreen();
			showStartupScreen();
		}

		/**
		 * Create screen that is shown when play button is pressed
		 */
		private function createGameScreen() : void {
			mGameScreen = new GameScreen();
		}

		/**
		 * Create table with game results
		 */
		private function createWinTable() : void {
			mWinTable = new WinTable();
		}

		/**
		 * Show win table
		 */
		private function showWinTable(event : ShowWinTable) : void {
			mWinTable.fillWinTable(event.playerOneName, event.playerTwoName, event.playerOneCaptured, event.playerTwoCaptured, event.playerOneInPits, event.playerTwoInPits, event.winner);
			mStage.addChild(mWinTable);
		}

		/**
		 * Hide win table
		 */
		private function hideWinTable() : void {
			if(!mStage.getChildByName(mWinTable.name)) return;
			mStage.removeChild(mWinTable);
		}

		/**
		 * Show game screen
		 * @param p1cap player one captured gems
		 * @param p1Name player one name
		 * @param p1pit player one in pits gems
		 * @param p2cap player two captured gems
		 * @param p2Name player two name
		 * @param p2pit player two in pits gems
		 */
		private function showGameScreen(p1Name : String,p2Name : String,p1cap : int,p2cap : int,p1pit : int,p2pit : int) : void {
			mGameScreen.startNewGame(p1Name, p2Name, p1cap, p2cap, p1pit, p2pit);
			mStage.addChild(mGameScreen);
		}

		/**
		 * Add new gem to pit
		 */
		private function addGemToPit(event : AddGemToPit) : void {
			mGameScreen.addGemToPit(event.id, event.color);
		}

		/**
		 * Remove all gems from pit
		 */
		private function removeAllGems(event : RemoveAllGemsFromPit) : void {
			mGameScreen.removeAllGems(event.id);
		}

		/**
		 * Hide game screen
		 */
		private function hideGameScreen() : void {
			mStage.removeChild(mGameScreen);
		}

		/**
		 * Show startup screen
		 */
		private function showStartupScreen() : void {
			mStartupScreen.clearFields();
			mStage.addChild(mStartupScreen);
		}

		/**
		 * Hide startup screen
		 */
		private function hideStartupScreen() : void {
			mStage.removeChild(mStartupScreen);
		}

		/**
		 * Same turn function
		 */
		private function sameTurn(event : SameTurn) : void {
			mGameScreen.sameTurn(event.playerOneCaptured, event.playerTwoCaptured, event.playerOneInPits, event.playerTwoInPits);
		}

		/**
		 * Next turn function
		 */
		private function nextTurn(event : NextTurn) : void {
			mGameScreen.nextTurn(event.playerOneCaptured, event.playerTwoCaptured, event.playerOneInPits, event.playerTwoInPits);
		}

		/**
		 * Executed when some animation is in action
		 */
		private function animationInProgress(event : AnimationInProgress) : void {
			mGameScreen.animationInProgress();
		}

		/**
		 * Collect all gems from pit
		 */
		private function collectGems(event : CollectGemsInPit) : void {
			mGameScreen.removeAllGems(event.id);
		}

		/**
		 * Start new game
		 */
		private function startNewGame(event : StartNewGame) : void {
			hideStartupScreen();
			showGameScreen(event.playerOneName, event.playerTwoName, event.playerOneCaptured, event.playerTwoCaptured, event.playerOneInPits, event.playerTwoInPits);
		}

		/**
		 * Exit game
		 */
		private function exitGame(event : ExitGame) : void {
			hideGameScreen();
			showStartupScreen();
			hideWinTable();
		}

		/**
		 * Disable player one pits
		 */
		private function disablePlayerOnePits(event : DisablePlayerOnePits) : void {
			mGameScreen.disablePlayerOnePits();
			mGameScreen.enablePlayerTwoPits();
		}

		/**
		 * Disable player two pits
		 */
		private function disablePlayerTwoPits(event : DisablePlayerTwoPits) : void {
			mGameScreen.disablePlayerTwoPits();
			mGameScreen.enablePlayerOnePits();
		}
	}
}
