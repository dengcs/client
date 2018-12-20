/**Created by the LayaAirIDE,do not modify.*/
package ui.game {
	import laya.ui.*;
	import laya.display.*; 

	public class TableUI extends View {
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
		public var preList:List;
		public var mineList:List;
		public var nextList:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1140,"mouseThrough":true,"height":855},"child":[{"type":"Panel","props":{"y":277,"x":370,"width":400,"var":"pnlSnatch","height":300},"child":[{"type":"Button","props":{"y":240,"x":0,"var":"btnSnatchYes","stateNum":1,"skin":"game/button/btn_bg_green.png","pivotY":0.5,"pivotX":0.5,"labelStroke":0,"labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"抢地主"}},{"type":"Button","props":{"y":240,"x":244,"var":"btnSnatchNo","stateNum":1,"skin":"game/button/btn_bg_red.png","pivotY":0.5,"pivotX":0.5,"labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"不抢"}}]},{"type":"Panel","props":{"y":277,"x":370,"width":400,"var":"pnlDouble","height":300},"child":[{"type":"Button","props":{"y":240,"x":0,"var":"btnDoubleYes","stateNum":1,"skin":"game/button/btn_bg_green.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"加 倍"}},{"type":"Button","props":{"y":240,"x":244,"var":"btnDoubleNo","stateNum":1,"skin":"game/button/btn_bg_red.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"不 加 倍"}}]},{"type":"Panel","props":{"y":277,"x":270,"width":600,"var":"pnlPlay","height":300},"child":[{"type":"Button","props":{"y":240,"x":0,"var":"btnPlayYes","stateNum":1,"skin":"game/button/btn_bg_green.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"出 牌"}},{"type":"Button","props":{"y":240,"x":222,"var":"btnPlayPrompt","stateNum":1,"skin":"game/button/btn_bg_green.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"提 示"}},{"type":"Button","props":{"y":240,"x":444,"var":"btnPlayCancel","stateNum":1,"skin":"game/button/btn_bg_red.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"过"}}]},{"type":"List","props":{"y":427,"x":240,"width":807,"var":"preList","spaceX":-110,"rotation":90,"repeatY":1,"repeatX":20,"height":209,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Box","props":{"renderType":"render"},"child":[{"type":"Image","props":{"skin":"game/poker/poker_fg.png","sizeGrid":"20,15,20,15"},"child":[{"type":"Image","props":{"y":10,"x":8,"name":"literal"},"child":[{"type":"Image","props":{"y":50,"scaleY":0.38,"scaleX":0.38,"name":"scolor"}}]},{"type":"Image","props":{"y":95,"x":55,"name":"bcolor"}}]}]}]},{"type":"List","props":{"y":500,"x":570,"width":807,"var":"mineList","spaceX":-110,"repeatY":1,"repeatX":20,"height":209,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Box","props":{"renderType":"render"},"child":[{"type":"Image","props":{"skin":"game/poker/poker_fg.png","sizeGrid":"20,15,20,15"},"child":[{"type":"Image","props":{"y":10,"x":8,"name":"literal"},"child":[{"type":"Image","props":{"y":50,"scaleY":0.38,"scaleX":0.38,"name":"scolor"}}]},{"type":"Image","props":{"y":95,"x":55,"name":"bcolor"}}]}]}]},{"type":"List","props":{"y":427,"x":900,"width":807,"var":"nextList","spaceX":-110,"rotation":-90,"repeatY":1,"repeatX":20,"height":209,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Box","props":{"renderType":"render"},"child":[{"type":"Image","props":{"skin":"game/poker/poker_fg.png","sizeGrid":"20,15,20,15"},"child":[{"type":"Image","props":{"y":10,"x":8,"name":"literal"},"child":[{"type":"Image","props":{"y":50,"scaleY":0.38,"scaleX":0.38,"name":"scolor"}}]},{"type":"Image","props":{"y":95,"x":55,"name":"bcolor"}}]}]}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}