package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * send this event when there is a need to show startup screen, exit button is pressed
	 */
	public class ExitGame extends Event {

		//Event name
		public static const EVENT_NAME : String = "ExitGame";

		public function ExitGame() {
			super(EVENT_NAME);
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new ExitGame();
		}
	}
}
