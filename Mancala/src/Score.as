package {

	/**
	 * @author Sergei Laada
	 */
	public class Score {

		private var mPlayerOneWon : int;		private var mPlayerTwoWon : int;		private var mRounds : int;		private var mScoreIsSet : int;

		public function Score() {
			initialize();
		}

		private function initialize() : void {
			playersChanged();
		}

		public function setScore(_winner : int) : void {
			if(_winner == 0) mPlayerOneWon++;
			else mPlayerTwoWon++;
			mRounds++;
			mScoreIsSet = 1;
		}

		public function get scoreIsSet() : int {
			return mScoreIsSet;
		}

		public function playersChanged() : void {
			mRounds = 0;
			mScoreIsSet = 0;
			mPlayerOneWon = 0;
			mPlayerTwoWon = 0;
		}

		public function get rounds() : int {
			return mRounds;
		}

		public function get playerOneWon() : int {
			return mPlayerOneWon;
		}

		public function get playerTwoWon() : int {
			return mPlayerTwoWon;
		}
	}
}
