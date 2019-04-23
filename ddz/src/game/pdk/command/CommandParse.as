package game.pdk.command
{
	import common.GameConstants;
	import game.pdk.command.Actor;

	/**
	 * ...
	 * @dengcs
	 */
	public class CommandParse{
		private static  var _instance:CommandParse = new CommandParse();

		private var actor:Actor = new Actor();

		public function CommandParse(){
			if (_instance != null) {
                 throw new Error("只能用getInstance()来获取实例!");
             }
		}

		public static function getInstance():CommandParse
		{
            return _instance;
		}

		public function parse(data:String):void
		{			
			var cmdObj:Object = JSON.parse(data);
			switch(cmdObj.cmd)
			{
				case GameConstants.PLAY_STATE_PREPARE:
				{
					actor.prepare(cmdObj.msg);
					break;
				}
				case GameConstants.PLAY_STATE_DEAL:
				{
					actor.deal(cmdObj.msg);
					break;
				}
				case GameConstants.PLAY_STATE_SNATCH:
				{
					actor.snatch(cmdObj.msg);
					break;
				}
				case GameConstants.PLAY_STATE_CARDS:
				{
					actor.cards(cmdObj.msg);					
					break;
				}
				case GameConstants.PLAY_STATE_DOUBLE:
				{
					actor.double(cmdObj.msg);
					break;
				}
				case GameConstants.PLAY_STATE_PLAY:
				{
					actor.play(cmdObj.msg);
					break;
				}
				case GameConstants.PLAY_STATE_OVER:
				{
					actor.over(cmdObj.msg);
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