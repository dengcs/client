package common
{
	import game.proto.game_update;
	import game.net.NetClient;

	/**
	 * ...
	 * @dengcs
	 */
	public class StaticFunctions{
		public static function compareObjDes(a:Object, b:Object):Number
		{
			if(a.value < b.value)
			{
				return 1;
			}
			return -1;
		}

		public static function compareIntAsc(x:int, y:int):Number
		{
			if(x > y)
			{
				return 1;
			}
			return -1;
		}

		public static function notify_game_update(data:Object):void
		{
			var sendMsg:game_update = new game_update();
			sendMsg.data = JSON.stringify(data);
			NetClient.send("game_update", sendMsg);
		}
	}

}