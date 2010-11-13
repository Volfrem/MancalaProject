package Events {
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * send this event when animating gems
	 */
	public class AnimationInProgress extends Event {

		//Event name
		public static const EVENT_NAME : String = "AnimationInProgress";

		public function AnimationInProgress() {
			super(EVENT_NAME);
		}

		//always override clone method in custom events
		public override function clone() : Event {
			return new AnimationInProgress();
		}
	}
}
