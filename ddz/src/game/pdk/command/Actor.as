package game.pdk.command
{
	import game.net.NetClient;
	import game.proto.game_update;
	import common.GameConstants;

	/**
	 * ...
	 * @dengcs
	 */
	public class Actor{

		private function notify_game_update(data:Object):void
		{
			var sendMsg:game_update = new game_update();
			sendMsg.data = JSON.stringify(data);
			NetClient.send("game_update", sendMsg);
		}
		
		public function deal(msg:Object):void
		{

		}

		public function snatch(msg:Object):void
		{
			if(msg == null)
			{
				// 命令处理
				var data:Object = new Object();
				data.cmd = GameConstants.PLAY_STATE_SNATCH;
				data.msg = Math.ceil(Math.random() * 2);

				notify_game_update(data);
			}else
			{
				// 广播，表现效果
			}
		}

		public function get_cards(msg:Object):void
		{
			
		}
		
		public function double(msg:Object):void
		{
			if(msg == null)
			{
				// 命令处理
				var data:Object = new Object();
				data.cmd = GameConstants.PLAY_STATE_DOUBLE;
				data.msg = Math.ceil(Math.random() * 2);

				notify_game_update(data);
			}else
			{
				// 广播，表现效果
			}
		}

		public function play(msg:Object):void
		{
			if(msg == null)
			{
				// 命令处理
				var data:Object = new Object();
				data.cmd = GameConstants.PLAY_STATE_PLAY;

				notify_game_update(data);
			}else
			{
				// 广播，表现效果
			}
		}

		public function over(msg:Object):void
		{
			
		}
	}

}