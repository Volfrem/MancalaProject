package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * send this event when there is no need to switch players, same player gets additional turn
	 */
	public class SameTurn extends Event {

		//Event name
		public static const EVENT_NAME : String = "SameTurn";
		//Number of captured gems by first player
		//Number of captured gems by second player
		//Number of gems in first player pits
		//Number of gems in second player pits

		/**
		 * @param _p1captured Number of captured gems by first player
		 * @param _p2captured Number of captured gems by second player
		 * @param _p1inPits Number of gems in first player pits
		 * @param _p2inPits Number of gems in second player pits
		 */
		public function SameTurn(_p1captured : int, _p2captured : int, _p1inPits : int, _p2inPits : int) {
			super(EVENT_NAME);
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new SameTurn(mPlayerOneCaptured, mPlayerTwoCaptured, mPlayerOneInPits, mPlayerTwoInPits);
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
	}
}