/**Created by the LayaAirIDE,do not modify.*/
package ui.game {
	import laya.ui.*;
	import laya.display.*; 

	public class PokerUI extends View {
		public var list:List;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1140,"height":855},"compId":1,"child":[{"type":"List","props":{"y":730,"x":570,"width":807,"var":"list","spaceX":-110,"repeatY":1,"repeatX":20,"height":209,"anchorY":0.5,"anchorX":0.5},"compId":7,"child":[{"type":"Box","props":{"renderType":"render"},"compId":6,"child":[{"type":"Image","props":{"skin":"game/poker/poker_fg.png","sizeGrid":"20,15,20,15"},"compId":2,"child":[{"type":"Image","props":{"y":10,"x":8,"name":"literal"},"compId":9,"child":[{"type":"Image","props":{"y":50,"x":0,"scaleY":0.38,"scaleX":0.38,"name":"scolor"},"compId":4}]},{"type":"Image","props":{"y":95,"x":55,"name":"bcolor"},"compId":5}]}]}]}],"loadList":["game/poker/poker_fg.png"],"loadList3D":[]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}