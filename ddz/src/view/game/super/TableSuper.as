package view.game.super
{
	import ui.game.TableUI;
	import laya.events.Event;
	import common.GameEvent;
	import game.proto.game_update;
	import common.GameConstants;
	import common.GameFunctions;
	import laya.ui.Box;
	import laya.display.Sprite;
	import laya.ui.Image;
	import laya.utils.Handler;
	import laya.webgl.shapes.Ellipse;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import common.GamePropertys;
	import common.GameData;

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
			this.pnlSnatch.visible = false;
			this.pnlDouble.visible = false;
			this.pnlPlay.visible = false;
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

			this.preList.visible = false;
			this.mineList.visible = false;
			this.nextList.visible = false;
			
			this.pnlSnatch.visible = false;
			this.pnlDouble.visible = false;
			this.pnlPlay.visible = false;

			GameData.init();
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

			GameFunctions.notify_game_update(data);
		}

		private function onBtnNotSnatch():void
		{
			this.pnlSnatch.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_SNATCH;

			GameFunctions.notify_game_update(data);
		}

		private function onBtnDouble():void
		{
			this.pnlDouble.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_DOUBLE;
			data.msg = 1;

			GameFunctions.notify_game_update(data);
		}

		private function onBtnNotDouble():void
		{
			this.pnlDouble.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_DOUBLE;

			GameFunctions.notify_game_update(data);
		}

		private function onBtnCancelPlay():void
		{
			this.pnlPlay.visible = false;

			var data:Object = new Object();
			data.cmd = GameConstants.PLAY_STATE_PLAY;
			data.msg = 0;

			GameFunctions.notify_game_update(data);
		}		

		private function onBtnPlay():void
		{
			var ev_data:Object = new Object();
			ev_data.type = GameEvent.GAME_PLAY_POKER;
			ev_data.data = {type:1};

			this.event(GameEvent.EVENT_TO_POKER, ev_data);
		}

		private function onBtnPromptPlay():void
		{
			var ev_data:Object = new Object();
			ev_data.type = GameEvent.GAME_PLAY_POKER;
			ev_data.data = {type:2};

			this.event(GameEvent.EVENT_TO_POKER, ev_data);
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
			this.listRender(cell, index, this.preList.array);
		}

		private function onMineListRender(cell:Box, index:int): void 
		{
			this.listRender(cell, index, this.mineList.array);
		}

		private function onNextListRender(cell:Box, index:int): void 
		{
			this.listRender(cell, index, this.nextList.array);
		}

		private function update(idx:int):void
		{
			if(idx == 0)
			{
				var x:Number = this.preList.x + 120;
				this.preList.visible = true;
				this.preList.array = vtData[idx];
				this.preList.width = GamePropertys.NEXT_LIST_WIDTH + GamePropertys.NEXT_LIST_STEP * (this.preList.array.length - 1)
				Tween.to(this.preList, {x:x,scaleX:0.6,scaleY:0.6,alpha:1}, 300, Ease.quadInOut);
			}else if(idx == 1)
			{
				var y:Number = this.mineList.y - 120;
				this.mineList.visible = true;
				this.mineList.array = vtData[idx];
				this.mineList.width = GamePropertys.MINE_LIST_WIDTH + GamePropertys.MINE_LIST_STEP * (this.mineList.array.length - 1)
				Tween.to(this.mineList, {y:y,scaleX:0.6,scaleY:0.6,alpha:1}, 300, Ease.quadInOut);
			}else if(idx == 2)
			{
				var x:Number = this.nextList.x - 120;
				this.nextList.visible = true;
				this.nextList.array = vtData[idx];
				this.nextList.width = GamePropertys.NEXT_LIST_WIDTH + GamePropertys.NEXT_LIST_STEP * (this.nextList.array.length - 1)
				Tween.to(this.nextList, {x:x,scaleX:0.6,scaleY:0.6,alpha:1}, 300, Ease.quadInOut);
			}
		}

		private function restoreActive(idx:int):void
		{
			if(idx == 0)
			{
				this.preList.alpha = 0;
				this.preList.scale(0.3, 0.3);
				this.preList.visible = false;
				this.preList.x = GamePropertys.PREFIX_LIST_X;
			}else if(idx == 1)
			{
				this.mineList.alpha = 0;
				this.mineList.scale(0.3, 0.3);
				this.mineList.visible = false;
				this.mineList.y = GamePropertys.MINE_LIST_Y;
			}else if(idx == 2)
			{
				this.nextList.alpha = 0;
				this.nextList.scale(0.3, 0.3);
				this.nextList.visible = false;			
				this.nextList.x = GamePropertys.NEXT_LIST_X;
			}
		}

		private function idxToLocal(idx:int):int
		{
			var localIdx:int = (idx - this.mineIdx + 4) % 3
			return localIdx;
		}

		public function onPlayShow(data:Object):void
		{
			var curIdx:int = this.idxToLocal(data.idx);
			var nextIdx:int = (curIdx + 1) % 3;
			this.restoreActive(nextIdx);

			GameData.roundState.curIdx = curIdx;

			if(data.msg == 0)
			{
				return;
			}

			GameData.roundState.preIdx = curIdx;

			this.pnlPlay.visible = false;
			var values:Array = data.msg;
			vtData[curIdx] = GameFunctions.loadData(values);

			GameData.testType(data.msg);

			if(data.idx == this.mineIdx)
			{
				var ev_data:Object = new Object();
				ev_data.type = GameEvent.GAME_PLAY_POKER;
				ev_data.data = {type:11};

				this.event(GameEvent.EVENT_TO_POKER, ev_data);

				Laya.timer.once(100, this, update, [curIdx]);
			}else{
				this.update(curIdx);
			}
		}

		public function clearCancelTimer():void
		{
			Laya.timer.clear(this, onBtnCancelPlay);
		}

		public function createCancelTimer():void
		{
			Laya.timer.once(15000, this, onBtnCancelPlay);
		}
	}

}