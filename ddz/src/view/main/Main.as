package view.main
{
	import ui.main.MainUI;
	import laya.events.Event;
	import laya.d3.graphics.VertexShurikenParticleBillboard;
	import common.GameEvent;
	import game.net.NetClient;
	import game.proto.room_create;

	/**
	 * ...
	 * @dengcs
	 */
	public class Main extends MainUI{
		public function Main()
		{
			this.visible = false;
			this.on(Event.ADDED, this, onAddedToStage);
			
			NetClient.handshake();
		}

		private function onAddedToStage(event:Event):void
		{
			this.off(Event.ADDED, this, onAddedToStage);

			this.btn_cjc.on(Event.CLICK, this, on_open_game);
			this.btn_gjc.on(Event.CLICK, this, on_open_game);
			this.btn_jyc.on(Event.CLICK, this, on_open_game);
			this.btn_dsc.on(Event.CLICK, this, on_open_game);
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

		private function on_open_game():void
		{
			open_game_view();

			var roomMsg:room_create = new room_create();
			roomMsg.channel = 1;
			NetClient.send("room_create", roomMsg);
		}
	}

}