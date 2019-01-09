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
	import common.GameFunctions;
	import laya.utils.Ease;
	import common.GameConstants;
	import common.GamePropertys;
	import game.pdk.PokerFetch;
	import common.GameData;

	/**
	 * ...
	 * @dengcs
	 */
	public class PokerSuper extends PokerUI{

		private var place:int = 0;
		private var data:Array = [];

		// 服务端给的idx
		private var mineIdx:int = 0;

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

		public function onInit(data:Object):void
		{
			this.mineIdx = data.idx;
			this.data = [];						
			this.list.array = this.data;						
			this.list.visible = false;
		}		

		public function show():void
		{
			this.list.visible = false;
			this.visible = true;
		}

		public function hide():void
		{
			this.visible = false;
		}
		
		private function onListRender(cell:Box, index: int): void 
		{
			if(cell.alpha == 0)
			{
				cell.alpha = 1;
			}

			var item:Object = this.data[index];

			var parent:Sprite = cell.getChildAt(0) as Sprite;

			var literalImg:Image = parent.getChildByName("literal") as Image;
			var scolorImg:Image = literalImg.getChildByName("scolor") as Image;
			var bcolorImg:Image = parent.getChildByName("bcolor") as Image;

			literalImg.skin = item.literal;
			scolorImg.skin 	= item.scolor;
			bcolorImg.skin 	= item.bcolor;
		}

		private function onListMouse(e:Event, index: int): void 
		{
			var cell:Box = null;
			if(e.type == Event.CLICK)
			{
				cell = this.list.getCell(index);
				if(cell.y != 0)
				{
					cell.y = 0;
				}else{
					cell.y = GamePropertys.LIST_SELECT_Y;
				}
			}
		}

		public function loadData(data:Array):void
		{
			var addArray:Array = GameFunctions.loadData(data);
			this.data = this.data.concat(addArray);
		}
		
		private function cacheBGImage():void
		{
			for(var i:int = 0;i<GamePropertys.DEAL_CACHE_COUNT;i++)
			{
				var img:Image = new Image("game/poker/poker_bg.png");
				img.x = GamePropertys.DEAL_BG_IMG_X;
				img.y = GamePropertys.DEAL_BG_IMG_Y;
				img.scaleX = GamePropertys.DEAL_BG_IMG_SCALEX;
				img.scaleY = GamePropertys.DEAL_BG_IMG_SCALEY;
				img.anchorX = 0.5;
				img.anchorY = 0.5;
				Pool.recover("poker_bg", img);
			}
		}

		public function onDealFinish():void
		{
			this.list.visible = true;
			for(var index:int in this.list.array)
			{
				var cell:Box = this.list.getCell(index);
				if(cell != null)
				{
					cell.visible = false;
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
				x = GamePropertys.DEAL_TARGET_PLACE0_X;
				y = GamePropertys.DEAL_TARGET_PLACE0_Y;
			}else if(place == 1)
			{
				x =GamePropertys.DEAL_TARGET_PLACE1_X + GamePropertys.LIST_X_STEP*index;
				y = GamePropertys.DEAL_TARGET_PLACE1_Y;
				scaleX = 1;
				scaleY = 1;
			}else
			{
				x = GamePropertys.DEAL_TARGET_PLACE2_X;
				y = GamePropertys.DEAL_TARGET_PLACE2_Y;
			}
			
			Tween.to(img, {x:x,y:y,scaleX:scaleX,scaleY:scaleY}, 300, Ease.strongIn, Handler.create(this,dealActionComplete,[index, place, img]));

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

		private function dealActionComplete(index:int, place:int, img:Image):void
		{
			if(place == 0)
			{
				if(index == 0)
				{
					this.onDealFinish();
				}

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
				img.x = GamePropertys.DEAL_BG_IMG_X;
				img.y = GamePropertys.DEAL_BG_IMG_Y;				
				img.scaleX = GamePropertys.DEAL_BG_IMG_SCALEX;
				img.scaleY = GamePropertys.DEAL_BG_IMG_SCALEY;
				img.visible = false;
				Pool.recover("poker_bg", img)
			}

			if((index + 1) == this.list.length && place == 2)
			{				
				this.tweenRotateIn();
			}
		}		

		public function update():void
		{
			var len:int = this.data.length;

			this.list.width = GamePropertys.LIST_CELL_WIDTH + (GamePropertys.LIST_X_STEP*(len - 1))

			this.list.array = this.data;
		}

		public function sortAndUpdate():void
		{
			this.data.sort(GameFunctions.compareObjDes);
			this.update();
		}		

		private function tweenRotateIn():void
		{
			Tween.to(this.list, {scaleX:0,scaleY:0,skewY:-15}, 300, Ease.quartIn, Handler.create(this, tweenRotateOut));
		}

		private function tweenRotateOut():void
		{
			this.sortAndUpdate();
			Tween.to(this.list, {scaleX:1,scaleY:1,skewY:0}, 300, Ease.quartOut, Handler.create(this, tweenRotateOver));
		}

		private function tweenRotateOver():void
		{
			var ev_data:Object = new Object();
			ev_data.type = GameEvent.GAME_DEAL_TABLE;

			this.event(GameEvent.GAME_POKER_TABLE, ev_data);
		}		

		public function removeCards():void
		{
			var idxVt:Vector.<int> = new Vector.<int>();

			var len:int = this.list.length;
			for(var i:int = 0; i<len; i++)
			{
				var cell:Box = this.list.getCell(i);
				if(cell.y != 0)
				{
					idxVt.push(this.data[i].value);
					Tween.to(cell, {alpha:0}, 100, Ease.cubicIn);
				}
			}

			for each(var v:int in idxVt)
			{
				for(var k:int in this.data)
				{
					if(v == this.data[k].value)
					{
						this.data.splice(k, 1);
						break;
					}
				}
			}

			Laya.timer.once(400, this, update);
		}

		public function collectCards():Array
		{
			var cards:Array = [];
			
			var len:int = this.list.length;
			for(var i:int = 0; i<len; i++)
			{
				var cell:Box = this.list.getCell(i);
				if(cell.y != 0)
				{
					cards.push(this.data[i].value);					
				}
			}

			return cards
		}

		public function autoChoice():void
		{
			var valueVt:Vector.<int> = new Vector.<int>();
			for each(var item:Object in this.data)
			{
				valueVt.push(item.value);
			}
			valueVt.reverse();

			var isMain:Boolean = GameData.isMain();
			if(isMain)
			{
				var mainData:Object = PokerFetch.auto_type(valueVt);
				if(mainData != null)
				{
					trace("mainData", mainData)
					for each(var idx:int in mainData.indexes)
					{
						var cell:Box = this.list.getCell(idx);
						cell.y = GamePropertys.LIST_SELECT_Y;
					}
				}
			}else{
				var type:int = GameData.roundData.type;
				var value:int = GameData.roundData.value;
				var count:int = GameData.roundData.count;

				var retData:Object = PokerFetch.fetch_type(valueVt, type, value, count);
				if(retData != null)
				{
					for each(var idx:int in retData.indexes)
					{
						var cell:Box = this.list.getCell(idx);
						cell.y = GamePropertys.LIST_SELECT_Y;
					}
				}
			}
		}
	}

}