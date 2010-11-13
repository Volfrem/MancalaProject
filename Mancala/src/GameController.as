package {
	import Events.ShowWinTable;
	import Events.AddGemToPit;
	import Events.AnimationInProgress;
	import Events.CollectGemsInPit;
	import Events.DisablePlayerOnePits;
	import Events.DisablePlayerTwoPits;
	import Events.EventHandler;
	import Events.ExitGame;
	import Events.NextTurn;
	import Events.RemoveAllGemsFromPit;
	import Events.SameTurn;
	import Events.StartNewGame;

	import flash.events.MouseEvent;

	/**
	 * @author Sergei Laada
	 * Class for game controller, it is singletone
	 */
	public class GameController {

		//Instance of the class
		private static var mInstance : GameController;

		/**
		 * Initialize new instance
		 */
		public static function initialize() : void {
			if(mInstance) throw new Error("GameController is already initialized");
			mInstance = new GameController();
		}

		/**
		 * Get instance of the class
		 */
		public static function getInstance() : GameController {
			if(!mInstance) throw new Error("GameController is not initialized");
			return mInstance;
		}

		/*
		 * Function that will be executed when some button is pressed
		 */
		public function clickHandler(event : MouseEvent) : void {
			this["on" + event.target["name"] + "Pressed"]();//construct function from button name
		}

		/**
		 * Function that will be executed when play button is pressed
		 */
		protected function onPlayButtonPressed() : void {
			var model : GameModel = GameModel.getInstance();
			model.startNewGame();		}

		/**
		 * Function that will be executed when model is initialized, from model
		 */
		public function modelInitilized(_playerOne : Player,_playerTwo : Player) : void {
			EventHandler.dispatchGlobalEvent(new StartNewGame(_playerOne.name, _playerTwo.name, _playerOne.gemsCaptured, _playerTwo.gemsCaptured, _playerOne.gemsInPits, _playerTwo.gemsInPits));
		}

		/**
		 * Function that will be executed when exit button is pressed
		 */
		protected function onExitButtonPressed() : void {
			EventHandler.dispatchGlobalEvent(new ExitGame());
		}

		/**
		 * Function that will be executed when player one name is changed
		 */
		public function playerOneNameChanged(_name : String) : void {
			GameModel.getInstance().playerOne.name = _name;
		}

		/**
		 * Function that will be executed when player two name is changed
		 */
		public function playerTwoNameChanged(_name : String) : void {
			GameModel.getInstance().playerTwo.name = _name;
		}

		/**
		 * Function that will be executed when pit is pressed
		 * @param _pitID pi id
		 */
		public function pitPressed(_pitID : int) : void {
			var model : GameModel = GameModel.getInstance();
			EventHandler.dispatchGlobalEvent(new AnimationInProgress());
			model.pitSelected(_pitID);
		}

		/**
		 * Function that will be executed when new gem is added in the model, from model
		 */
		public function pitUpdated(_id : int, _gemColor : String) : void {
			EventHandler.dispatchGlobalEvent(new AddGemToPit(_id, _gemColor));
		}

		/**
		 * Remove all gems from the pit, from model
		 * @param _id pit it
		 */
		public function removeAllGems(_id : int) : void {
			EventHandler.dispatchGlobalEvent(new RemoveAllGemsFromPit(_id));
		}

		/**
		 * Function that will be executed when all pits are updated, from model and mancalas
		 */
		public function allPitsUpdated(pit : IPit) : void {
			var model : GameModel = GameModel.getInstance();
			if(pit is Mancala) model.sameTurn(); 
			else model.nextTurn();
		}

		/**
		 * Set next turn, from model
		 * @param p1cap player one captured gems
		 * @param p1pit player one in pits gems
		 * @param p2cap player two captured gems
		 * @param p2pit player two in pits gems
		 */
		public function nextTurn(p1cap : int,p2cap : int,p1pit : int,p2pit : int) : void {
			EventHandler.dispatchGlobalEvent(new NextTurn(p1cap, p2cap, p1pit, p2pit));
		}

		/**
		 * Set same turn, from model
		 * @param p1cap player one captured gems
		 * @param p1pit player one in pits gems
		 * @param p2cap player two captured gems
		 * @param p2pit player two in pits gems
		 */
		public function sameTurn(p1cap : int,p2cap : int,p1pit : int,p2pit : int) : void {
			EventHandler.dispatchGlobalEvent(new SameTurn(p1cap, p2cap, p1pit, p2pit));
		}

		/**
		 * Collect gems from pit, from model
		 * @param _pit pit id
		 */
		public function collectGems(_pit : int) : void {
			EventHandler.dispatchGlobalEvent(new CollectGemsInPit(_pit));
		}

		/**
		 * Disable player one pits, from model
		 */
		public function disablePlayerOnePits() : void {
			EventHandler.dispatchGlobalEvent(new DisablePlayerOnePits());
		}

		/**
		 * Disable player two pits, from model
		 */
		public function disablePlayerTwoPits() : void {
			EventHandler.dispatchGlobalEvent(new DisablePlayerTwoPits());
		}

		/**
		 * Show win table, from model
		 * @param p1 player one name
		 * @param p1cap player one captured gems
		 * @param p1pit player one in pits gems
		 * @param p2 player two name
		 * @param p2cap player two captured gems
		 * @param p2pit player two in pits gems
		 */
		public function showWinTable(p1 : String,p2 : String,p1cap : int,p2cap : int,p1pit : int,p2pit : int,winner : String) : void {
			EventHandler.dispatchGlobalEvent(new ShowWinTable(p1, p2, p1cap, p2cap, p1pit, p2pit, winner));
		}
	}
}
