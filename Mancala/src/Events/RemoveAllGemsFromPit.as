package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * send this event when there is a need to remove all gems from some pit
	 */
	public class RemoveAllGemsFromPit extends Event {

		//Event name
		public static const EVENT_NAME : String = "RemoveAllGemsFromPit";
		//Pit id		private var mID : int;

		/**
		 * @param _id pit id
		 */
		public function RemoveAllGemsFromPit(_id : int) {
			super(EVENT_NAME);			mID = _id;
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new RemoveAllGemsFromPit(mID);
		}

		public function get id() : int {
			return mID;
		}
	}
}
