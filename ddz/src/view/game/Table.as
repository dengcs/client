/**Created by the LayaAirIDE*/
package view.game
{
	import common.GameEvent;
	import view.game.super.TableSuper;
	import common.GameConstants;
	import common.StaticFunctions;

	public class Table extends TableSuper
	{
		public function Table() 
		{
			super();
		}
		
		public function onEvent(type:String, data:*=null):void
		{
			if(type == GameEvent.GAME_DEAL_TABLE)
			{
				this.onDealComplete();
			}else if(type == GameEvent.GAME_SNATCH_TABLE)
			{
				this.onShowSnatch();
			}else if(type == GameEvent.GAME_DOUBLE_TABLE)
			{
				this.onShowDouble();
			}else if(type == GameEvent.GAME_PLAY_TABLE)
			{
				this.onShowPlay();
			}else if(type == GameEvent.GAME_POST_CARDS)
			{
				this.onPostCards(data);
			}
		}

		private function onPostCards(data:Array):void
		{
			var msg_data:Object = new Object();
			msg_data.cmd = GameConstants.PLAY_STATE_PLAY;
			msg_data.msg = data;

			StaticFunctions.notify_game_update(msg_data);
		}
	}

}