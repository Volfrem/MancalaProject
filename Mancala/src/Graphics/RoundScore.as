package Graphics {
	import Graphics.Labels.WinTableLabel;

	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 */
	public class RoundScore extends MovieClip {

		private var mRoundsLabel : WinTableLabel;

		public function RoundScore(_x : int,_y : int) {
			x = _x;
			y = _y;
			initialize();
		}

		private function initialize() : void {
			mRoundsLabel = new WinTableLabel(0, 0);
			mRoundsLabel.text = "Rounds";
			mRoundsNumLabel = new WinTableLabel(20, 50);

			mScoreIsSet = 0;
			addChild(mRoundsLabel);
		}

		public function setScore(_p1name : String,_p2name : String,_rounds : int,_p1score : int,_p2score : int) : void {
			mPlayerOneLabel.text = _p1name;
			mPlayerOneWonLabel.text = _p1score.toString();
			mScoreIsSet = 1;
		}

		public function get scoreIsSet() : int {
			return mScoreIsSet;
		}
	}
}