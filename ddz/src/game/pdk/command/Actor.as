package game.pdk.command
{
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
		
		public function deal(msg:Object):void
		{
			game.onPokerEvent(GameEvent.GAME_DEAL_POKER, msg);
		}

		public function snatch(msg:Object):void
		{
			if(msg == null)
			{
				game.onTableEvent(GameEvent.GAME_SNATCH_TABLE);				
			}else
			{
				// 广播，表现效果
			}
		}

		public function cards(msg:Object):void
		{
			if(msg == null)
			{
				game.onTableEvent(GameEvent.GAME_CARDS_TABLE);
			}else{
				game.onPokerEvent(GameEvent.GAME_CARDS_POKER, msg);
			}
		}
		
		public function double(msg:Object):void
		{
			if(msg == null)
			{
				game.onTableEvent(GameEvent.GAME_DOUBLE_TABLE);	
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
				game.onTableEvent(GameEvent.GAME_PLAY_TABLE);
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