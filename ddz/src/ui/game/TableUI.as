/**Created by the LayaAirIDE,do not modify.*/
package ui.game {
	import laya.ui.*;
	import laya.display.*; 

	public class TableUI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1140,"height":855}};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}