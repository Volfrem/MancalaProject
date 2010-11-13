package {

	/**
	 * @author Sergei Laada
	 */
	public interface IPit {

		function set nextPit(_pit : IPit) : void;

		function update(_gems : Vector.<Gem>) : void;

		function pitSelected() : void;

		function gemCount() : int;

		function get id() : int;

		function initializeGems(_gems : int, _gemColors : Vector.<String>) : void;

		function collectGems() : Vector.<Gem>;
	}
}
