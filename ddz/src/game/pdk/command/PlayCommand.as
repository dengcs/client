package game.pdk.command
{
	import game.pdk.command.Command;
	import game.pdk.command.Actor;

	/**
	 * ...
	 * @dengcs
	 */
	public class PlayCommand implements Command{
		private var msg:Object;
		
		public function pushMsg(msg:Object):void
		{
			this.msg = msg;
		}

		public function execute(actor:Actor):void
		{
			actor.play(msg);
		}
	}

}