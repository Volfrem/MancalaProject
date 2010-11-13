package {
	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * @author Sergei Laada
	 * Class to initialize the application, it is the base class for fla file
	 */
	public class Initializer extends MovieClip {

		public function Initializer() {
			//initializeApplication will be executed when this movieclip is added to stage
			addEventListener(Event.ADDED_TO_STAGE, initializeApplication);
		}

		private function initializeApplication(event : Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, initializeApplication);
			//initialize model, view, controller
			GameController.initialize();			new GameView(this.stage);			GameModel.initialize();
		}
	}
}
