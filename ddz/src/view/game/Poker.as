/**Created by the LayaAirIDE*/
package view.game
{
	import common.GameEvent;
	import view.game.super.PokerSuper;
	import laya.ui.Box;
	import laya.utils.Handler;
	import laya.utils.Tween;
	import laya.utils.Ease;

	public class Poker extends PokerSuper
	{		
		private var cards:Array = [];
		private var isOwner:Boolean = false;
		private var isRendered:Boolean = false;
		
		public function Poker() 
		{
			super();
			this.init();
		}

		public function init():void
		{
			var renderHandler:Handler = Handler.create(this, onListRenderFinish);
			var getCardsHandler:Handler = Handler.create(this, onGetCardsTween);
			this.setHandler(renderHandler, getCardsHandler);
		}

		public function onEvent(type:String, data:*=null):void
		{
			if(type == GameEvent.GAME_DEAL_POKER)
			{
				this.onDealPoker(data);
			}else if(type == GameEvent.GAME_CARDS_POKER)
			{
				if(data != null)
				{
					this.onCardsPoker(data.msg);
				}else{
					this.onGainOwner();
				}
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

		private function onGainOwner():void
		{
			this.isOwner = true;

			this.loadData(this.cards);
			this.sortAndUpdate();
		}

		private function onCardsPoker(data:Array):void
		{
			this.cards = data;
		}

		private function onPlayPoker(data:int):void
		{
			trace("onPlayPoker", data)
		}

		private function onListRenderFinish():void
		{
			if(this.isRendered == false)
			{
				this.isRendered = true
				for(var index:int in this.list.array)
				{
					var cell:Box = this.list.getCell(index);
					if(cell != null)
					{
						cell.visible = false;
					}
				}
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