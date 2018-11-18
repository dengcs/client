/**Created by the LayaAirIDE,do not modify.*/
package ui.game {
	import laya.ui.*;
	import laya.display.*; 

	public class GameUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1140,"height":855},"child":[{"type":"Image","props":{"y":0,"x":1,"skin":"game/bj/table_bg_cg2.jpg","name":"bj2"}},{"type":"Image","props":{"y":257,"x":0,"skin":"game/bj/table_bg_cg1.png","name":"bj1"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}