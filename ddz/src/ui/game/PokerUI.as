/**Created by the LayaAirIDE,do not modify.*/
package ui.game {
	import laya.ui.*;
	import laya.display.*; 

	public class PokerUI extends View {
		public var list:List;
		public var bgImg:Image;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1140,"height":855},"child":[{"type":"List","props":{"y":730,"x":570,"width":807,"var":"list","spaceX":-110,"repeatX":20,"height":209,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Box","props":{"renderType":"render"},"child":[{"type":"Image","props":{"skin":"game/poker/poker_fg.png","sizeGrid":"20,15,20,15","name":"bkground"},"child":[{"type":"Image","props":{"y":10,"x":8,"name":"literal"},"child":[{"type":"Image","props":{"y":50,"x":0,"scaleY":0.38,"scaleX":0.38,"name":"scolor"}}]},{"type":"Image","props":{"y":95,"x":55,"name":"bcolor"}}]}]}]},{"type":"Image","props":{"y":113,"x":569,"var":"bgImg","skin":"game/poker/poker_bg.png","anchorY":0.5,"anchorX":0.5}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}