/**Created by the LayaAirIDE*/
package view.game
{
	import ui.game.TableUI
	import common.GameEvent;
	import game.proto.game_update;
	import game.net.NetClient;
	import common.GameConstants;
	import laya.events.Event;

	public class Table extends TableUI
	{
		private var snatch:int = 0;

		public function Table() 
		{
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
		
		public function onEvent(type:String, data:*=null):void
		{
			if(type == GameEvent.GAME_DEAL_TABLE)
			{
				this.onDealComplete();
			}else if(type == GameEvent.GAME_SNATCH_TABLE)
			{
				this.onShowSnatch();
			}else if(type == GameEvent.GAME_CARDS_TABLE)
			{
				this.onShowCards();
			}else if(type == GameEvent.GAME_DOUBLE_TABLE)
			{
				this.onShowDouble();
			}else if(type == GameEvent.GAME_PLAY_TABLE)
			{
				this.onShowPlay();
			}
		}

		private function onDealComplete():void
		{
			if((++this.snatch) >= 2)
			{
				this.pnlSnatch.visible = true;
			}
		}

		private function onShowSnatch():void
		{
			if((++this.snatch) >= 2)
			{
				this.pnlSnatch.visible = true;
			}
		}

		private function onShowDouble():void
		{
			this.pnlDouble.visible = true;
		}

		private function onShowCards():void
		{
			this.event(GameEvent.GAME_CARDS_TABLE);
		}

		private function onShowPlay():void
		{
			this.pnlPlay.visible = true;
		}

		private function notify_game_update(data:Object):void
		{
			var sendMsg:game_update = new game_update();
			sendMsg.data = JSON.stringify(data);
			NetClient.send("game_update", sendMsg);
		}

		private function onBtnSnatch():void
		{
			this.pnlSnatch.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_SNATCH;
			data.msg = 1;

			this.notify_game_update(data);
		}

		private function onBtnNotSnatch():void
		{
			this.pnlSnatch.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_SNATCH;
			data.msg = 0;

			this.notify_game_update(data);
		}

		private function onBtnDouble():void
		{
			this.pnlDouble.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_DOUBLE;
			data.msg = 1;

			this.notify_game_update(data);
		}

		private function onBtnNotDouble():void
		{
			this.pnlDouble.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_DOUBLE;
			data.msg = 0;

			this.notify_game_update(data);
		}

		private function onBtnPassPlay():void
		{
			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_PLAY;
			data.msg = 0;

			this.notify_game_update(data);
		}		

		private function onBtnPlay():void
		{
			this.event(GameEvent.GAME_PLAY_TABLE, 0);
		}

		private function onBtnPromptPlay():void
		{
			this.event(GameEvent.GAME_PLAY_TABLE, 1);
		}

		private function onBtnCancelPlay():void
		{
			this.event(GameEvent.GAME_PLAY_TABLE, 2);
		}
	}

}