package Graphics {
	import Graphics.Labels.WinTableLabel;

	import flash.display.MovieClip;

	/**
	 * @author Sergei Laada
	 * Class that holds information about the table with game results
	 */
	public class WinTable extends MovieClip {

		//Label with information about gems in player one pits
		private var mPlayerOneInPits : WinTableLabel;
		//Label with information about gems in player two pits		private var mPlayerTwoInPits : WinTableLabel;
		//Label with information about gems in player one mancala		private var mPlayerOneCaptured : WinTableLabel;
		//Label with information about gems in player two mancala		private var mPlayerTwoCaptured : WinTableLabel;
		//player one label		private var mPlayerOne : WinTableLabel;
		//player two label		private var mPlayerTwo : WinTableLabel;
		//player one total gems		private var mPlayerOneTotal : WinTableLabel;
		//player two total gems		private var mPlayerTwoTotal : WinTableLabel;
		//"Player" label		private var mPlayer : WinTableLabel;
		//"In pits" label
		private var mInPits : WinTableLabel;
		//"Captured" label		private var mCaptured : WinTableLabel;		private var mTotal : WinTableLabel;
		//Winner label		private var mWinner : WinTableLabel;

		public function WinTable() {
			initializeScreen();
		}

		/**
		 * Initialize screen objects
		 */
		private function initializeScreen() : void {
			mPlayer = new WinTableLabel(250, 155);
			mPlayer.text = "Player";
			addChild(mPlayer);
			mPlayerOne = new WinTableLabel(360, 155);
			addChild(mPlayerOne);
			mPlayerTwo = new WinTableLabel(455, 155);
			addChild(mPlayerTwo);
			mInPits = new WinTableLabel(250, 195);
			mInPits.text = "In pits";
			addChild(mInPits);
			mCaptured = new WinTableLabel(250, 232);
			mCaptured.text = "Captured";
			addChild(mCaptured);
			mTotal = new WinTableLabel(250, 272);
			mTotal.text = "Total";
			addChild(mTotal);
			
			mPlayerOneInPits = new WinTableLabel(380, 198);
			addChild(mPlayerOneInPits);
			mPlayerTwoInPits = new WinTableLabel(480, 198);
			addChild(mPlayerTwoInPits);
			
			mPlayerOneCaptured = new WinTableLabel(380, 234);
			addChild(mPlayerOneCaptured);
			mPlayerTwoCaptured = new WinTableLabel(480, 234);
			addChild(mPlayerTwoCaptured);
			
			mPlayerOneTotal = new WinTableLabel(380, 270);
			addChild(mPlayerOneTotal);
			mPlayerTwoTotal = new WinTableLabel(480, 270);
			addChild(mPlayerTwoTotal);
			
			mWinner = new WinTableLabel(300, 315);
			addChild(mWinner);
		}

		/**
		 * Fill all the information in the table
		 * @param p1 player one name
		 * @param p1cap player one captured gems
		 * @param p1pit player one in pits gems
		 * @param p2 player two name
		 * @param p2cap player two captured gems
		 * @param p2pit player two in pits gems
		 * @param winner game winner
		 */
		public function fillWinTable(p1 : String,p2 : String,p1cap : int,p2cap : int,p1pit : int,p2pit : int,winner : String) : void {
			mPlayerOne.text = p1;
			mPlayerTwo.text = p2;
			mPlayerOneInPits.text = p1pit.toString();
			mPlayerTwoInPits.text = p2pit.toString();
			mPlayerOneCaptured.text = p1cap.toString();
			mPlayerTwoCaptured.text = p2cap.toString();
			mPlayerOneTotal.text = (p1pit + p1cap).toString();
			mPlayerTwoTotal.text = (p2pit + p2cap).toString();
			if(winner) mWinner.text = winner + " won this game";//if winner isn`t set then it was a draw
			else mWinner.text = "It is a draw";
		}
	}
}
