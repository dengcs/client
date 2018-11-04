package view.main
{
	import ui.main.MainUI;
	import laya.events.Event;

	/**
	 * ...
	 * @dengcs
	 */
	public class Main extends MainUI{
		public function Main(){
			this.btn_cjc.on(Event.CLICK, this, on_cjc_click);
			this.btn_gjc.on(Event.CLICK, this, on_gjc_click);
			this.btn_jyc.on(Event.CLICK, this, on_jyc_click);
			this.btn_dsc.on(Event.CLICK, this, on_dsc_click);
		}

		private function on_cjc_click():void
		{
			trace("on_cjc_click");
		}

		private function on_gjc_click():void
		{
			trace("on_gjc_click");
		}

		private function on_jyc_click():void
		{
			trace("on_jyc_click");
		}

		private function on_dsc_click():void
		{
			trace("on_dsc_click");
		}
	}

}