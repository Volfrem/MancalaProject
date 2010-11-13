package {

	/**
	 * @author Sergei Laada
	 * Class for player
	 */
	public class Player {

		//player default name
		private var mDefaultName : String;
		//player inputted name
		private var mCurrentName : String;
		//number of init gems		private var mInitPitGems : int;
		//number of init captured gems		private var mInitCaptured : int;
		//captured gems		private var mCapturedGems : int;
		//number of gems in player pits		private var mGemsInPits : int;
		//colors of init gems		private var mInitGemsColors : Vector.<String>;

		/**
		 * @param _defaultName player default name
		 * @param _gemColors colors of the init gems
		 * @param _gems gems number
		 */
		public function Player(_defaultName : String, _gems : int, _gemColors : Vector.<String>) {
			mInitGemsColors = _gemColors;
			mDefaultName = _defaultName;
			mInitPitGems = _gems;
			mInitCaptured = 0;
		}

		public function get name() : String {
			if(nameExist()) return mCurrentName;
			return mDefaultName;
		}

		public function set name(_name : String) : void {
			mCurrentName = _name;
		}

		/**
		 * Check if name was inputted
		 */
		private function nameExist() : Boolean {
			if(!mCurrentName) return false;
			var symbols : Array = mCurrentName.split("");
			var value : String;
			for each (value in symbols) {
				if(value != " ") return true;
			}
			return false;
		}

		public function get gemsInPits() : int {
			return mGemsInPits;
		}

		public function set gemsInPits(_gems : int) : void {
			mGemsInPits = _gems;
		}

		public function get gemsCaptured() : int {
			return mCapturedGems;
		}

		public function set gemsCaptured(_gems : int) : void {
			mCapturedGems = _gems;
		}

		public function get initGemColors() : Vector.<String> {
			return mInitGemsColors;
		}

		/**
		 * Initialize player information
		 */
		public function initPlayer() : void {
			mCapturedGems = mInitCaptured;
			mGemsInPits = mInitPitGems;
		}

		public function get initGemsInPits() : int {
			return mInitPitGems;
		}
	}
}
