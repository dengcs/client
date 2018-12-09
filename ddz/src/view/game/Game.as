/**Created by the LayaAirIDE*/
package view.game
{
	import ui.game.GameUI
	import laya.events.Event;
	import view.game.Poker;
	import common.GameEvent;
	import game.net.NetClient;

	public class Game extends GameUI
	{
		private var minePoker:Poker;
		public function Game() 
		{
			this.visible = false;
			this.minePoker = new Poker();
			this.on(Event.ADDED, this, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void
		{
			this.off(Event.ADDED, this, onAddedToStage);			
			this.addChild(minePoker);
			NetClient.handshake();
		}

		public function show():void
		{
			this.visible = true;
			this.minePoker.show();
		}

		public function hide():void
		{
			this.visible = false;
			this.minePoker.hide();
		}

		public function onPokerEvent(type:String, data:*=null):void
		{
			if(type == GameEvent.GAME_DEAL_POKER)
			{
				this.minePoker.onDealPoker(data);
			}
		}
	}

}