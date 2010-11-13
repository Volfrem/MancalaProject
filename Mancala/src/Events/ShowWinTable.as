package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * send this event when there is a need to show table with win results
	 */
	public class ShowWinTable extends Event {

		//Event name
		public static const EVENT_NAME : String = "ShowWinTable";
		//Player one name
		private var mPlayerOneName : String;
		//Player two name		private var mPlayerTwoName : String;
		//Number of captured gems by first player		private var mPlayerOneCaptured : int;
		//Number of captured gems by second player		private var mPlayerTwoCaptured : int;
		//Number of gems in first player pits		private var mPlayerOneInPits : int;
		//Number of gems in second player pits		private var mPlayerTwoInPits : int;
		//Winner name		private var mWinner : String;

		/**
		 * @param _p1name Name of the first player
		 * @param _p2name Name of the second player
		 * @param _p1captured Number of captured gems by first player
		 * @param _p2captured Number of captured gems by second player
		 * @param _p1inPits Number of gems in first player pits
		 * @param _p2inPits Number of gems in second player pits
		 * @param _winner Name of the winner
		 */
		public function ShowWinTable(_p1name : String, _p2name : String, _p1captured : int, _p2captured : int, _p1inPits : int, _p2inPits : int,_winner : String) {
			super(EVENT_NAME);
			mPlayerOneName = _p1name;			mPlayerTwoName = _p2name;			mPlayerOneCaptured = _p1captured;			mPlayerTwoCaptured = _p2captured;			mPlayerOneInPits = _p1inPits;			mPlayerTwoInPits = _p2inPits;			mWinner = _winner;
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new ShowWinTable(mPlayerOneName, mPlayerTwoName, mPlayerOneCaptured, mPlayerTwoCaptured, mPlayerOneInPits, mPlayerTwoInPits, mWinner);
		}

		public function get playerOneName() : String {
			return mPlayerOneName;
		}

		public function get playerTwoName() : String {
			return mPlayerTwoName;
		}

		public function get playerOneCaptured() : int {
			return mPlayerOneCaptured;
		}

		public function get playerTwoCaptured() : int {
			return mPlayerTwoCaptured;
		}

		public function get playerOneInPits() : int {
			return mPlayerOneInPits;
		}

		public function get playerTwoInPits() : int {
			return mPlayerTwoInPits;
		}

		public function get winner() : String {
			return mWinner;
		}
	}
}
