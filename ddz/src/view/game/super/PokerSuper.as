package view.game.super
{
	import ui.game.PokerUI;
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.ui.Box;
	import laya.display.Sprite;
	import laya.ui.Image;
	import laya.utils.Pool;
	import laya.utils.Tween;
	import common.GameEvent;
	import common.StaticFunctions;
	import laya.utils.Ease;
	import common.GameConstants;

	/**
	 * ...
	 * @dengcs
	 */
	public class PokerSuper extends PokerUI{

		private var width20:int = 930;
		private var num:int = 20; // 当前
		private var place:int = 0;
		private var data:Array = [];
		
		// 是否发完牌
		private var isDeaLed:Boolean = false;

		private var getCardsHandler:Handler = null;

		public function PokerSuper(){
			this.visible = false;
			this.on(Event.ADDED, this, onAddedToStage);
		}

		private function onAddedToStage():void 
		{
			this.list.renderHandler = new Handler(this, onListRender);
			this.list.mouseHandler 	= new Handler(this, onListMouse);

			this.cacheBGImage();
		}

		public function setHandler(getCards:Handler):void
		{
			this.getCardsHandler = getCards;
		}

		public function show():void
		{
			this.visible = true;			
			this.list.array = this.data;
		}

		public function hide():void
		{
			this.visible = false;
			this.data = [];
		}

		
		private function onListRender(cell:Box, index: int): void 
		{
			var item:Object = this.data[index];

			var parent:Sprite = cell.getChildAt(0) as Sprite;

			var literalImg:Image = parent.getChildByName("literal") as Image;
			var scolorImg:Image = literalImg.getChildByName("scolor") as Image;
			var bcolorImg:Image = parent.getChildByName("bcolor") as Image;

			literalImg.skin = item.literal;
			scolorImg.skin 	= item.scolor;
			bcolorImg.skin 	= item.bcolor;

			if(index == 16)
			{
				this.onDealFinish();			
			}else if(index == 19)
			{
				this.getCardsHandler.run();
			}
		}

		private function onListMouse(e:Event, index: int): void 
		{
			trace("onListMouse")
			var cell:Box = null;
			if(e.type == Event.CLICK)
			{
				cell = this.list.getCell(index);
				if(cell.y != 0)
				{
					cell.y = 0;
				}else{
					cell.y = -30;
				}
			}else if(e.type == Event.MOUSE_OVER)
			{				
				cell = this.list.getCell(index);
				if(cell.y == 0)
				{
					cell.y = -30;
				}
			}else if(e.type == Event.MOUSE_OUT)
			{				
				cell = this.list.getCell(index);
				if(cell.y != 0)
				{
					cell.y = 0;
				}
			}
		}

		public function getPostOfCards():Array
		{
			var cards:Array = [];

			var len:int = this.list.length;
			for(var i:int; i<len; i++)
			{
				var cell:Box = this.list.getCell(i);
				if(cell.y != 0)
				{
					cards.push(this.data[i].value);
				}
			}

			return cards
		}

		public function loadData(data:Array):void
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
		

		private function onDealFinish():void
		{
			if(this.isDeaLed == false)
			{
				this.isDeaLed = true
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

		
		public function dealAction(index:int):void
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
			
			Tween.to(img, {x:x,y:y,scaleX:scaleX,scaleY:scaleY}, 300, Ease.strongIn, Handler.create(this,tweenBgImgComple,[index, place, img]));

			if(place == 2)
			{
				var next_index:int = index+1
				Laya.timer.once(100, this, dealAction, [next_index]);
			}else
			{
				Laya.timer.once(100, this, dealAction, [index]);
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
					cell.visible = true;
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
				this.tweenRoundBegin();
			}
		}		

		public function update():void
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

		public function sortAndUpdate():void
		{
			this.data.sort(StaticFunctions.compareObjDes);
			this.update();
		}		

		private function tweenRoundBegin():void
		{
			Tween.to(this.list, {scaleX:0,scaleY:0,skewY:-15}, 300, Ease.quartIn, Handler.create(this, tweenRoundEnd));
		}

		private function tweenRoundEnd():void
		{
			this.sortAndUpdate();
			Tween.to(this.list, {scaleX:1,scaleY:1,skewY:0}, 300, Ease.quartOut, Handler.create(this, tweenRoundComplete));
		}

		private function tweenRoundComplete():void
		{
			var ev_data:Object = new Object();
			ev_data.type = GameEvent.GAME_DEAL_TABLE;

			this.event(GameEvent.GAME_POKER_TABLE, ev_data);
		}
	}

}