/**Created by the LayaAirIDE*/
package view.game
{
	import ui.game.PokerUI
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.ui.Box;
	import laya.ui.Image;
	import laya.display.Sprite;
	import laya.webgl.shapes.Ellipse;
	import laya.events.Keyboard;

	public class Poker extends PokerUI
	{
		private var data:Array = [];
		private var mouseDown:Boolean = false;
		
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
		}

		public function show():void
		{
			this.visible = true;
			data.push({literal:"game/poker/red_1.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_2.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_3.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_4.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_5.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_6.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_7.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_8.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_9.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_10.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_11.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_12.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/red_13.png",scolor:"game/poker/big_1.png",bcolor:"game/poker/big_1.png"});
			data.push({literal:"game/poker/joker_small.png",scolor:"",bcolor:"game/poker/big_small.png"});
			data.push({literal:"game/poker/joker_big.png",scolor:"",bcolor:"game/poker/big_joker.png"});
			data.push({literal:"game/poker/black_1.png",scolor:"game/poker/big_2.png",bcolor:"game/poker/big_2.png"});
			data.push({literal:"game/poker/black_2.png",scolor:"game/poker/big_2.png",bcolor:"game/poker/big_2.png"});
			data.push({literal:"game/poker/black_3.png",scolor:"game/poker/big_2.png",bcolor:"game/poker/big_2.png"});
			data.push({literal:"game/poker/black_4.png",scolor:"game/poker/big_2.png",bcolor:"game/poker/big_2.png"});
			data.push({literal:"game/poker/black_5.png",scolor:"game/poker/big_2.png",bcolor:"game/poker/big_2.png"});
			this.list.refresh();
		}

		public function hide():void
		{
			this.visible = false;
		}

		private function onListRender(cell:Box, index: int): void 
		{			
			var item:Object = this.data[index];

			var parent:Sprite = cell.getChildAt(0) as Sprite;

			var literalImg:Image = parent.getChildByName("literal") as Image;
			var scolorImg:Image = literalImg.getChildByName("scolor") as Image;
			var bcolorImg:Image = parent.getChildByName("bcolor") as Image;

			literalImg.skin = item.literal;
			scolorImg.skin = item.scolor;
			bcolorImg.skin = item.bcolor;
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
			}else if(e.type == Event.MOUSE_DOWN){
				mouseDown = true;
			}else if(e.type == Event.MOUSE_UP){
				mouseDown = false;
			}else if(e.type == Event.MOUSE_OVER && mouseDown)
			{				
				var selectItem:Box = this.list.getCell(index);
				if(selectItem.y == 0)
				{
					selectItem.y -= 30;
				}
			}
		}
	}

}