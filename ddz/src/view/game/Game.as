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
			this.minePoker.on(GameEvent.GAME_DEAL_POKER, this, onDealFromPoker);

			this.mineTable = new Table();
			this.addChild(mineTable);
			this.mineTable.on(GameEvent.GAME_PLAY_TABLE, this, onPlayFromTable);
			this.mineTable.on(GameEvent.GAME_CARDS_TABLE, this, onCardsFromTable);
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

		private function onDealFromPoker():void
		{
			this.onTableEvent(GameEvent.GAME_DEAL_TABLE);
		}

		private function onPlayFromTable(type:int):void
		{
			this.onPokerEvent(GameEvent.GAME_PLAY_POKER, type);
		}

		private function onCardsFromTable():void
		{
			this.onPokerEvent(GameEvent.GAME_CARDS_POKER);
		}
	}

}