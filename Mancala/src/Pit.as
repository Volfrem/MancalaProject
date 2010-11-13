package {

	/**
	 * @author Sergei Laada
	 * Class for pit
	 */
	public class Pit implements IPit {

		//Pit id
		private var mPitID : int;
		//gem list		private var mGems : Vector.<Gem>;
		//number of gems		private var mGemCounter : int;
		//pit that is next to this one
		private var mNextPit : IPit;

		/**
		 * @param _id pit id
		 */
		public function Pit(_id : int) {
			mPitID = _id;
		}

		/**
		 * Initialize gems in pit when game is started
		 * @param _gemColors gem colors
		 * @param _gems gems number
		 */
		public function initializeGems(_gems : int, _gemColors : Vector.<String>) : void {
			mGems = new Vector.<Gem>();
			var j : String;
			for each (j in _gemColors) {
				mGems.push(new Gem(j));
			}

			var controller : GameController = GameController.getInstance();
			var i : Gem;
			for each (i in mGems) {
				controller.pitUpdated(mPitID, i.color);
			}
			
			mGemCounter = _gems;
		}

		public function set nextPit(_pit : IPit) : void {
			mNextPit = _pit;
		}

		/**
		 * Function that is executed when pit is selected
		 */
		public function pitSelected() : void {
			//remove all gems from that pit nd update next pit
			mGemCounter = 0;
			mNextPit.update(mGems.concat());
			mGems = new Vector.<Gem>();
		}

		/**
		 * collect all gems from the pit
		 */
		public function collectGems() : Vector.<Gem> {
			if(!mGems) return null;
			var gems : Vector.<Gem> = mGems.concat();
			mGems = new Vector.<Gem>();
			mGemCounter = 0;
			return gems;
		}

		/**
		 * Add new gem to the pit and updte next one
		 */
		public function update(_gems : Vector.<Gem>) : void {
			var gem : Gem = _gems.pop();//get one gem from the list
			mGems.push(gem);
			mGemCounter++;
			var controller : GameController = GameController.getInstance();			var model : GameModel = GameModel.getInstance();
			controller.pitUpdated(mPitID, gem.color);
			if(_gems.length > 0) mNextPit.update(_gems);//if there are gems in the list update next pit
			else model.allPitsUpdated(this);//else end animation
		}

		public function gemCount() : int {
			return mGemCounter;
		}

		public function get id() : int {
			return mPitID;
		}
	}
}
