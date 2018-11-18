package view.main
{
	import ui.main.MainUI;
	import laya.events.Event;
	import laya.d3.graphics.VertexShurikenParticleBillboard;
	import common.GameEvent;

	/**
	 * ...
	 * @dengcs
	 */
	public class Main extends MainUI{
		public function Main()
		{
			this.visible = false;
			this.on(Event.ADDED, this, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void
		{
			this.off(Event.ADDED, this, onAddedToStage);

			this.btn_cjc.on(Event.CLICK, this, on_cjc_click);
			this.btn_gjc.on(Event.CLICK, this, on_gjc_click);
			this.btn_jyc.on(Event.CLICK, this, on_jyc_click);
			this.btn_dsc.on(Event.CLICK, this, on_dsc_click);
		}

		public function show():void
		{
			this.visible = true;
		}

		public function hide():void
		{
			this.visible = false;
		}

		private function open_game_view():void
		{
			this.event(GameEvent.OPEN_GAME_VIEW);
		}

		private function on_cjc_click():void
		{
			trace("on_cjc_click");
			open_game_view();
		}

		private function on_gjc_click():void
		{
			trace("on_gjc_click");
			open_game_view();
		}

		private function on_jyc_click():void
		{
			trace("on_jyc_click");
			open_game_view();
		}

		private function on_dsc_click():void
		{
			trace("on_dsc_click");
			open_game_view();
		}
	}

}