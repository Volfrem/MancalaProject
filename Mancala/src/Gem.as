package {

	/**
	 * @author Sergei Laada
	 * Class for gem
	 */
	public class Gem {

		//gem color
		private var mColor : String;

		public function Gem(_color : String) {
			mColor = _color;
		}

		public function get color() : String {
			return mColor;
		}
	}
}
