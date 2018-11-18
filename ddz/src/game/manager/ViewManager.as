package game.manager
{
	import laya.display.Sprite;
	import laya.events.Event;
	import view.main.Main;
	import view.game.Game;
	import common.GameEvent;

	/**
	 * ...
	 * @author
	 */
	public class ViewManager extends Sprite{
		private var mainView:Main;
		private var gameView:Game;

		public function ViewManager(){
			super();
			this.on(Event.ADDED, this, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void
		{
			this.off(Event.ADDED, this, onAddedToStage);
			
			// Initialize views.
			initViews();
		}

		private function initViews():void
		{
			mainView = new Main();
			gameView = new Game();

			this.addChild(mainView);
			this.addChild(gameView);

			mainView.on(GameEvent.OPEN_GAME_VIEW, this, onOpenGameView);
			gameView.on(GameEvent.OPEN_MAIN_VIEW, this, onOpenMainView);

			mainView.show();
		}

		private function onOpenGameView():void		
		{
			gameView.show();
			mainView.hide();
		}

		private function onOpenMainView():void		
		{
			mainView.show();
			gameView.hide();
		}
	}

}