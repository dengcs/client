package view.game.super
{
	import ui.game.TableUI;
	import laya.events.Event;
	import common.GameEvent;
	import game.proto.game_update;
	import game.net.NetClient;
	import common.GameConstants;
	import common.StaticFunctions;

	/**
	 * ...
	 * @dengcs
	 */
	public class TableSuper extends TableUI
	{		
		private var snatch:int = 0;

		public function TableSuper(){
			this.visible = false;
			this.pnlSnatch.visible = false;
			this.pnlDouble.visible = false;
			this.pnlPlay.visible = false;
			this.btnSnatchYes.on(Event.CLICK, this, onBtnSnatch);
			this.btnSnatchNo.on(Event.CLICK, this, onBtnNotSnatch);
			this.btnDoubleYes.on(Event.CLICK, this, onBtnDouble);
			this.btnDoubleNo.on(Event.CLICK, this, onBtnNotDouble);
			this.btnPlayYes.on(Event.CLICK, this, onBtnPlay);
			this.btnPlayPrompt.on(Event.CLICK, this, onBtnPromptPlay);
			this.btnPlayCancel.on(Event.CLICK, this, onBtnCancelPlay);
		}

		public function show():void
		{			
			this.visible = true;
			this.snatch = 0;
		}

		public function hide():void
		{
			this.visible = false;
		}

		public function onDealComplete():void
		{
			if((++this.snatch) >= 2)
			{
				this.pnlSnatch.visible = true;
			}
		}

		public function onShowSnatch():void
		{
			if((++this.snatch) >= 2)
			{
				this.pnlSnatch.visible = true;
			}
		}

		public function onShowDouble():void
		{
			this.pnlDouble.visible = true;
		}

		public function onShowPlay():void
		{
			this.pnlPlay.visible = true;
		}

		private function onBtnSnatch():void
		{
			this.pnlSnatch.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_SNATCH;
			data.msg = 1;

			StaticFunctions.notify_game_update(data);
		}

		private function onBtnNotSnatch():void
		{
			this.pnlSnatch.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_SNATCH;

			StaticFunctions.notify_game_update(data);
		}

		private function onBtnDouble():void
		{
			this.pnlDouble.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_DOUBLE;
			data.msg = 1;

			StaticFunctions.notify_game_update(data);
		}

		private function onBtnNotDouble():void
		{
			this.pnlDouble.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_DOUBLE;

			StaticFunctions.notify_game_update(data);
		}

		private function onBtnCancelPlay():void
		{
			this.pnlPlay.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_PLAY;

			StaticFunctions.notify_game_update(data);
		}		

		private function onBtnPlay():void
		{
			var ev_data:Object = new Object();
			ev_data.type = GameEvent.GAME_PLAY_POKER;
			ev_data.data = 1;

			this.event(GameEvent.GAME_TABLE_POKER, ev_data);
		}

		private function onBtnPromptPlay():void
		{
			var ev_data:Object = new Object();
			ev_data.type = GameEvent.GAME_PLAY_POKER;
			ev_data.data = 2;

			this.event(GameEvent.GAME_TABLE_POKER, ev_data);
		}
	}

}