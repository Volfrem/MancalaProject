package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * send this event when there is a need to disable player two pits
	 */
	public class DisablePlayerTwoPits extends Event {

		//Event name
		public static const EVENT_NAME : String = "DisablePlayerTwoPits";

		public function DisablePlayerTwoPits() {
			super(EVENT_NAME);
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new DisablePlayerTwoPits();
		}
	}
}
