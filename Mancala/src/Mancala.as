package {

	/**
	 * @author Sergei Laada
	 * Class for player mancala
	 */
	public class Mancala implements IPit {

		//mancala id
		private var mMancalaID : int;
		//gems list
		private var mGems : Vector.<Gem>;
		//mancala owner		private var mOwner : Player;
		//gems counter
		private var mGemCounter : int;
		//pit that is next to mancala
		private var mNextPit : IPit;

		/**
		 * @param _id mancala id
		 * @param _owner mancala owner
		 */
		public function Mancala(_id : int, _owner : Player) {
			mMancalaID = _id;
			mGems = new Vector.<Gem>();
			mOwner = _owner;
			mGemCounter = 0;
		}

		/**
		 * @param _pit pit id
		 */
		public function set nextPit(_pit : IPit) : void {
			mNextPit = _pit;
		}

		/**
		 * Increment gems in self, active player is owner nd update next pit if gem counter is >0
		 */
		public function update(_gems : Vector.<Gem>) : void {
			var model : GameModel = GameModel.getInstance();
			if(mOwner != model.activePlayer) {
				//check if owner is active player
				mNextPit.update(_gems);//updte next pit, without updating self
				return;
			}
			
			mGemCounter++;
			var gem : Gem = _gems.pop();//get one gem from the list
			mGems.push(gem);//add gem to the mancala list
			var controller : GameController = GameController.getInstance();
			controller.pitUpdated(mMancalaID, gem.color);
			if(_gems.length > 0) mNextPit.update(_gems);//if there re gems in the list update next pit
			else controller.allPitsUpdated(this);//else end animation
		}

		/**
		 * Function to handle click event
		 * Isn`t used because mancala couldn`t be clicked
		 */
		public function pitSelected() : void {
		}

		public function gemCount() : int {
			return mGemCounter;
		}

		public function get id() : int {
			return mMancalaID;
		}

		/**
		 * Collect all gems from mancala
		 */
		public function collectGems() : Vector.<Gem> {
			if(!mGems) return null;//check if there are gems in list
			var gems : Vector.<Gem> = mGems.concat();
			mGems = new Vector.<Gem>();
			mGemCounter = 0;
			return gems;
		}

		/**
		 * Add new gem to mancala
		 */
		public function addGem(_gem : Gem) : void {
			mGemCounter++;
			mGems.push(_gem);
		}

		/**
		 * Initialize gems on the start
		 * Isn`t used because there are no gems in mancala when game is started
		 * @param _gemColors gem colors
		 * @param _gems number of gems
		 */
		public function initializeGems(_gems : int, _gemColors : Vector.<String>) : void {
		}
	}
}
