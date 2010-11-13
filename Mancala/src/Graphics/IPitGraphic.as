package Graphics {

	/**
	 * @author Sergei Laada
	 */
	public interface IPitGraphic {
		function enable() : void;
		function disable() : void;

		function addGem(_gemColor : String) : void;

		function removeAllGems() : void;
	}
}
