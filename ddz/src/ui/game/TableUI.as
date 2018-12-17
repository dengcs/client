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

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1140,"mouseThrough":true,"height":855},"child":[{"type":"Panel","props":{"y":277,"x":370,"width":400,"var":"pnlSnatch","height":300},"child":[{"type":"Button","props":{"y":240,"x":0,"var":"btnSnatchYes","stateNum":1,"skin":"game/button/btn_bg_green.png","pivotY":0.5,"pivotX":0.5,"labelStroke":0,"labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"抢地主"}},{"type":"Button","props":{"y":240,"x":244,"var":"btnSnatchNo","stateNum":1,"skin":"game/button/btn_bg_red.png","pivotY":0.5,"pivotX":0.5,"labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"不抢"}}]},{"type":"Panel","props":{"y":277,"x":370,"width":400,"var":"pnlDouble","height":300},"child":[{"type":"Button","props":{"y":240,"x":0,"var":"btnDoubleYes","stateNum":1,"skin":"game/button/btn_bg_green.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"加 倍"}},{"type":"Button","props":{"y":240,"x":244,"var":"btnDoubleNo","stateNum":1,"skin":"game/button/btn_bg_red.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"不 加 倍"}}]},{"type":"Panel","props":{"y":277,"x":270,"width":600,"var":"pnlPlay","height":300},"child":[{"type":"Button","props":{"y":240,"x":0,"var":"btnPlayYes","stateNum":1,"skin":"game/button/btn_bg_green.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"出 牌"}},{"type":"Button","props":{"y":240,"x":222,"var":"btnPlayPrompt","stateNum":1,"skin":"game/button/btn_bg_green.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"提 示"}},{"type":"Button","props":{"y":240,"x":444,"var":"btnPlayCancel","stateNum":1,"skin":"game/button/btn_bg_red.png","labelSize":20,"labelFont":"Microsoft YaHei","labelColors":"#ffffff","labelBold":true,"labelAlign":"center","label":"过"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}