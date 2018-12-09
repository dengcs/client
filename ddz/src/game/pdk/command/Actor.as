package game.pdk.command
{
	import game.net.NetClient;
	import game.proto.game_update;
	import common.GameConstants;
	import game.pdk.command.Actor;
	import view.game.Game;
	import game.manager.ViewManager;
	import common.GameEvent;

	/**
	 * ...
	 * @dengcs
	 */
	public class Actor{

		private var game:Game = null;

		public function Actor()
		{
			game = ViewManager.getInstance().game;
		}

		private function notify_game_update(data:Object):void
		{
			var sendMsg:game_update = new game_update();
			sendMsg.data = JSON.stringify(data);
			NetClient.send("game_update", sendMsg);
		}
		
		public function deal(msg:Object):void
		{
			game.onPokerEvent(GameEvent.GAME_DEAL_POKER, msg);
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
			game.onPokerEvent(GameEvent.GAME_CARDS_POKER, msg);
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
				game.onPokerEvent(GameEvent.GAME_PLAY_POKER);
			}else
			{
				// 广播，表现效果
				trace("play", msg)
			}
		}

		public function over(msg:Object):void
		{
			
		}
	}

}