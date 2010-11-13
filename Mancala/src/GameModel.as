package {
	import flash.utils.Dictionary;

	/**
	 * @author Sergei Laada
	 * Class for game model
	 */
	public class GameModel {

		//instance of the game model
		private static var mInstance : GameModel;
		//player one
		private var mPlayerOne : Player;
		//player two		private var mPlayerTwo : Player;
		//pits list		private var mPits : Dictionary;
		//active player		private var mActivePlayer : Player;

		/**
		 * Initialize game model instance
		 */
		public static function initialize() : void {
			if(mInstance) throw new Error("GameModel is already initialized");
			mInstance = new GameModel();
			mInstance.createModel();
		}

		/**
		 * Get game model instance
		 */
		public static function getInstance() : GameModel {
			if(!mInstance) throw new Error("GameModel is not initialized");
			return mInstance;
		}

		/**
		 * Create game model variables
		 */
		private function createModel() : void {
			var gemColors : Vector.<String> = new Vector.<String>();
			gemColors.push("Blue", "Green", "Red", "Blue");//list of initial gem colors
			mPlayerOne = new Player("Player 1", 4, gemColors);			mPlayerTwo = new Player("Player 2", 4, gemColors);
			createPits();
		}

		/**
		 * Create pits instances
		 */
		private function createPits() : void {
			mPits = new Dictionary();
			var i : int;
			var pit : Pit;
			var previousPit : IPit;
			var mancala : Mancala = new Mancala(0, mPlayerOne);
			mPits[0] = mancala;//player one mancala
			previousPit = mancala;
			
			for (i = 1;i < 7;i++) {
				pit = new Pit(i);
				previousPit.nextPit = pit;
				mPits[i] = pit;
				previousPit = pit;
			}
			
			mancala = new Mancala(7, mPlayerTwo);
			previousPit.nextPit = mancala;
			previousPit = mancala;
			mPits[7] = mancala;//player two mancala

			for (i = 8;i < 14;i++) {
				pit = new Pit(i);
				previousPit.nextPit = pit;
				mPits[i] = pit;
				previousPit = pit;
			}
			
			previousPit.nextPit = mPits[0];
		}

		/**
		 * Get active player mancala
		 * @param _activePlayer active player
		 */
		private function playerMancala(_activePlayer : Player) : Mancala {
			switch(_activePlayer) {
				case mPlayerOne:
					return mPits[0];
					break;
				case mPlayerTwo:
					return mPits[7];
					break;
			}
			throw new Error("Wring player");
		}

		/**
		 * Get player one instance
		 */
		public function get playerOne() : Player {
			return mPlayerOne;
		}

		/**
		 * Get player two instance
		 */
		public function get playerTwo() : Player {
			return mPlayerTwo;
		}

		/**
		 * get active player instance
		 */
		public function get activePlayer() : Player {
			return mActivePlayer;
		}

		/**
		 * Function that will be executed when pit is selected, from controller
		 * @param _id pit id
		 */
		public function pitSelected(_id : int) : void {
			var controller : GameController = GameController.getInstance();
			controller.removeAllGems(_id);
			IPit(mPits[_id]).pitSelected();
		}

		/**
		 * Next turn, from controller
		 */
		public function nextTurn() : void {
			switchPlayer();
			updatePlayerGemInfo();
			var p1cap : int = mPlayerOne.gemsCaptured;
			var p2cap : int = mPlayerTwo.gemsCaptured;
			var p1pit : int = mPlayerOne.gemsInPits;
			var p2pit : int = mPlayerTwo.gemsInPits;
			var controller : GameController = GameController.getInstance();
			controller.nextTurn(p1cap, p2cap, p1pit, p2pit);
			checkEndGame();
		}

		/**
		 * Same turn, from controller
		 */
		public function sameTurn() : void {
			updatePlayerGemInfo();
			updatePlayerPitStates();
			var p1cap : int = mPlayerOne.gemsCaptured;
			var p2cap : int = mPlayerTwo.gemsCaptured;
			var p1pit : int = mPlayerOne.gemsInPits;
			var p2pit : int = mPlayerTwo.gemsInPits;
			var controller : GameController = GameController.getInstance();
			controller.sameTurn(p1cap, p2cap, p1pit, p2pit);
			checkEndGame();
		}

		/**
		 * Update all players gems info
		 */
		private function updatePlayerGemInfo() : void {
			updatePlayerOneGemInfo();
			updatePlayerTwoGemInfo();
		}

		/**
		 * Update player one gems info
		 */
		private function updatePlayerOneGemInfo() : void {
			var i : int;
			var captured : int = 0;
			var inPits : int = 0;
			//check all the pits
			for (i = 8;i < 14;i++) {
				inPits += Pit(mPits[i]).gemCount();
			}
			
			captured = Mancala(mPits[0]).gemCount();
			//put gems sum to the player instance
			mPlayerOne.gemsCaptured = captured;			mPlayerOne.gemsInPits = inPits;
		}

		/**
		 * Update player two gems info
		 */
		private function updatePlayerTwoGemInfo() : void {
			var i : int;
			var captured : int = 0;
			var inPits : int = 0;
			//check all the pits
			for (i = 1;i < 7;i++) {
				inPits += Pit(mPits[i]).gemCount();
			}
			
			captured = Mancala(mPits[7]).gemCount();
			
			//put gems sum to the player instance
			mPlayerTwo.gemsCaptured = captured;
			mPlayerTwo.gemsInPits = inPits;
		}

		/**
		 * Switch active player
		 */
		private function switchPlayer() : void {
			switch(mActivePlayer) {
				case mPlayerOne:
					mActivePlayer = mPlayerTwo;
					break;
				case mPlayerTwo:
					mActivePlayer = mPlayerOne;
					break;
			}
			updatePlayerPitStates();
		}

		/**
		 * Executed when all pits are updated, from pit
		 */
		public function allPitsUpdated(_pit : IPit) : void {
			var controller : GameController = GameController.getInstance();
			
			//check if it is the only one gem in pit
			if(_pit.gemCount() == 1 && checkEmptyPit(_pit.id)) {
				var maxPit : int = 14;
				//get parallel pit
				var parallelPit : Pit = mPits[maxPit - _pit.id];
				//get all gems from parallel pit
				controller.collectGems(parallelPit.id);
				var gems : Vector.<Gem> = parallelPit.collectGems();
				var i : Gem;
				var mancala : Mancala = playerMancala(mActivePlayer);
				//add each collected gem to active player mancala
				for each (i in gems) {
					mancala.addGem(i);
					controller.pitUpdated(mancala.id, i.color);
				}
				
				gems = _pit.collectGems();
				//collect gem from last updated pit
				controller.collectGems(_pit.id);
				//add that gem to active player mncala
				mancala.addGem(gems[0]);
				controller.pitUpdated(mancala.id, gems[0].color);
			}
			
			controller.allPitsUpdated(_pit);
		}

		/**
		 * Check if pit belongs to active player
		 * @param _pitID pit id
		 */
		private function checkEmptyPit(_pitID : int) : Boolean {
			if(_pitID > 1 && _pitID < 7 && mActivePlayer == mPlayerTwo) return true;			if(_pitID > 7 && _pitID < 14 && mActivePlayer == mPlayerOne) return true;
			return false;
		}

		/**
		 * Start the new game
		 */
		public function startNewGame() : void {
			var i : IPit;
			var controller : GameController = GameController.getInstance();
			//remove all gems from pits
			for each (i in mPits) {
				i.collectGems();
				controller.collectGems(i.id);
			}
			
			//initialize players
			mPlayerOne.initPlayer();
			mPlayerTwo.initPlayer();
			
			//initialize players pits
			initPlayerOnePits();
			initPlayerTwoPits();
			updatePlayerGemInfo();
			
			//set active player, it is player one
			mActivePlayer = mPlayerOne;
			
			controller.modelInitilized(mPlayerOne, mPlayerTwo);
			
			updatePlayerPitStates();
		}

		/**
		 * Put initial gems to the player one pits
		 */
		private function initPlayerOnePits() : void {
			var i : int;
			for (i = 8;i < 14;i++) {
				Pit(mPits[i]).initializeGems(mPlayerOne.initGemsInPits, mPlayerOne.initGemColors);
			}
		}

		/**
		 * Put initial gems to the player two pits
		 */
		private function initPlayerTwoPits() : void {
			var i : int;
			for (i = 1;i < 7;i++) {
				Pit(mPits[i]).initializeGems(mPlayerTwo.initGemsInPits, mPlayerTwo.initGemColors);
			}
		}

		/**
		 * Disable nonactive player pits
		 */
		private function updatePlayerPitStates() : void {
			var controller : GameController = GameController.getInstance();
			if(mActivePlayer == mPlayerOne) controller.disablePlayerTwoPits();
			else controller.disablePlayerOnePits();
		}

		/**
		 * Check if game has ended
		 */
		private function checkEndGame() : void {
			if(mPlayerOne.gemsInPits > 0 && mPlayerTwo.gemsInPits > 0) return;//check if players pits are not empty
			var controller : GameController = GameController.getInstance();
			var winner : String;
			var p1Points : int = mPlayerOne.gemsCaptured + mPlayerOne.gemsInPits;			var p2Points : int = mPlayerTwo.gemsCaptured + mPlayerTwo.gemsInPits;
			if(p1Points > p2Points) winner = mPlayerOne.name;
			else if(p1Points < p2Points) winner = mPlayerTwo.name;//decide the winner
			else winner = null;
			controller.showWinTable(mPlayerOne.name, mPlayerTwo.name, mPlayerOne.gemsCaptured, mPlayerTwo.gemsCaptured, mPlayerOne.gemsInPits, mPlayerTwo.gemsInPits, winner);
		}
	}
}
