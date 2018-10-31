/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 

	public class MainUI extends View {
		public var btn_cjc:Button;
		public var btn_dsc:Button;
		public var btn_gjc:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1140,"height":855},"child":[{"type":"Image","props":{"y":-2,"x":1,"skin":"main/bj/home_bg.jpg"}},{"type":"Button","props":{"y":220,"x":70,"width":280,"var":"btn_cjc","stateNum":1,"skin":"main/button/room_cc_cjc.png","label":"label","height":410}},{"type":"Button","props":{"y":220,"x":430,"var":"btn_dsc","stateNum":1,"skin":"main/button/room_cc_dsc.png","label":"label"}},{"type":"Button","props":{"y":220,"x":790,"var":"btn_gjc","stateNum":1,"skin":"main/button/room_cc_gjc.png","label":"label"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}