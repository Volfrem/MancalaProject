package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * 
	 */
	public class UpdateScore extends Event {

		//Event name
		public static const EVENT_NAME : String = "UpdateScore";

		private var mRounds : int;		private var mPlayerOneWon : int;		private var mPlayerTwoWon : int;		private var mPlayerOneName : String;		private var mPlayerTwoName : String;

		public function UpdateScore(_rounds : int, _p1won : int, _p2won : int, _p1name : String, p2name : String) {
			super(EVENT_NAME);
			mRounds = _rounds;			mPlayerOneWon = _p1won;			mPlayerTwoWon = _p2won;
			mPlayerOneName = _p1name;			mPlayerTwoName = p2name;
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new UpdateScore(mRounds, mPlayerOneWon, mPlayerTwoWon, mPlayerOneName, mPlayerTwoName);
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

		public function get playerOneName() : String {
			return mPlayerOneName;
		}

		public function get playerTwoName() : String {
			return mPlayerTwoName;
		}
	}
}
