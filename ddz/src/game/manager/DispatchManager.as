package game.manager
{
	import game.manager.MessageManager;
	import laya.utils.Dictionary;
	import game.handler.PlayerHandler;
	import game.proto.NetMessage;
	import game.handler.RoomHandler;

	/**
	 * ...
	 * @dengcs
	 */
	public final class DispatchManager{
		private static  var _instance:DispatchManager = null;

		private var handlerDic:Dictionary = new Dictionary();

		public function DispatchManager(){
			if (_instance != null) {
                 throw new Error("只能用getInstance()来获取实例!");
             }else{
				 registerHandler();
			 }
		}

		public static function getInstance():DispatchManager
		{
			if (_instance == null) {
                _instance = new DispatchManager();
            }
            return _instance;
		}

		private function registerHandler():void
		{
			handlerDic.set("PlayerHandler", new PlayerHandler());
			handlerDic.set("RoomHandler", new RoomHandler());
		}

		public function messageDispatcher(ntMessage:NetMessage):void
		{
			MessageManager.getInstance().processMessage(ntMessage);				
		}

	}

}