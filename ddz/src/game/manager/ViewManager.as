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
	public final class ViewManager extends Sprite{
		private static  var _instance:ViewManager = null;

		private var mainView:Main;
		private var gameView:Game;

		public function ViewManager(){
			if (_instance == null) {
				super();
				this.on(Event.ADDED, this, onAddedToStage);
            }else{
                 throw new Error("只能用getInstance()来获取实例!");
			}
		}

		public static function getInstance():ViewManager
		{
			if (_instance == null) {
                _instance = new ViewManager();
            }
            return _instance;
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

		public function get main():Main
		{
			return mainView;
		}

		public function get game():Game
		{
			return gameView;
		}
	}

}