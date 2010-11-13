package Events {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author Sergei Laada
	 * class with static functions and variables to handle global events
	 */
	public class EventHandler extends MovieClip {

		protected static var mEventDispatcher : EventDispatcher;

		/**
		 * @param eventHandler function that will be executed when event is received
		 * @param eventName name of the event, static variable from the event
		 */
		public static function addEventSubscription(eventName : String, eventHandler : Function) : void {
			if (mEventDispatcher == null) { 
				mEventDispatcher = new EventDispatcher(); 
			}
			mEventDispatcher.addEventListener(eventName, eventHandler);
		}

		/**
		 * @param eventHandler function that will be executed when event is received
		 * @param eventName name of the event, static variable from the event
		 */
		public static function removeEventSubscription(eventName : String, eventHandler : Function) : void {
			if (mEventDispatcher == null) { 
				return; 
			}
			mEventDispatcher.removeEventListener(eventName, eventHandler);
		}

		/**
		 * @param event event instance, like: new SomeEventClass()
		 */
		public static function dispatchGlobalEvent(event : Event) : void {
			if (mEventDispatcher == null) { 
				return; 
			}
			mEventDispatcher.dispatchEvent(event);
		}
	}
}
