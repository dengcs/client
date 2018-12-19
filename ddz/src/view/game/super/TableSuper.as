package view.game.super
{
	import ui.game.TableUI;
	import laya.events.Event;
	import common.GameEvent;
	import game.proto.game_update;
	import game.net.NetClient;
	import common.GameConstants;
	import common.StaticFunctions;
	import laya.ui.Box;
	import laya.display.Sprite;
	import laya.ui.Image;
	import laya.utils.Handler;
	import laya.webgl.shapes.Ellipse;
	import laya.utils.Tween;

	/**
	 * ...
	 * @dengcs
	 */
	public class TableSuper extends TableUI
	{		
		private var snatch:int = 0;

		// 服务端给的idx
		private var mineIdx:int = 0;

		private var vtData:Vector.<Array> = new Vector.<Array>(3, true);

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
		}

		public function hide():void
		{
			this.visible = false;
		}

		public function onInit(data:Object):void
		{			
			this.snatch = 0;
			this.mineIdx = data.idx;

			this.preList.renderHandler = new Handler(this, onPreListRender);
			this.mineList.renderHandler = new Handler(this, onMineListRender);
			this.nextList.renderHandler = new Handler(this, onNextListRender);
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
			ev_data.data = {type:1};

			this.event(GameEvent.GAME_TABLE_POKER, ev_data);
		}

		private function onBtnPromptPlay():void
		{
			var ev_data:Object = new Object();
			ev_data.type = GameEvent.GAME_PLAY_POKER;
			ev_data.data = {type:2};

			this.event(GameEvent.GAME_TABLE_POKER, ev_data);
		}

		private function listRender(cell:Box, index:int, data:Array):void
		{
			var item:Object = data[index];

			var parent:Sprite = cell.getChildAt(0) as Sprite;

			var literalImg:Image = parent.getChildByName("literal") as Image;
			var scolorImg:Image = literalImg.getChildByName("scolor") as Image;
			var bcolorImg:Image = parent.getChildByName("bcolor") as Image;

			literalImg.skin = item.literal;
			scolorImg.skin 	= item.scolor;
			bcolorImg.skin 	= item.bcolor;
		}

		private function onPreListRender(cell:Box, index:int): void 
		{
			this.listRender(cell, index, this.preList.array)
		}

		private function onMineListRender(cell:Box, index:int): void 
		{
			this.listRender(cell, index, this.mineList.array)
		}

		private function onNextListRender(cell:Box, index:int): void 
		{
			this.listRender(cell, index, this.nextList.array)
		}

		public function update(idx:int):void
		{
			if(idx == 1)
			{
				this.preList.array = vtData[idx];
			}else if(idx == 2)
			{
				this.mineList.array = vtData[idx];
			}else if(idx == 3)
			{
				this.nextList.array = vtData[idx];
			}			
		} 

		public function onPlayShow(data:Object):void
		{
			var curIdx:int = data.idx;
			var values:Array = data.msg;
			vtData[curIdx - 1] = StaticFunctions.loadData(values);

			if(curIdx == this.mineIdx)
			{
				var ev_data:Object = new Object();
				ev_data.type = GameEvent.GAME_PLAY_POKER;
				ev_data.data = {type:11};

				this.event(GameEvent.GAME_TABLE_POKER, ev_data);

				//Laya.timer.once(350, this, update, [curIdx]);
			}
		}
	}

}