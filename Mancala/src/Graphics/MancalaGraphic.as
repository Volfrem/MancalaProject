package Graphics {
	import Graphics.Stones.BlueGem;
	import Graphics.Stones.GreenGem;
	import Graphics.Stones.IGemGraphic;
	import Graphics.Stones.RedGem;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Sergei Laada
	 * Class that holds information about mancala graphics
	 */
	public class MancalaGraphic extends MovieClip implements IPitGraphic {
		//message that will be shown when mouse is over the mncala
		private var mPopUpMessage : PopUpMessage;
		//counter that holds information about gems in mancala, used only to show it when mouse is over mancala
		private var mGemCounter : int = 0;
		//mancala id
		private var mMancalaID : int;
		//Vector with gems graphic objects that are in mancala
		private var mGems : Vector.<MovieClip>;

		/**
		 * @param _id id of the mancala
		 * @param _x x position of the mancala
		 * @param _y y position of the mancala
		 */
		public function MancalaGraphic(_x : int, _y : int, _id : int) {
			x = _x;
			y = _y;
			mMancalaID = _id;
			mPopUpMessage = new PopUpMessage();
			addChild(mPopUpMessage);
			mGems = new Vector.<MovieClip>();
			//position pop up message
			mPopUpMessage.move(width - 10, -25);
			mPopUpMessage.visible = false;
			//add mouse listeners
			addEventListener(MouseEvent.MOUSE_OVER, onOver);
			addEventListener(MouseEvent.MOUSE_OUT, onOut);
		}

		/**
		 * Enable mancala, isn`t used because mancala is all the time disabled
		 */
		public function enable() : void {
		}

		/**
		 * Disable mancala, isn`t used because mancala is all the time disabled
		 */
		public function disable() : void {
		}

		/**
		 * Function that will be executed when mouse is over the mancala
		 */
		private function onOver(event : MouseEvent) : void {
			//Update information about the gems
			mPopUpMessage.text = mGemCounter.toString();
			mPopUpMessage.visible = true;
		}

		/**
		 * Function that will be executed when mouse goes out of the mancala
		 */
		private function onOut(event : MouseEvent) : void {
			mPopUpMessage.visible = false;
		}

		/**
		 * Add new gem to the mancala
		 * @param _gemColor color of the gem
		 */
		public function addGem(_gemColor : String) : void {
			var gem : IGemGraphic = getGemByColor(_gemColor);
			//randomize position of the gem
			MovieClip(gem).x = Math.random() * 30 + 5;			MovieClip(gem).y = Math.random() * 70 + 18;
			addChild(MovieClip(gem));
			//add gem to the list
			mGems.push(gem);
			//increment gem counter
			mGemCounter++;
		}

		/**
		 * Decide what gem instance have to be added, for now there is 3 gem types: Blue, Green, Red
		 * @param _color color of the new gem
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
		 * Remove all gems from mancala
		 */
		public function removeAllGems() : void {
			var i : MovieClip;
			for each (i in mGems) {
				removeChild(i);
			}
			mGems = new Vector.<MovieClip>();
			mGemCounter = 0;
		}

		/**
		 * Get mancala id
		 */
		public function get mancalaID() : int {
			return mMancalaID;
		}
	}
}
