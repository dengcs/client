/**Created by the LayaAirIDE,do not modify.*/
package ui.game {
	import laya.ui.*;
	import laya.display.*; 

	public class TableUI extends View {
		public var nextList:List;
		public var mineList:List;
		public var preList:List;
		public var pnlSnatch:Panel;
		public var btnSnatchYes:Button;
		public var btnSnatchNo:Button;
		public var pnlDouble:Panel;
		public var btnDoubleYes:Button;
		public var btnDoubleNo:Button;
		public var pnlPlay:Panel;
		public var btnPlayYes:Button;
		public var btnPlayPrompt:Button;
		public var btnPlayCancel:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1140,"mouseThrough":true,"height":855},"child":[{"type":"List","props":{"y":350,"x":1040,"width":807,"var":"nextList","spaceX":-110,"scaleY":0.3,"scaleX":0.3,"rotation":-90,"repeatY":1,"repeatX":20,"height":209,"anchorY":0.5,"anchorX":0.5,"alpha":0},"child":[{"type":"Box","props":{"renderType":"render"},"child":[{"type":"Image","props":{"skin":"game/poker/poker_fg.png","sizeGrid":"20,15,20,15"},"child":[{"type":"Image","props":{"y":10,"x":8,"name":"literal"},"child":[{"type":"Image","props":{"y":50,"scaleY":0.38,"scaleX":0.38,"name":"scolor"}}]},{"type":"Image","props":{"y":95,"x":55,"name":"bcolor"}}]}]}]},{"type":"List","props":{"y":625,"x":570,"width":807,"var":"mineList","spaceX":-110,"scaleY":0.3,"scaleX":0.3,"repeatY":1,"repeatX":20,"height":209,"anchorY":0.5,"anchorX":0.5,"alpha":0},"child":[{"type":"Box","props":{"renderType":"render"},"child":[{"type":"Image","props":{"skin":"game/poker/poker_fg.png","sizeGrid":"20,15,20,15"},"child":[{"type":"Image","props":{"y":10,"x":8,"name":"literal"},"child":[{"type":"Image","props":{"y":50,"scaleY":0.38,"scaleX":0.38,"name":"scolor"}}]},{"type":"Image","props":{"y":95,"x":55,"name":"bcolor"}}]}]}]},{"type":"List","props":{"y":350,"x":100,"width":807,"var":"preList","spaceX":-110,"scaleY":0.3,"scaleX":0.3,"rotation":90,"repeatY":1,"repeatX":20,"height":209,"anchorY":0.5,"anchorX":0.5,"alpha":0},"child":[{"type":"Box","props":{"renderType":"render"},"child":[{"type":"Image","props":{"skin":"game/poker/poker_fg.png","sizeGrid":"20,15,20,15"},"child":[{"type":"Image","props":{"y":10,"x":8,"name":"literal"},"child":[{"type":"Image","props":{"y":50,"scaleY":0.38,"scaleX":0.38,"name":"scolor"}}]},{"type":"Image","props":{"y":95,"x":55,"name":"bcolor"}}]}]}]},{"type":"Panel","props":{"y":355,"x":410,"width":400,"var":"pnlSnatch","scaleY":0.8,"scaleX":0.8,"height":300},"child":[{"type":"Button","props":{"y":240,"x":0,"var":"btnSnatchYes","stateNum":1,"skin":"game/button/btn_bg_green.png","pivotY":0.5,"pivotX":0.5,"labelStroke":0,"labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"抢地主"}},{"type":"Button","props":{"y":240,"x":244,"var":"btnSnatchNo","stateNum":1,"skin":"game/button/btn_bg_red.png","pivotY":0.5,"pivotX":0.5,"labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"不抢"}}]},{"type":"Panel","props":{"y":355,"x":410,"width":400,"var":"pnlDouble","scaleY":0.8,"scaleX":0.8,"height":300},"child":[{"type":"Button","props":{"y":240,"x":0,"var":"btnDoubleYes","stateNum":1,"skin":"game/button/btn_bg_green.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"加 倍"}},{"type":"Button","props":{"y":240,"x":244,"var":"btnDoubleNo","stateNum":1,"skin":"game/button/btn_bg_red.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"不 加 倍"}}]},{"type":"Panel","props":{"y":355,"x":370,"width":500,"var":"pnlPlay","scaleY":0.8,"scaleX":0.8,"height":300},"child":[{"type":"Button","props":{"y":240,"x":0,"var":"btnPlayYes","stateNum":1,"skin":"game/button/btn_bg_green.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"出 牌"}},{"type":"Button","props":{"y":240,"x":172,"var":"btnPlayPrompt","stateNum":1,"skin":"game/button/btn_bg_green.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"提 示"}},{"type":"Button","props":{"y":240,"x":344,"var":"btnPlayCancel","stateNum":1,"skin":"game/button/btn_bg_red.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"过"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}