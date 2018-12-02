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

	public class Poker extends PokerUI
	{
		private var width20:int = 930;
		private var num:int = 20; // 当前
		private var place:int = 0;
		private var data:Array = [];
		private var bgImgList:Vector.<Image> = new Vector.<Image>();
		
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
			this.list.array = data;
			this.loadBGList();
		}

		public function show():void
		{
			this.visible = true;

			this.loadData();
			
			this.update();

			Laya.timer.once(1000,this,dealAction,[0]);
		}

		public function hide():void
		{
			this.visible = false;
		}

		private function onListRender(cell:Box, index: int): void 
		{			
			var item:Object = this.list.getItem(index);

			var parent:Sprite = cell.getChildAt(0) as Sprite;
			parent.visible = false;

			var literalImg:Image = parent.getChildByName("literal") as Image;
			var scolorImg:Image = literalImg.getChildByName("scolor") as Image;
			var bcolorImg:Image = parent.getChildByName("bcolor") as Image;

			literalImg.skin = item.literal;
			scolorImg.skin 	= item.scolor;
			bcolorImg.skin 	= item.bcolor;
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

		private function loadData():void
		{
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_1.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_2.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_3.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_4.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_5.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_6.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_7.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_8.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_9.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_10.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_11.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_12.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/red_13.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/joker_small.png",scolor:"",bcolor:"game/poker/big_small.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/joker_big.png",scolor:"",bcolor:"game/poker/big_joker.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/black_1.png",scolor:"game/poker/big_2.png",bcolor:"game/poker/big_2.png"});
			data.push({bkground:"game/poker/poker_fg.png",literal:"game/poker/black_2.png",scolor:"game/poker/big_2.png",bcolor:"game/poker/big_2.png"});
		}

		private function loadBGList():void
		{
			for(var i:int = 0;i<20;i++)
			{
				var tImg:Image = new Image("game/poker/poker_bg.png");
				tImg.x = 569;
				tImg.y = 213;
				tImg.scaleX = 0.8;
				tImg.scaleY = 0.8;
				tImg.anchorX = 0.5;
				tImg.anchorY = 0.5;
				this.bgImgList.push(tImg);				
			}
		}

		private function moveRoundIn():void
		{
			Tween.to(this.list,{scaleX:0,scaleY:0,skewY:-15},300,Ease.quartIn,Handler.create(this,moveRoundOut));
		}

		private function moveRoundOut():void
		{
			Tween.to(this.list,{scaleX:1,scaleY:1,skewY:0},300,Ease.quartOut);
		}

		private function dealAction(index:int):void
		{
			var place:int = this.place % 3

			var bg_idx:int = (3*index + place) % this.bgImgList.length;
			var img:Image = this.bgImgList[bg_idx];
			if(img.visible)
			{
				this.addChild(img);
			}else{
				img.visible = true;
			}

			var x:int =0;
			var y:int = 0;
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

			
			Tween.to(img,{x:x,y:y,scaleX:scaleX,scaleY:scaleY},300,Ease.strongIn,Handler.create(this,moveBgImgComple,[index, place]));

			if(place == 2)
			{
				var next_index:int = index+1
				if(next_index < 17)
				{
					Laya.timer.once(100,this,dealAction,[next_index]);
				}
			}else
			{
				Laya.timer.once(100,this,dealAction,[index]);
			}

			this.place++;
		}

		private function moveBgImgComple(index:int, place:int):void
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

			var bg_idx:int = (3*index + place) % this.bgImgList.length;
			var img:Image = this.bgImgList[bg_idx];
			if(img != null)
			{
				img.x = 569;
				img.y = 213;				
				img.scaleX = 0.8;
				img.scaleY = 0.8;
				img.visible = false;
			}

			if((index + 1) == this.list.length && place == 2)
			{				
				this.moveRoundIn();
			}
		}
	}

}