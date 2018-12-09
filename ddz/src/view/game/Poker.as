/**Created by the LayaAirIDE*/
package view.game
{
	import ui.game.PokerUI
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.ui.Box;
	import laya.ui.Image;
	import laya.display.Sprite;
	import laya.events.Keyboard;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Pool;
	import common.GameConstants;
	import common.GameEvent;
	import view.game.Poker;

	public class Poker extends PokerUI
	{
		private var width20:int = 930;
		private var num:int = 20; // 当前
		private var place:int = 0;
		private var data:Array = [];
		private var nstate:int = 0;
		
		public function Poker() 
		{
			super();
			this.visible = false;
			this.on(Event.ADDED, this, onAddedToStage);
		}

		private function onAddedToStage():void 
		{
			this.list.mouseHandler = new Handler(this, onListMouse);
			this.list.renderHandler = new Handler(this, onListRender);

			this.cacheBGImage();
		}

		public function show():void
		{
			this.nstate = 1;
			this.visible = true;			
			this.list.array = this.data;
			this.update();

			Laya.timer.once(1000,this,dealAction,[0]);
		}

		public function hide():void
		{
			this.visible = false;
		}		

		private function onListRender(cell:Box, index: int): void 
		{
			var item:Object = this.data[index];

			var parent:Sprite = cell.getChildAt(0) as Sprite;
			if(this.nstate == 1)
			{
				parent.visible = false;
			}

			var literalImg:Image = parent.getChildByName("literal") as Image;
			var scolorImg:Image = literalImg.getChildByName("scolor") as Image;
			var bcolorImg:Image = parent.getChildByName("bcolor") as Image;

			literalImg.skin = item.literal;
			scolorImg.skin 	= item.scolor;
			bcolorImg.skin 	= item.bcolor;
		}

		public function onEvent(type:String, data:*=null):void
		{
			if(type == GameEvent.GAME_DEAL_POKER)
			{
				this.onDealPoker(data);
			}else if(type == GameEvent.GAME_CARDS_POKER)
			{
				this.onCardsPoker(data.msg);
			}else if(type == GameEvent.GAME_PLAY_POKER)
			{

			}
		}

		private function onDealPoker(data:Array):void
		{			
			this.data = [];
			this.loadData(data);
		}

		private function onCardsPoker(data:Array):void
		{
			trace("onCardsPoker", data)
			this.loadData(data);
			this.update();
		}

		private function onPlayPoker():void
		{
			// var data:Object = new Object();
			// data.cmd = GameConstants.PLAY_STATE_PLAY;

			// notify_game_update(data);
			var ev:Event = new Event();
			ev.type = Event.MOUSE_OVER;
			this.onListMouse(ev, 0);
		}

		private function loadData(data:Array):void
		{
			for each(var card:int in data)
			{
				var value:int = Math.ceil(card/4);
				var color:int = ((card-1) % 4) + 1;

				var dataObj:Object = new Object();
				dataObj.value = card;

				if(card == 53)
				{
					dataObj.literal = "game/poker/joker_small.png";
					dataObj.scolor = "";
					dataObj.bcolor = "game/poker/big_small.png";
				}else if(card == 54){
					dataObj.literal = "game/poker/joker_big.png";
					dataObj.scolor = "";
					dataObj.bcolor = "game/poker/big_joker.png";
				}else{
					var colorStr:String = "red";
					if(color%2 == 0)
					{
						colorStr = "black";
					}
					
					dataObj.literal = "game/poker/" + colorStr + "_" + value + ".png";
					dataObj.scolor = dataObj.bcolor = "game/poker/big_" + color + ".png";
				}
				trace(dataObj)
				this.data.push(dataObj);
			}
		}

		private function cacheBGImage():void
		{
			for(var i:int = 0;i<20;i++)
			{
				var img:Image = new Image("game/poker/poker_bg.png");
				img.x = 569;
				img.y = 213;
				img.scaleX = 0.8;
				img.scaleY = 0.8;
				img.anchorX = 0.5;
				img.anchorY = 0.5;
				Pool.recover("poker_bg", img);
			}
		}

		private function dealAction(index:int):void
		{
			if(index >= GameConstants.GLOBAL_POKER_NUM)
			{
				return;
			}

			var img:Image = Pool.getItem("poker_bg");
			if(img.visible)
			{
				this.addChild(img);
			}else{
				img.visible = true;
			}

			var place:int = this.place % 3
			var x:int =0; // 发牌的目标位置x坐标
			var y:int = 0; // 发牌的目标位置y坐标
			var scaleX:Number = 0.3;
			var scaleY:Number = 0.3;

			if(place == 0)
			{
				x = 100;
				y = 425;
			}else if(place == 1)
			{
				x =240 + 41*index;
				y = 730;
				scaleX = 1;
				scaleY = 1;
			}else
			{
				x = 1040;
				y = 425;
			}
			
			Tween.to(img,{x:x,y:y,scaleX:scaleX,scaleY:scaleY},300,Ease.strongIn,Handler.create(this,tweenBgImgComple,[index, place, img]));

			if(place == 2)
			{
				var next_index:int = index+1
				Laya.timer.once(100,this,dealAction,[next_index]);
			}else
			{
				Laya.timer.once(100,this,dealAction,[index]);
			}

			this.place++;
		}

		private function tweenBgImgComple(index:int, place:int, img:Image):void
		{
			if(place == 0)
			{

			}else if(place == 1)
			{
				var cell:Box = this.list.getCell(index);
				if(cell != null)
				{
					var parent:Sprite = cell.getChildAt(0) as Sprite;
					parent.visible = true;
				}
			}else
			{

			}

			if(img != null)
			{
				img.x = 569;
				img.y = 213;				
				img.scaleX = 0.8;
				img.scaleY = 0.8;
				img.visible = false;
				Pool.recover("poker_bg", img)
			}

			if((index + 1) == this.list.length && place == 2)
			{				
				this.tweenRoundStart();
			}
		}

		private function onListMouse(e:Event, index: int): void 
		{
			if(e.type == Event.CLICK)
			{
				var selectItem:Box = this.list.getCell(index);
				if(selectItem.y != 0)
				{
					selectItem.y = 0;
				}else{
					selectItem.y -= 30;
				}
			}else if(e.type == Event.MOUSE_OVER)
			{				
				var selectItem:Box = this.list.getCell(index);
				if(selectItem.y == 0)
				{
					selectItem.y -= 30;
				}
			}else if(e.type == Event.MOUSE_OUT)
			{				
				var selectItem:Box = this.list.getCell(index);
				if(selectItem.y != 0)
				{
					selectItem.y = 0;
				}
			}
		}

		private function update():void
		{
			this.num = this.list.length;

			if(this.num == 20)
			{
				this.list.width = width20;
			}else
			{
				this.list.width = width20 - (41*(20-num))
			}

			this.list.refresh();
		}

		public static function compare(a:Object, b:Object):Number
		{
			if(a.value < b.value)
			{
				return 1;
			}
			return -1;
		}

		private function tweenRoundStart():void
		{
			Tween.to(this.list,{scaleX:0,scaleY:0,skewY:-15},300,Ease.quartIn,Handler.create(this,tweenRoundStop));
		}

		private function tweenRoundStop():void
		{
			this.nstate = 2;			
			this.data.sort(Poker.compare);
			this.update();
			Tween.to(this.list,{scaleX:1,scaleY:1,skewY:0},300,Ease.quartOut);
		}
	}

}