package Graphics {
	import Graphics.Labels.GemsInfoLabel;
	import Graphics.Labels.GameStateInfoLabel;
	import Graphics.Buttons.ExitGame;
	import Graphics.Labels.PlayerNameLabel;

	import flash.display.MovieClip;
	import flash.utils.Dictionary;

	/**
	 * @author Sergei Laada
	 * This class holds information about the screen where main game will take place
	 */
	public class GameScreen extends MovieClip {

		//Label with player one name
		private var mPlayerOneLabel : PlayerNameLabel;
		//Label with player two name		private var mPlayerTwoLabel : PlayerNameLabel;
		//Label with information whose turn is now		private var mStateInfo : GameStateInfoLabel;
		//Label with player one captured gems information		private var mPOneCapGemsLabel : GemsInfoLabel;
		//Label with player two captured gems information		private var mPTwoCapGemsLabel : GemsInfoLabel;
		//Label with player one gems in pits information		private var mPOnePitGemsLabel : GemsInfoLabel;
		//Label with player two gems in pits information		private var mPTwoPitGemsLabel : GemsInfoLabel;
		//Dictionary with all pits instances
		private var mAllPits : Dictionary;
		//Current player index, used to switch turns		private var mCurrentPlayer : int;

		public function GameScreen() {
			initializeScreen();
		}

		/**
		 * Create all graphic instances and initialize them
		 */
		private function initializeScreen() : void {
			//Poisition labels
			mPlayerOneLabel = new PlayerNameLabel(30, 30);			mPlayerTwoLabel = new PlayerNameLabel(600, 400);			mStateInfo = new GameStateInfoLabel(200, 150);
			mPOneCapGemsLabel = new GemsInfoLabel(30, 80);			mPOnePitGemsLabel = new GemsInfoLabel(30, 110);			mPTwoCapGemsLabel = new GemsInfoLabel(600, 450);			mPTwoPitGemsLabel = new GemsInfoLabel(600, 480);
			var controller : GameController = GameController.getInstance();
			//controller.clickHandler function will be executed when exit button is pressed
			var exitButton : ExitGame = new ExitGame(0, 500, "ExitButton", controller.clickHandler);
			//Add objects to the stage
			addChild(exitButton);
			addChild(mPlayerOneLabel);			addChild(mPlayerTwoLabel);			addChild(mStateInfo);			addChild(mPOneCapGemsLabel);			addChild(mPOnePitGemsLabel);			addChild(mPTwoCapGemsLabel);			addChild(mPTwoPitGemsLabel);
			createPits();
		}

		/**
		 * Put initial information about gem counters to the labels
		 * @param p1cap captured gems of the player one
		 * @param p2cap captured gems of the player two
		 * @param p1pit in pit gems of the player one
		 * @param p2pit in pit gems of the player two
		 */
		private function initGemInfoLabels(p1cap : int,p2cap : int,p1pit : int,p2pit : int) : void {
			mPOneCapGemsLabel.text = "Captured: " + p1cap;
			mPOnePitGemsLabel.text = "In pits: " + p1pit;
			mPTwoCapGemsLabel.text = "Captured: " + p2cap;
			mPTwoPitGemsLabel.text = "In pits: " + p2pit;
		}

		/**
		 * Update gem info labels
		 * @param p1cap captured gems of the player one
		 * @param p2cap captured gems of the player two
		 * @param p1pit in pit gems of the player one
		 * @param p2pit in pit gems of the player two
		 */
		private function updateGemInfoLabels(p1cap : int,p2cap : int,p1pit : int,p2pit : int) : void {
			updatePOneGemInfoLabels(p1cap, p1pit);
			updatePTwoGemInfoLabels(p2cap, p2pit);
		}

		/**
		 * Update player one gem info labels
		 * @param p1cap captured gems of the player one
		 * @param p1pit in pit gems of the player one
		 */
		private function updatePOneGemInfoLabels(p1cap : int,p1pit : int) : void {	
			mPOneCapGemsLabel.text = "Captured: " + p1cap;
			mPOnePitGemsLabel.text = "In pits: " + p1pit;
		}

		/**
		 * Update player two gem info labels
		 * @param p2cap captured gems of the player two
		 * @param p2pit in pit gems of the player two
		 */
		private function updatePTwoGemInfoLabels(p2cap : int,p2pit : int) : void {
			mPTwoCapGemsLabel.text = "Captured: " + p2cap;
			mPTwoPitGemsLabel.text = "In pits: " + p2pit;
		}

		/**
		 * Create pit objects
		 */
		private function createPits() : void {
			mAllPits = new Dictionary();
			createPlayerOnePits();
			createPlayerTwoPits();
		}

		/**
		 * Create player one pit objects
		 */
		private function createPlayerOnePits() : void {
			var i : int;
			var pitID : int = 13;//first row first pit
			var pit : PitGraphic;
			var controller : GameController = GameController.getInstance();
			
			for (i = 0;i < 3;i++) {
				//3 is because distance between the pits isn`t the same
				pit = new PitGraphic(208 + i * 59, 240, controller.pitPressed, pitID);
				addChild(pit);
				mAllPits[pitID] = pit;//add new pit to the list of pits
				pit = new PitGraphic(424 + i * 59, 240, controller.pitPressed, pitID - 3);
				addChild(pit);
				mAllPits[pitID - 3] = pit;//add new pit to the list of pits
				pitID--;
			}
			
			var mancala : MancalaGraphic;//create player one mancala
			mancala = new MancalaGraphic(146, 239, 0);
			mAllPits[0] = mancala;//left mancala
			addChild(mancala);
		}

		/**
		 * Create player two pit objects
		 */
		private function createPlayerTwoPits() : void {
			var i : int;
			var pitID : int = 1;//second row first pit
			var pit : PitGraphic;
			var controller : GameController = GameController.getInstance();
			
			var mancala : MancalaGraphic;
			mancala = new MancalaGraphic(603, 239, 7);
			mAllPits[7] = mancala;//right mancala
			addChild(mancala);
			
			for (i = 0;i < 3;i++) {
				//3 is because distance between the pits isn`t the same
				pit = new PitGraphic(208 + i * 59, 309, controller.pitPressed, pitID);
				addChild(pit);
				mAllPits[pitID] = pit;//add new pit to the list of pits
				pit = new PitGraphic(424 + i * 59, 309, controller.pitPressed, pitID + 3);
				addChild(pit);
				mAllPits[pitID + 3] = pit;//add new pit to the list of pits
				pitID++;
			}
		}

		/**
		 * Remove all gems from the pit with given id
		 * @param _pitID pit id where gems have to be removed
		 */
		public function removeAllGems(_pitID : int) : void {
			IPitGraphic(mAllPits[_pitID]).removeAllGems();
		}

		/**
		 * add gem with given color to the pit with given id
		 * @param _gemColor color of the gem
		 * @param _id id of the pit
		 */
		public function addGemToPit(_id : int, _gemColor : String) : void {
			IPitGraphic(mAllPits[_id]).addGem(_gemColor);
		}

		/**
		 * set player one name
		 */
		public function set playerOneName(name : String) : void {
			mPlayerOneLabel.text = name;
		}

		/**
		 * set player two name
		 */
		public function set playerTwoName(name : String) : void {
			mPlayerTwoLabel.text = name;
		}

		/**
		 * Keep the same turn
		 * @param p1cap captured gems of the player one
		 * @param p2cap captured gems of the player two
		 * @param p1pit in pit gems of the player one
		 * @param p2pit in pit gems of the player two
		 */
		public function sameTurn(p1cap : int,p2cap : int,p1pit : int,p2pit : int) : void {
			mStateInfo.visible = true;
			mStateInfo.text = stateText;
			mStateInfo.gotoAndPlay("start");
			updateGemInfoLabels(p1cap, p2cap, p1pit, p2pit);
		}

		/**
		 * Next player gets his turn
		 * @param p1cap captured gems of the player one
		 * @param p2cap captured gems of the player two
		 * @param p1pit in pit gems of the player one
		 * @param p2pit in pit gems of the player two
		 */
		public function nextTurn(p1cap : int,p2cap : int,p1pit : int,p2pit : int) : void {
			mStateInfo.text = stateText;
			mStateInfo.visible = true;
			mStateInfo.gotoAndPlay("start");
			updateGemInfoLabels(p1cap, p2cap, p1pit, p2pit);
		}

		/**
		 * Disable all pits and hide state information label
		 */
		public function animationInProgress() : void {
			mStateInfo.visible = false;
			disableAllPits();
		}

		/**
		 * Decide what information to show in the state information label
		 */
		private function get stateText() : String {
			switch(mCurrentPlayer) {
				case 0:
					return mPlayerOneLabel.text + ", it is your turn";
					break;
				case 1:
					return mPlayerTwoLabel.text + ", it is your turn";
					break;
			}
			throw new Error("Wrong player");
		}

		/**
		 * Start the nw game
		 * @param _playerOneName name of player one
		 * @param _playerTwoName name of player two
		 * @param p1cap player one captured gems
		 * @param p1pit player one in pits gems
		 * @param p2cap player two captured gems
		 * @param p2pit player two in pits gems
		 */
		public function startNewGame(_playerOneName : String,_playerTwoName : String,p1cap : int,p2cap : int,p1pit : int,p2pit : int) : void {
			playerOneName = _playerOneName;
			playerTwoName = _playerTwoName;
			initGemInfoLabels(p1cap, p2cap, p1pit, p2pit);
			//player one will get his turn first
			mCurrentPlayer = 0;
			mStateInfo.visible = true;
			mStateInfo.text = stateText;
			//animate state info label
			mStateInfo.gotoAndPlay("start");
		}

		/**
		 * Disable player one pits
		 */
		public function disablePlayerOnePits() : void {
			var i : int;
			for (i = 8;i < 14;i++) {
				PitGraphic(mAllPits[i]).disable();
			}
		}

		/**
		 * Disable player two pits
		 */
		public function disablePlayerTwoPits() : void {
			var i : int;
			for (i = 1;i < 7;i++) {
				PitGraphic(mAllPits[i]).disable();
			}
			
			for (i = 8;i < 14;i++) {
				PitGraphic(mAllPits[i]).enable();
			}
		}

		/**
		 * Enable player one pits
		 */
		public function enablePlayerOnePits() : void {
			var i : int;
			for (i = 8;i < 14;i++) {
				PitGraphic(mAllPits[i]).enable();
			}
			//Switch current player
			mCurrentPlayer = 0;
		}

		/**
		 * Enable player two pits
		 */
		public function enablePlayerTwoPits() : void {
			var i : int;
			for (i = 1;i < 7;i++) {
				PitGraphic(mAllPits[i]).enable();
			}
			//Switch current player
			mCurrentPlayer = 1;
		}

		/**
		 * Disable all pits
		 */
		private function disableAllPits() : void {
			disablePlayerOnePits();			disablePlayerTwoPits();
		}
	}
}
