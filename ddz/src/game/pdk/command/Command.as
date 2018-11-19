package game.pdk.command
{
	import game.pdk.command.Actor;

	/**
	 * ...
	 * @dengcs
	 */
	public interface Command{
		function execute(actor:Actor):void;
		function pushMsg(msg:Object):void;
	}

}