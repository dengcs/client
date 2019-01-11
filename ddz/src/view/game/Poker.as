/**Created by the LayaAirIDE*/
package view.game
{
	import common.GameEvent;
	import view.game.super.PokerSuper;
	import laya.ui.Box;
	import laya.utils.Handler;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import common.GameConstants;
	import common.GameFunctions;
	import common.GamePropertys;

	public class Poker extends PokerSuper
	{		
		private var cards:Array = [];
		private var isOwner:Boolean = false;
		
		public function Poker() 
		{
			super();
		}

		public function onEvent(type:String, data:*=null):void
		{
			if(type == GameEvent.GAME_PREPARE_ALL)
			{
				this.onInit(data);
			}
			else if(type == GameEvent.GAME_DEAL_POKER)
			{
				this.onDealPoker(data);
			}else if(type == GameEvent.GAME_CARDS_POKER)
			{
				this.onGainOwner(data);
			}else if(type == GameEvent.GAME_PLAY_POKER)
			{
				this.onPlayPoker(data);
			}
		}

		private function onDealPoker(data:Array):void
		{
			this.loadData(data);			
			this.update();
			this.dealAction(0);
		}

		private function onGainOwner(data:Object=null):void
		{
			if(data != null)
			{				
				this.cards = data.msg as Array;
			}else{				
				this.isOwner = true;
				this.loadData(this.cards);
				this.sortAndUpdate();
				Laya.timer.frameOnce(1, this, onGetCardsTween);
			}
		}

		private function onPlayPoker(data:Object):void
		{
			trace("onPlayPoker", data)
			if(data.type == 1)
			{
				var ev_data:Object = new Object();
				ev_data.type = GameEvent.GAME_POST_CARDS;
				ev_data.data = this.collectCards();

				this.event(GameEvent.EVENT_TO_TABLE, ev_data);
			}else if(data.type == 2)
			{
				this.autoChoice();
			}else if(data.type == 11)
			{
				this.removeCards();
			}
		}

		private function onGetCardsTween():void
		{			
			var len:int = this.list.array.length;
			for(var i:int = 0; i < len; i++)
			{
				var val:int = this.list.array[i].value;
				for each(var cVal:int in this.cards)
				{
					if(val == cVal)
					{
						var cell:Box = this.list.getCell(i);
						if(cell != null)
						{
							cell.y = GamePropertys.LIST_SELECT_Y;
							Tween.to(cell, {y : 0}, 300, Ease.quadIn, null, 500);
						}
						break;
					}
				}
			}
		}
	}

}