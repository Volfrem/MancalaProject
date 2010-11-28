package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * send this event when there is a need to switch player, next player gets its turn
	 */
	public class NextTurn extends Event {

		//Event name
		public static const EVENT_NAME : String = "NextTurn";
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
		public function NextTurn(_p1captured : int, _p2captured : int, _p1inPits : int, _p2inPits : int) {
			super(EVENT_NAME);
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new NextTurn(mPlayerOneCaptured, mPlayerTwoCaptured, mPlayerOneInPits, mPlayerTwoInPits);
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