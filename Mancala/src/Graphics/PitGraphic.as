package Graphics {
	import Graphics.Stones.BlueGem;
	import Graphics.Stones.GreenGem;
	import Graphics.Stones.IGemGraphic;
	import Graphics.Stones.RedGem;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Sergei Laada
	 * Class that holds information about the pit graphics
	 */
	public class PitGraphic extends MovieClip implements IPitGraphic {

		//Function that will be executed when mouse is pressed on pit
		private var mCompleteFunction : Function;
		//Message with gem counter information		private var mPopUpMessage : PopUpMessage;
		//How many gems are in pit, used only to show information when mouse is over the pit		private var mGemCounter : int;
		//pit id		private var mPitID : int;
		//Vector with gem instances in pit		private var mGems : Vector.<MovieClip>;

		/**
		 * @param _id id of the pit
		 * @param _x x coordinate of the pit
		 * @param _y y coordinate of the pit
		 * @param _completeFunction function that will be executed when mouse is pressed on pit
		 */
		public function PitGraphic(_x : int, _y : int, _completeFunction : Function, _id : int) {
			x = _x;
			y = _y;
			mPitID = _id;
			mouseChildren = false;
			enable();
			mGems = new Vector.<MovieClip>();
			mCompleteFunction = _completeFunction;
			mPopUpMessage = new PopUpMessage();
			addChild(mPopUpMessage);
			//position message
			mPopUpMessage.move(width - 10, -25);
			mPopUpMessage.visible = false;
			//add mouse listeners
			addEventListener(MouseEvent.MOUSE_OVER, onOver);			addEventListener(MouseEvent.MOUSE_OUT, onOut);
		}

		/**
		 * Function that will be executed when mouse is pressed on pit
		 */
		private function onClick(event : MouseEvent) : void {
			if(mGemCounter == 0) return;//check if there is a gem in pit
			mCompleteFunction(mPitID);//execute defined function, for now it is function from GameController
		}

		/**
		 * Function that will be executed when mouse is over the pit
		 */
		private function onOver(event : MouseEvent) : void {
			//update gem counter information in message label
			mPopUpMessage.text = mGemCounter.toString();
			mPopUpMessage.visible = true;
		}

		/**
		 * Function that will be executed when mouse goes out of the pit
		 */
		private function onOut(event : MouseEvent) : void {
			mPopUpMessage.visible = false;
		}

		/**
		 * Update gem information in pop up message
		 */
		private function updateGemsText() : void {
			if(mPopUpMessage.visible) mPopUpMessage.text = mGemCounter.toString();
		}

		/**
		 * Enable the pit
		 */
		public function enable() : void {
			buttonMode = true;
			addEventListener(MouseEvent.CLICK, onClick);
		}

		/**
		 * Disable the pit
		 */
		public function disable() : void {
			buttonMode = false;
			removeEventListener(MouseEvent.CLICK, onClick);
		}

		/**
		 * Add new gem to the pit
		 * @param _gemColor gem color
		 */
		public function addGem(_gemColor : String) : void {
			var gem : IGemGraphic = getGemByColor(_gemColor);
			//randomize gem position
			MovieClip(gem).x = Math.random() * 25 + 5;
			MovieClip(gem).y = Math.random() * 25 + 5;
			addChild(MovieClip(gem));
			mGems.push(gem);
			//increase gem counter
			mGemCounter++;
			updateGemsText();
		}

		/**
		 * Decide thich gem type have to be added, for now there is 3 gem types: Blue, Green, Red
		 * @param _color color of the gem
		 */
		private function getGemByColor(_color : String) : IGemGraphic {
			switch(_color) {
				case "Blue":
					return new BlueGem();
					break;
				case "Red":
					return new RedGem();
					break;
				case "Green":
					return new GreenGem();
					break;
			}
			throw new Error("Wrong gem color");
		}

		/**
		 * Remove all gems from the pit
		 */
		public function removeAllGems() : void {
			var i : MovieClip;
			for each (i in mGems) {
				removeChild(i);
			}
			mGems = new Vector.<MovieClip>();
			mGemCounter = 0;
			updateGemsText();
		}

		/**
		 * Get pit id
		 */
		public function get pitID() : int {
			return mPitID;
		}
	}
}
