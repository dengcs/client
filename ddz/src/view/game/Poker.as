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
	import common.StaticFunctions;

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
			this.list.visible = false;
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
				ev_data.data = this.postCards(data.type);

				this.event(GameEvent.GAME_POKER_TABLE, ev_data);
			}else if(data.type == 2)
			{

			}else if(data.type == 11)
			{
				this.postCards(data.type);
			}
		}

		private function onGetCardsTween():void
		{
			if(this.isOwner)
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
								cell.y = -30;
								Tween.to(cell, {y : 0}, 300, Ease.quadIn, null, 500);
							}
							break;
						}
					}
				}
			}
		}
	}

}