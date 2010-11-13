package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * send this event when there is a need to add additional gem to pit
	 */
	public class AddGemToPit extends Event {

		//Event name, is used to create a new event instance
		public static const EVENT_NAME : String = "AddGemToPit";
		//gem color
		private var mColor : String;
		//gem id		private var mID : int;

		/**
		 * @param _id pit id where new gem will be added
		 * @param _color gem color
		 */
		public function AddGemToPit(_id : int, _color : String) {
			super(EVENT_NAME);
			mColor = _color;			mID = _id;
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new AddGemToPit(mID, mColor);
		}

		public function get id() : int {
			return mID;
		}

		public function get color() : String {
			return mColor;
		}
	}
}
