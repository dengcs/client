package game.pdk.command
{
	import common.GameConstants;
	import game.pdk.command.DoubleCommand;
	import game.pdk.command.PlayCommand;
	import game.pdk.command.SnatchCommand;
	import game.pdk.command.Actor;
	import game.pdk.command.Command;

	/**
	 * ...
	 * @dengcs
	 */
	public class CommandParse{
		private static  var _instance:CommandParse = null;

		private var doubleCommand:DoubleCommand = new DoubleCommand();
		private var playCommand:PlayCommand = new PlayCommand();
		private var snatchCommand:SnatchCommand = new SnatchCommand();

		private var actor:Actor = new Actor();

		public function CommandParse(){
			if (_instance != null) {
                 throw new Error("只能用getInstance()来获取实例!");
             }
		}

		public static function getInstance():CommandParse
		{
			if (_instance == null) {
                _instance = new CommandParse();
            }
            return _instance;
		}

		private function execute(cmd:Command, msg:Object):void
		{
			cmd.pushMsg(msg);
			cmd.execute(actor);
		}

		public function parse(data:String):void
		{			
			var cmdObj:Object = JSON.parse(data);
			switch(cmdObj.cmd)
			{
				case GameConstants.PLAY_STATE_DEAL:
				{
					break;
				}
				case GameConstants.PLAY_STATE_SNATCH:
				{
					execute(snatchCommand, cmdObj.msg);
					break;
				}
				case GameConstants.PLAY_GET_CARDS:
				{					
					break;
				}
				case GameConstants.PLAY_STATE_DOUBLE:
				{
					execute(doubleCommand, cmdObj.msg);
					break;
				}
				case GameConstants.PLAY_STATE_PLAY:
				{
					execute(playCommand, cmdObj.msg);
					break;
				}
				case GameConstants.PLAY_STATE_OVER:
				{
					break;
				}				
				default:
				{
					trace("error-----------error")
					break;
				}
			}
		}
	}

}