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

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1140,"height":855},"child":[{"type":"Panel","props":{"y":277,"x":370,"width":400,"var":"pnlSnatch","height":300},"child":[{"type":"Button","props":{"y":240,"x":244,"var":"btnSnatchYes","stateNum":1,"skin":"game/button/btn_bg_green.png","pivotY":0.5,"pivotX":0.5}},{"type":"Button","props":{"y":240,"x":0,"var":"btnSnatchNo","stateNum":1,"skin":"game/button/btn_bg_red.png","pivotY":0.5,"pivotX":0.5}}]},{"type":"Panel","props":{"y":277,"x":370,"width":400,"var":"pnlDouble","height":300},"child":[{"type":"Button","props":{"y":240,"x":0,"var":"btnDoubleYes","stateNum":1,"skin":"game/button/btn_bg_green.png"}},{"type":"Button","props":{"y":240,"x":244,"var":"btnDoubleNo","stateNum":1,"skin":"game/button/btn_bg_red.png"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}