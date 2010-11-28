package Graphics {
	import Graphics.Labels.WinTableLabel;

	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 */
	public class RoundScore extends MovieClip {

		private var mRoundsLabel : WinTableLabel;		private var mRoundsNumLabel : WinTableLabel;		private var mPlayerOneLabel : WinTableLabel;		private var mPlayerTwoLabel : WinTableLabel;		private var mPlayerOneWonLabel : WinTableLabel;		private var mPlayerTwoWonLabel : WinTableLabel;		private var mScoreIsSet : int;

		public function RoundScore(_x : int,_y : int) {
			x = _x;
			y = _y;
			initialize();
		}

		private function initialize() : void {
			mRoundsLabel = new WinTableLabel(0, 0);
			mRoundsLabel.text = "Rounds";
			mRoundsNumLabel = new WinTableLabel(20, 50);			mPlayerOneLabel = new WinTableLabel(150, 0);			mPlayerTwoLabel = new WinTableLabel(300, 0);			mPlayerOneWonLabel = new WinTableLabel(180, 50);			mPlayerTwoWonLabel = new WinTableLabel(330, 50);

			mScoreIsSet = 0;
			addChild(mRoundsLabel);			addChild(mRoundsNumLabel);			addChild(mPlayerOneLabel);			addChild(mPlayerTwoLabel);			addChild(mPlayerOneWonLabel);			addChild(mPlayerTwoWonLabel);
		}

		public function setScore(_p1name : String,_p2name : String,_rounds : int,_p1score : int,_p2score : int) : void {
			mPlayerOneLabel.text = _p1name;			mPlayerTwoLabel.text = _p2name;
			mPlayerOneWonLabel.text = _p1score.toString();			mPlayerTwoWonLabel.text = _p2score.toString();			mRoundsNumLabel.text = _rounds.toString();
			mScoreIsSet = 1;
		}

		public function get scoreIsSet() : int {
			return mScoreIsSet;
		}
	}
}
