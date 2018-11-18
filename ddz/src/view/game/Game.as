/**Created by the LayaAirIDE*/
package view.game
{
	import ui.game.GameUI
	import laya.events.Event;
	import view.game.Poker;

	public class Game extends GameUI
	{
		private var minePoker:Poker;
		public function Game() 
		{
			this.visible = false;
			this.on(Event.ADDED, this, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void
		{
			this.off(Event.ADDED, this, onAddedToStage);
			this.minePoker = new Poker();
			this.addChild(minePoker);
		}

		public function show():void
		{
			this.visible = true;
			this.minePoker.show();
		}

		public function hide():void
		{
			this.visible = false;
			this.minePoker.hide();
		}
	}

}