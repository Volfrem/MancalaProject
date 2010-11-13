package {
	import Graphics.IPitGraphic;
	import Graphics.PitGraphic;

	import flash.utils.Dictionary;

	/**
	 * @author Sergei Laada
	 */
	public class GameState {

		private var mPlayerOnePits : Dictionary;
		private var mPlayerTwoPits : Dictionary;
		private var mActivePlayer : int;

		public function GameState() {
			mPlayerOnePits = new Dictionary();			mPlayerTwoPits = new Dictionary();
		}

		public function initializeState() : void {
			var i : IPitGraphic;
			for each (i in mPlayerOnePits) {
				i.disable();
			}
			
			for each (i in mPlayerTwoPits) {
				i.disable();
			}
			mActivePlayer = 0;
		}

		public function addPlayerOnePit(_pit : PitGraphic,_id : int) : void {
			mPlayerOnePits[_id] = _pit;
		}

		public function addPlayerTwoPit(_pit : PitGraphic,_id : int) : void {
			mPlayerTwoPits[_id] = _pit;
		}

		public function sameTurn() : void {
			var pits : Dictionary = getActivePits(mActivePlayer);
			var i : IPitGraphic;
			for each (i in pits) {
				i.enable();
			}
		}

		public function nextTurn() : void {
			switchPlayer(mActivePlayer);
			var pits : Dictionary = getActivePits(mActivePlayer);
			var i : IPitGraphic;
			for each (i in pits) {
				i.enable();
			}
		}

		public function animationInProgress() : void {
			var pits : Dictionary = getActivePits(mActivePlayer);
			var i : IPitGraphic;
			for each (i in pits) {
				i.disable();
			}
		}

		private function switchPlayer(_activePlayer : int) : void {
			switch(_activePlayer) {
				case 0:
					mActivePlayer = 1;
					break;
				case 1:
					mActivePlayer = 0;
					break;
			}
		}

		private function getActivePits(_activePlayer : int) : Dictionary {
			switch(_activePlayer) {
				case 0:
					return mPlayerOnePits;
					break;
				case 1:
					return mPlayerTwoPits;
					break;
			}
			throw new Error("Wrong player id");
		}

		public function get activePlayer() : int {
			return mActivePlayer;
		}
	}
}
