package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * send this event when there is a need to disable player one pits
	 */
	public class DisablePlayerOnePits extends Event {

		//Event name
		public static const EVENT_NAME : String = "DisablePlayerOnePits";

		public function DisablePlayerOnePits() {
			super(EVENT_NAME);
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new DisablePlayerOnePits();
		}
	}
}
