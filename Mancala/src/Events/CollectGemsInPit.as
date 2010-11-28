package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * send this event when there is a need to get all the gems from some pit
	 */
	public class CollectGemsInPit extends Event {

		//Event name
		public static const EVENT_NAME : String = "CollectGemsInPit";
		//Pit id

		/**
		 * @param _id pit id where gems have to be collected
		 */
		public function CollectGemsInPit(_id : int) {
			super(EVENT_NAME);
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new CollectGemsInPit(mID);
		}

		public function get id() : int {
			return mID;
		}
	}
}