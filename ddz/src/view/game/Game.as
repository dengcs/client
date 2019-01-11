/**Created by the LayaAirIDE*/
package view.game
{
	import ui.game.GameUI
	import laya.events.Event;
	import view.game.Poker;
	import common.GameEvent;
	import view.game.Table;

	public class Game extends GameUI
	{
		private var minePoker:Poker;
		private var mineTable:Table;
		public function Game() 
		{
			this.visible = false;
			this.on(Event.ADDED, this, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void
		{
			this.off(Event.ADDED, this, onAddedToStage);
			
			this.minePoker = new Poker();
			this.addChild(minePoker);
			this.minePoker.on(GameEvent.EVENT_TO_TABLE, this, onEventToTable);

			this.mineTable = new Table();
			this.addChild(mineTable);
			this.mineTable.on(GameEvent.EVENT_TO_POKER, this, onEventToPoker);
		}

		public function show():void
		{
			this.visible = true;
			this.minePoker.show();
			this.mineTable.show();
		}

		public function hide():void
		{
			this.visible = false;
			this.minePoker.hide();
			this.mineTable.hide();
		}

		public function onPokerEvent(type:String, data:*=null):void
		{
			this.minePoker.onEvent(type, data);
		}

		public function onTableEvent(type:String, data:*=null):void
		{
			this.mineTable.onEvent(type, data);
		}

		private function onEventToTable(msg:Object):void
		{
			this.onTableEvent(msg.type, msg.data);
		}

		private function onEventToPoker(msg:Object):void
		{
			this.onPokerEvent(msg.type, msg.data);
		}
	}

}