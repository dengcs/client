package game.base {	
	import laya.utils.Dictionary;

	public class HandlerBase {
		private var dataDic:Dictionary = new Dictionary();

		public function get(key:*):* 
		{
			return dataDic.get(key);
		}

		public function set(key:*, value:*):void 
		{
			dataDic.set(key, value)
		}

		public function remove(key:*):Boolean
		{
			return dataDic.remove(key);
		}
	}
}