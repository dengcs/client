/**Created by the LayaAirIDE,do not modify.*/
package ui.main {
	import laya.ui.*;
	import laya.display.*; 
	import common.ButtonRunTime;

	public class MainUI extends View {
		public var btn_cjc:ButtonRunTime;
		public var btn_gjc:ButtonRunTime;
		public var btn_jyc:ButtonRunTime;
		public var btn_dsc:ButtonRunTime;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1140,"height":855},"compId":1,"child":[{"type":"Image","props":{"y":-2,"x":1,"skin":"main/bj/home_bg.jpg"},"compId":2},{"type":"Button","props":{"y":426,"x":155,"width":280,"var":"btn_cjc","stateNum":1,"skin":"main/button/room_cc_cjc.png","sizeGrid":"50,50,50,50","runtime":"common.ButtonRunTime","pivotY":205,"pivotX":140,"height":410},"compId":3},{"type":"Button","props":{"y":427,"x":432,"var":"btn_gjc","stateNum":1,"skin":"main/button/room_cc_gjc.png","sizeGrid":"50,50,50,50","runtime":"common.ButtonRunTime","pivotY":205,"pivotX":140},"compId":5},{"type":"Button","props":{"y":427,"x":708,"var":"btn_jyc","stateNum":1,"skin":"main/button/room_cc_jyc.png","sizeGrid":"50,50,50,50","runtime":"common.ButtonRunTime","pivotY":205,"pivotX":140},"compId":6},{"type":"Button","props":{"y":427,"x":984,"var":"btn_dsc","stateNum":1,"skin":"main/button/room_cc_dsc.png","sizeGrid":"50,50,50,50","runtime":"common.ButtonRunTime","pivotY":205,"pivotX":140},"compId":4}],"loadList":["main/bj/home_bg.jpg","main/button/room_cc_cjc.png","main/button/room_cc_gjc.png","main/button/room_cc_jyc.png","main/button/room_cc_dsc.png"],"loadList3D":[]};
		override protected function createChildren():void {
			View.regComponent("common.ButtonRunTime",ButtonRunTime);
			super.createChildren();
			createView(uiView);

		}

	}
}